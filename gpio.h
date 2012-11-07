#ifndef _GPIO_H_
#define _GPIO_H_

enum { GPIO_FSEL_INPUT, GPIO_FSEL_OUTPUT,
	GPIO_FSEL_ALT5, GPIO_FSEL_ALT_4,
	GPIO_FSEL_ALT0, GPIO_FSEL_ALT1,
	GPIO_FSEL_ALT2, GPIO_FSEL_ALT3,
};

extern void gpio_fsel(unsigned int pin, int fsel);
extern void gpio_output_set(unsigned int pin);
extern void gpio_output_clr(unsigned int pin);

#endif
