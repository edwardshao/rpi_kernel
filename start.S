#include "config.h"
#include "hardware.h"

.globl _start
_start:

/* clear bss */
	ldr	r0, =(__bss_start)
	ldr	r1, =(__bss_end__)
	mov	r2, #0x00000000
bss_s:
	cmp	r0, r1
	bhs	bss_e			/* if (r0 < r1) goto bss_e */
	str	r2, [r0]
	add	r0, r0, #4
	b	bss_s
bss_e:

#if (1)
	b	init_c
#else
/* below code is used to play ARM asm */
/* setup GPIO */
	ldr	r0, =(GPIO_FSEL_1)	/* LED @ pin16, pin16 @ FSEL_1 */
	mov	r1, #0x001		/* 001b = GPIO pin is an output */
	lsl	r1, #18			/* 20-18bit is for pin16 */  
	str	r1, [r0]		/* set pin16 is output to FSEL_1 */

	mov	r1, #0x1
	lsl	r1, #16			/* note: keep r1 is untouched */

loop:
	bl	led_off
	bl	wait
	bl	led_on
	bl	wait
	b	loop

wait:
	mov	r0, #0x3F0000
wait_loop:
	sub	r0, #0x1
	cmp	r0, #0x0
	bne	wait_loop
	mov	pc, lr

led_on:
	ldr	r0, =(GPIO_CLR_0)
	str	r1, [r0]
	mov	pc, lr

led_off:
	ldr	r0, =(GPIO_SET_0)
	str	r1, [r0]
	mov	pc, lr
#endif

init_c:
/* setup stack */
	ldr	sp, =(CONFIG_STACK_BASE)
	bic	sp, sp, #7		/* 8-byte alignment for ABI compliance */
	ldr	r0, =0x00000000

/* jump to c */
	b	cmain

