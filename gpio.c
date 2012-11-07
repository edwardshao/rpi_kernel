#include "gpio.h"
#include "hardware.h"
#include "io.h"

void gpio_fsel(unsigned int pin, int fsel)
{
	unsigned int bank;
	unsigned int offset;
	unsigned int value;

	// TODO: check pin value

	bank = pin / 10;
	offset = (pin - 10 * bank) * 3;

	value = mmio_read((unsigned int*)(GPIO_FSEL_0 + bank));
	// clear
	value &= ~(0x7 << offset);
	// set
	value |= fsel << offset;
	mmio_write((unsigned int*)(GPIO_FSEL_0 + bank), value);
}

static void _gpio_ouput(unsigned int pin, int set)
{
	unsigned int bank;
	unsigned int value;
	unsigned int offset;

	// TODO: check pin value

	bank = pin / 32;

	if (set)
		offset = GPIO_SET_0;
	else
		offset = GPIO_CLR_0;

	value = mmio_read((unsigned int*)(offset + bank));
	value |= 0x1 << pin;
	mmio_write((unsigned int*)(offset + bank), value);
}

void gpio_output_set(unsigned int pin)
{
	_gpio_ouput(pin, 1);
}

void gpio_output_clr(unsigned int pin)
{
	_gpio_ouput(pin, 0);
}

