#ifndef _HARDWARE_H_
#define _HARDWARE_H_

#define SYS_IO_PHY_ADR_BASE	(0x20000000UL)

#define GPIO_PHY_ADR_BASE	(SYS_IO_PHY_ADR_BASE + 0x00200000UL)
#define GPIO_FSEL_0		(GPIO_PHY_ADR_BASE   + 0x00000000UL)
#define GPIO_FSEL_1		(GPIO_PHY_ADR_BASE   + 0x00000004UL)

#define GPIO_SET_0		(GPIO_PHY_ADR_BASE   + 0x0000001cUL)
#define GPIO_SET_1		(GPIO_PHY_ADR_BASE   + 0x00000020UL)

#define GPIO_CLR_0		(GPIO_PHY_ADR_BASE   + 0x00000028UL)
#define GPIO_CLR_1		(GPIO_PHY_ADR_BASE   + 0x0000002cUL)

#endif
