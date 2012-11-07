#ifndef _IO_H_
#define _IO_H_

static inline
unsigned int mmio_read(const volatile unsigned int *mem_addr)
{
	return *(mem_addr);
}

static inline
void mmio_write(volatile unsigned int *mem_addr, const unsigned int value)
{
	*mem_addr = value;
}

#endif

