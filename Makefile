
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

OBJS = start.o main.o

%.o: %.S config.h hardware.h
	$(CC) -O2 -D__ASSEMBLY__ -c -o $@ $<

%.o: %.c config.h hardware.h
	$(CC) -O2 -c -o $@ $<

.PHONY: all clean

all: gen_all

gen_all: $(O_BIN)

$(O_BIN): $(O_ELF)
	$(OBJCOPY) $< -O binary $@

$(O_ELF): $(OBJS)
	$(LD) --no-undefined $(OBJS) -Map $(O_MAP) -o $(O_ELF) -T $(LDS)

clean:
	-rm -f $(OBJS)
	-rm -f $(O_MAP) $(O_BIN) $(O_ELF)

