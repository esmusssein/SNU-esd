CC := /usr/local/arm/arm-2010q1/bin/arm-none-eabi-gcc
obj-m := blackscholes.o
KDIR := /android/linux-2.6.35-hanback
PWD := $(shell pwd)


default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
	rm -f default

clean:
	rm -f *.ko *.o *.mod.* .*.cmd Module.symvers modules.order -r .tmp_versions 
