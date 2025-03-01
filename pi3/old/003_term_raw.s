///////////////////////////////////definitions//////////////////////////////////

_start:
	.set ENTRY_ADDRESS, (main-_start)	//entry point
	.set CODE_SIZE, (_end-_start)
	.set EXTRA_MEMORY_SIZE, 0			//runtime memory size
	.set LOAD_ADDRESS, 0x10000

	.include "include/elf_heder.s"
	.include "include/macro/addr.s"


////////////////////////////////////includes////////////////////////////////////

	.include "include/syscalls.s"
	.include "include/sys/term/term.s"


//////////////////////////////////main program//////////////////////////////////

main:
	bl term_init
	bl term_raw


	mov r0, #0
	mov r7, #SYS_EXIT
	swi #0

/////////////////////////////////runtime memory/////////////////////////////////
_end:
