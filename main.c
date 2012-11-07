#include "hardware.h"
#include "gpio.h"

#if (0)
static int static_num;
static int static_num_has_value = 10;
int global_num;
int global_num_has_value = 20;
#endif

static void setup_gpio()
{
	// pin 16 is led, set gpio to output
	gpio_fsel(16, GPIO_FSEL_OUTPUT);
}

static void led_on()
{
	gpio_output_clr(16);
}

static void led_off()
{
	gpio_output_set(16);
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
