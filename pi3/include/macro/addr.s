	.ifndef __MACRO_ADDR__
	.set __MACRO_ADDR__, 0

	//address in 4 byte integer
	.macro addr4 addr
	.4byte (LOAD_ADDRESS+(\addr-_start))
	.endm


	//load the address into register
	.macro load_addr reg, addr
    add \reg, pc, #(\addr-(.+8))
    .endm

	.endif
