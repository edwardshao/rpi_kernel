CROSS_COMPILE	= arm-none-eabi-
CC		= $(CROSS_COMPILE)gcc
LD		= $(CROSS_COMPILE)ld
AS		= $(CROSS_COMPILE)as
OBJDUMP		= $(CROSS_COMPILE)objdump
OBJCOPY		= $(CROSS_COMPILE)objcopy

LDS   = kernel.lds
O_MAP = kernel.map
O_BIN = kernel.img
O_ELF = kernel.elf
O_DIS = kernel.dis
O_DEP = make.dep

SOBJS = start.o
COBJS = main.o gpio.o
OBJS  = $(SOBJS) $(COBJS)

include rule.mk

.PHONY: all gen_dep gen_all clean

all: gen_dep gen_all

gen_dep: *.c *.h
	$(CC) -M $(SOBJS:.o=.S) $(COBJS:.o=.c) > $(O_DEP)

gen_all: $(O_BIN)

$(O_BIN): $(O_ELF)
	$(OBJCOPY) $< -O binary $@

$(O_ELF): $(OBJS)
	$(LD) --no-undefined $(OBJS) -Map $(O_MAP) -o $(O_ELF) -T $(LDS)
	$(OBJDUMP) -d $(O_ELF) > $(O_DIS)

clean:
	-rm -f $(OBJS)
	-rm -f $(O_MAP) $(O_BIN) $(O_ELF) $(O_DIS) $(O_DEP)

-include make.dep
