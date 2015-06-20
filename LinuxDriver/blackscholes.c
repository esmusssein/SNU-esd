/**
 * A Linux driver for 2015 Seoul National University Embedded System Deisgn
 * Course project. The purpose of project is designing and exploiting hardware
 * accelerator to compute Black= It is to communicate with FPGA board
 */
#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/sched.h>
#include <linux/signal.h>
#include <linux/irq.h>
#include <asm/uaccess.h>
#include <linux/fs.h>
#include <asm/io.h>
#include <linux/ioport.h>
#include <mach/regs-gpio.h>
#include <mach/gpio.h>
#include <mach/gpio-bank.h>
#include <plat/gpio-cfg.h>
#include "blackscholes.h"

#define DRIVER_AUTHOR         "2015team06"
#define DRIVER_DESC           "Blackscholes Driver"
#define DRIVER_MAJOR          240
#define DRIVER_NAME           "Blackscholes Driver"
#define DRIVER_MODULE_VERSION "v0.1"
#define IO_MEM_ADDRESS        0x88000000
#define IO_MEM_RANGE          0x02000000
#define FPGA_IRQ              IRQ_EINT8

static int drv_lock = 0;
static void *io_mem_start;
static void *io_mem_end;

/**
 * Opens the driver.
 */
static int drv_open(struct inode *inode, struct file *file)
{
    // TODO: mutex?
    if (drv_lock)
        return -EBUSY;
    drv_lock = 1;
    return 0;
}

/**
 * Release the driver.
 */
static int drv_release(struct inode *inode, struct file *file)
{
    // TODO: mutext?
    drv_lock = 0;
    return 0;
}

/**
 * Writes bytes. This supports lbuf for only a multiple of 2 and copies two
 * bytes at several times because of a constraint of the device.
 */
static ssize_t
drv_write(struct file *file, const char __user *buf, size_t lbuf, loff_t *ppos)
{
    int i;

    // printk(KERN_INFO"drv_write(): lbuf: %d\n", lbuf);
    printk(KERN_INFO"drv_write(): buf: %x, *ppos %d\n", *(unsigned int *)buf, (unsigned int)*ppos);
    // printk(KERN_INFO"drv_write(): buf[0]: %x\n", *(unsigned char *)buf);
    // printk(KERN_INFO"drv_write(): buf[1]: %x\n", *(unsigned char *)(buf+1));
    // printk(KERN_INFO"drv_write(): buf[2]: %x\n", *(unsigned char *)(buf+2));
    // printk(KERN_INFO"drv_write(): buf[3]: %x\n", *(unsigned char *)(buf+3));

    if (io_mem_start + *ppos + lbuf >= io_mem_end) {
        printk(KERN_WARNING"drv_write(): tried to write data over given an io memory. Refuse the request.");
        return -EINVAL;
    }
    if (lbuf % 2 != 0) {
        printk(KERN_WARNING"drv_write(): lbuf should be a multiple of 2. Refuse the request.");
        return -EINVAL;
    }

    for (i = 0; i < lbuf/2; i++) {
        iowrite16(*(unsigned short *)(buf + i*2), io_mem_start + *ppos + i*2);
    }
    *ppos += lbuf;
    return 0;
}

/**
 * Reads bytes. This supports lbuf for only a multiple of 2 and copies two
 * bytes at several times because of a constraint of the device.
 */
static ssize_t
drv_read(struct file *inode, char __user *buf, size_t lbuf, loff_t *ppos)
{
    int i;

    if (io_mem_start + *ppos + lbuf >= io_mem_end) {
        printk(KERN_WARNING"drv_write(): tried to write data over given an io memory. Refuse the request.");
        return -EINVAL;
    }
    if (lbuf % 2 != 0) {
        printk(KERN_WARNING"drv_write(): lbuf should be a multiple of 2. Refuse the request.");
        return -EINVAL;
    }

    // TODO: verify read operation.
    for (i = 0; i < lbuf/2; i++) {
        *(unsigned short *)(buf + i*2) = ioread16(io_mem_start + *ppos + i*2);
    }
    *ppos += lbuf;
    return 0;
}

/**
 * Changes a file seeking point.
 */
static loff_t drv_lseek(struct file *file, loff_t offset, int orig)
{
    loff_t testpos;
    switch (orig) {
    case SEEK_SET:
        testpos = offset;
        break;
    case SEEK_CUR:
        testpos = file->f_pos + offset;
        break;
    case SEEK_END:
        // Not used in this driver.
        return -EINVAL;
    default:
        return -EINVAL;
    }
    if (io_mem_start + testpos >= io_mem_end)
        return -EINVAL;
    file->f_pos = testpos;
    printk(KERN_INFO"Seeking to pos %d\n", (int)testpos);
    return testpos;
}

/**
 * Define file_operations.
 */
static struct file_operations drv_fops = {
    .owner  = THIS_MODULE,
    .open   = drv_open,
    .write  = drv_write,
    .read   = drv_read,
    .release = drv_release,
    .llseek = drv_lseek
};

/**
 * Handles interrupts.
 */
static irqreturn_t drv_intr(int irq, void *dev_id)
{
    printk(KERN_INFO"drv_intr(): irq %d\n", irq);
    return IRQ_HANDLED;
}

/**
 * Initializes to get IO mapped memory address.
 */
void init_io_mem(void)
{
    io_mem_start = ioremap(IO_MEM_ADDRESS, IO_MEM_RANGE);
    while (check_mem_region((unsigned long)io_mem_start, IO_MEM_RANGE) != 0) {
        iounmap(io_mem_start);
        io_mem_start = ioremap(IO_MEM_ADDRESS, IO_MEM_RANGE);
    }
    request_mem_region((unsigned long)io_mem_start, IO_MEM_RANGE, DRIVER_NAME);
    io_mem_end = io_mem_start + IO_MEM_RANGE;
    printk(KERN_INFO"Leaving init_io_mem(): io_mem_start %x, io_mem_end %x\n",
        (unsigned int)io_mem_start, (unsigned int)io_mem_end);
}

/**
 * Initializes interrupt-related.
 */
int init_drv_intr(void)
{
    int *addr;
    int result;
    // Unset IRQ mask.
    addr = S5P_EINT_MASK(1);
    *addr &= 0xFFFFFFFE;

    // Let the interrupt triggered for rising edge signal.
    addr = S5P_EINT_CON(1);
    *addr &= 0xFFFFFFF0;
    *addr |= 0x00000003;

    // Let the GPIO pin function interrupt trigger.
    s3c_gpio_cfgpin(EINT_GPIO_1(0), EINT_MODE);

    // Register IRQ.
    result = request_irq(FPGA_IRQ, drv_intr, 0, DRIVER_NAME, NULL);
    if (result != 0) {
        printk(KERN_WARNING"Couldn't request IRQ %d\n", FPGA_IRQ);
        return result;
    }
    printk(KERN_INFO"init_drv_intr(): IRQ %d\n", FPGA_IRQ);
    return 0;
}

/**
 * Initializes the driver as a kernel module.
 */
static int __init drv_init(void)
{
    int result;
    init_io_mem();
    result = init_drv_intr();
    if (result < 0)
        return result;
    // Register this driver into the system.
    result = register_chrdev(DRIVER_MAJOR, DRIVER_NAME, &drv_fops);
    if (result < 0) {
        printk(KERN_WARNING"Couldn't get any major.\n");
        return result;
    }
    printk(KERN_INFO"Leaving drv_init(): major number: %d\n", DRIVER_MAJOR);
    return 0;
}

/**
 * Exits the driver as a kernel module.
 */
static void __exit drv_exit(void)
{
    release_mem_region((unsigned long)io_mem_start, IO_MEM_RANGE);
    iounmap(io_mem_start);
    unregister_chrdev(DRIVER_MAJOR, DRIVER_NAME);
    free_irq(FPGA_IRQ, NULL);
    printk(KERN_INFO"Leaving drv_exit(): driver name %s\n", DRIVER_NAME);
}

module_init(drv_init);
module_exit(drv_exit);

MODULE_AUTHOR(DRIVER_AUTHOR);
MODULE_DESCRIPTION(DRIVER_DESC);
MODULE_LICENSE("Dual BSD/GPL");
