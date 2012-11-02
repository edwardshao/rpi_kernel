OUTPUT_FORMAT("elf32-littlearm", "elf32-littlearm", "elf32-littlearm")
OUTPUT_ARCH(arm)
ENTRY(_start)
SECTIONS {
	/* we start from 0x8000 */
	.text 0x8000 : {
		start.o(.text)
		*(.text)
	}
	. = ALIGN(4);
	.data : {
		*(.data)
	}
	. = ALIGN(4);
	.bss : {
		__bss_start = .;
		*(.bss)
		*(*COM)
		. = ALIGN(4);
		__bss_end__ = .;
	}
	/DISCARD/ : {
		*(*)
	}
}
