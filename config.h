#ifndef _CONFIG_H_
#define _CONFIG_H_

#define CONFIG_SDRAM_BASE	0x00000000
#define CONFIG_SDRAM_SIZE	0x08000000	/* 128 MiB */

#define CONFIG_TEXT_BASE	0x8000
#define CONFIG_STACK_BASE	(CONFIG_SDRAM_BASE + CONFIG_SDRAM_SIZE)

#endif