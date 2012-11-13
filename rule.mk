# pattern rule
%.o: %.S
	$(CC) -O2 -D__ASSEMBLY__ -c -o $@ $<

%.o: %.c
	$(CC) -O2 -c -o $@ $<

