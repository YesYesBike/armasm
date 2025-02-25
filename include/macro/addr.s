	.ifndef __MACRO_ADDR__
	.set __MACRO_ADDR__, 0

	//address in 4 byte integer
	.macro addr4 addr
	.int (LOAD_ADDRESS+(\addr-_start))
	.endm

	//address in 8 byte integer
	.macro addr8 addr
	.quad (LOAD_ADDRESS+(\addr-_start))
	.endm

	.endif
