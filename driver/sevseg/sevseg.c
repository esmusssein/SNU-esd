// For Linux Kernel Module Programming.
// See http://www.tldp.org/LDP/lkmpg/2.6/html/lkmpg.html.
#include <linux/init.h>
#include <linux/module.h>
// For printk().
#include <linux/kernel.h>
// For copy_from_user().
#include <asm/uaccess.h>
// For file-related operations, structs and functions like register_blkdev(),
// unregister_blkdev().
#include <linux/fs.h>
// For ioremap(), iounmap().
#include <asm/io.h>
// For check_mem_region(), request_mem_region(), release_mem_region().
#include <linux/ioport.h>
// For a interrupt-related API.
#include <linux/interrupt.h>
#include <linux/sched.h>
#include <linux/signal.h>
#include <linux/irq.h>
#include <mach/regs-gpio.h>
#include <mach/gpio.h>
#include <mach/gpio-bank.h>
#include <plat/gpio-cfg.h>
#include "sevseg.h"

#define DRIVER_AUTHOR      "esd2015team6"
#define DRIVER_DESC        "Seven Segment Driver"
#define DRIVER_MAJOR       240
#define DRIVER_NAME        "Seven Segment"
#define IO_MEM_ADDRESS     0x88000030
#define IO_MEM_RANGE       0x100
#define FPGA_IRQ           IRQ_EINT8
#define IO_MEM_READ_OFFSET 4

int init_dev_intr(void);
void init_iomap(void);

static int is_in_used = 0;
static void *io_mem_start;

/**
 * An application tries to open this driver.
 */
int driver_open(struct inode *inode, struct file *file) {
    // TODO: mutex
    if (is_in_used)
        return -EBUSY;
    is_in_used = 1;
    return 0;
}

/**
 * Called when an application closed this driver.
 */
int driver_release(struct inode *inode, struct file *file) {
    // TODO: mutex
    is_in_used = 0;
    return 0;
}

/**
 * An application tries to write bytes of given a length to the device.
 */
ssize_t driver_write_byte(struct file *file, const char *data, size_t len,
                            loff_t *loff) {
    int i;
    // Hack this function to be able to write 'bytes'.
    // TODO: make this driver a 'block device driver'.
    printk(KERN_INFO"driver_write_byte(): data %x\n", *(unsigned int *)data);

    // It's not gonna work if you pass given a len as more than 1.
    // TODO: how about 2?
    //if (copy_from_user(io_mem_start, data, len) < 0) {
    //    return -1;
    //}

    for (i = len-1; i >= 0; i--) {
        int rst = copy_from_user(io_mem_start+i, data+i, 1);
        if (rst < 0)
            return rst;
    }
    return len;
}

/**
 * An application tries to read a byte from the device.
 */
ssize_t driver_read_byte(struct file *fp, char *data, size_t len, loff_t *off) {
    int i; 
    void *read_io_mem_start = io_mem_start + IO_MEM_READ_OFFSET;
    for (i = 0; i < len; i++) {
        int rst = copy_to_user(data+i, read_io_mem_start+i*2, 1);
        if (rst < 0)
            return rst;
    }
    printk(KERN_INFO"driver_read_byte(): *read_io_mem_start: %x\n", *(unsigned int *)read_io_mem_start);
    return len;   
}

/**
 * Mapping file operation functions.
 */
static struct file_operations driver_fops = {
    .owner = THIS_MODULE,
    .open = driver_open,
    .release = driver_release,
    .write = driver_write_byte,
    .read = driver_read_byte
};

/**
 * A callback of a interrupt from the device.
 */
static irqreturn_t dev_intr(int irq, void *dev_id) {
    printk("dev_intr: irq %d, dev_id %x\n", irq, (unsigned int)dev_id);
    return IRQ_HANDLED;
}

/**
 * Initialize interrupts from the device.
 */
int init_dev_intr() {
    unsigned int *addr;
    // Unset IRQ mask.
    addr = S5P_EINT_MASK(1);
    *addr &= 0xFFFFFFFE;
    // Let the interrupt be triggered at rising edge.
    addr = S5P_EINT_CON(1);
    *addr &= 0xFFFFFFF0;
    *addr |= 0x00000003;
    // Make a function of given a GPIO pin interrupt.
    s3c_gpio_cfgpin(EINT_GPIO_1(0), EINT_MODE);
    // Register a handler of the interrupt.
    if (request_irq(FPGA_IRQ, dev_intr, 0, DRIVER_NAME, NULL) < 0) {
        printk(KERN_WARNING"Can't request IRQ #%d\n", FPGA_IRQ);
        return -1;
    }
    printk(KERN_INFO"Initialized a interrupt handler, IRQ Number: %d\n",
        FPGA_IRQ);
    return 1;
}

/**
 * Initialize iomap.
 */
void init_iomap() {
    // Remap given a memory address space for I/O, verify mapped region and
    // request the region finally.
    io_mem_start = ioremap(IO_MEM_ADDRESS, IO_MEM_RANGE);
    while (!check_mem_region((unsigned long)io_mem_start, IO_MEM_RANGE)) {
        printk(KERN_INFO"!check_mem_region\n");
        iounmap(io_mem_start);
        io_mem_start = ioremap(IO_MEM_ADDRESS, IO_MEM_RANGE);
    }
    request_mem_region((unsigned long)io_mem_start, IO_MEM_RANGE, DRIVER_NAME);
}

/**
 * Initializes this driver.
 */
int driver_init(void) {
    init_iomap();
    init_dev_intr();
    // Register this driver into the system.
    if (register_chrdev(DRIVER_MAJOR, DRIVER_NAME, &driver_fops) < 0) {
        printk(KERN_WARNING"Could not register this driver.\n");
        return -1;
    }
    printk(KERN_INFO"driver_init() done with a major number %d.\n",
        DRIVER_MAJOR);
    return 0;
}

/**
 * Called when the system unregisters this driver.
 */
void driver_exit(void) {
    release_mem_region((unsigned long)io_mem_start, IO_MEM_RANGE);
    iounmap(io_mem_start);
    unregister_chrdev(DRIVER_MAJOR, DRIVER_NAME);
    free_irq(FPGA_IRQ, NULL);
    printk(KERN_INFO"Driver: %s exit\n", DRIVER_NAME);
}

module_init(driver_init);
module_exit(driver_exit);

MODULE_AUTHOR(DRIVER_AUTHOR);
MODULE_DESCRIPTION(DRIVER_DESC);
MODULE_LICENSE("Dual BSD/GPL");
