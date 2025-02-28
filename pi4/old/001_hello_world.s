///////////////////////////////////definitions//////////////////////////////////
_start:
	.set ENTRY_ADDRESS, (main-_start)	//entry point
	.set CODE_SIZE, (_end-_start)
	.set EXTRA_MEMORY_SIZE, 0			//runtime memory size
	.set LOAD_ADDRESS, 0x20000

	.include "include/elf_heder.s"


////////////////////////////////////includes////////////////////////////////////
	.include "include/macro/addr.s"
	.include "include/syscalls.s"


//////////////////////////////////main program//////////////////////////////////
main:
	mov x8, SYS_WRITE
	mov x0, STDOUT
	ldr w1, main_TEXT_ADDRESS
	mov x2, (main_TEXT_END-main_TEXT)
	svc #0

	mov x8, SYS_EXIT
	mov x0, #0
	svc #0

main_TEXT:
	.ascii "Hello World\n"
main_TEXT_END:
	.align 4

main_TEXT_ADDRESS:		//the biggest problem of risc?
	addr4 main_TEXT

_end:

/////////////////////////////////runtime memory/////////////////////////////////
