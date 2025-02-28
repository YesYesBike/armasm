///////////////////////////////////definitions//////////////////////////////////

_start:
	.set ENTRY_ADDRESS, (main-_start)	//entry point
	.set CODE_SIZE, (_end-_start)
	.set LOAD_ADDRESS, 0x20000

	.set EXTRA_MEMORY_SIZE, 0			//runtime memory size

	.include "include/elf_heder.s"


////////////////////////////////////includes////////////////////////////////////

	.include "include/macro/addr.s"
	.include "include/syscalls.s"
	.include "include/sys/exit.s"


//////////////////////////////////main program//////////////////////////////////

//INPUT
//x0: int array
//x1: cnt

//OUTPUT
//x0: sum

//x9: endpoint(bit flipped)
//x10: sum
//x11: temp

sum:
	add x9, x0, x1
	mov x10, #0

sum_loop:
	cmp x0, x9
	beq sum_done

	ldrb w11, [x0]
	add x10, x10, x11
	add x0, x0, #1

	b sum_loop

sum_done:
	mov x0, x10
	ret


main:
	ldr w0, main_ARR_ADDR
	mov w1, (main_ARR_END-main_ARR)
	bl sum

	b exit

main_ARR:
	.byte 1, 2, 3, 4, 5, 99
main_ARR_END:
	.align 8
main_ARR_ADDR:
	addr4 main_ARR

_end:

/////////////////////////////////runtime memory/////////////////////////////////
