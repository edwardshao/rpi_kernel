#include "hardware.h"

#if (0)
static int static_num;
static int static_num_has_value = 10;
int global_num;
int global_num_has_value = 20;
#endif

static void setup_gpio()
{
	volatile unsigned int *gpio_mmio = (unsigned int*)GPIO_FSEL_1;
	(*gpio_mmio) = (0x1 << 18);
}

static void led_on()
{
	volatile unsigned int *gpio_mmio = (unsigned int*)GPIO_CLR_0;
	(*gpio_mmio) = (0x1 << 16);
}

static void led_off()
{
	volatile unsigned int *gpio_mmio = (unsigned int*)GPIO_SET_0;
	(*gpio_mmio) = (0x1 << 16);
}

static void wait()
{
	int count = 0x3F0000;
	while (count-- > 0) {
		__asm__ __volatile__ ("nop");
	}
}

void cmain()
{
	setup_gpio();

	while (1) {
		led_on();
		wait();
		led_off();
		wait();
	}
}
