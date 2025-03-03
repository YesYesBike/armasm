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

//////////////////////////////////main program//////////////////////////////////

main:
    mov r7, #SYS_WRITE
    mov r0, #STDOUT
	load_addr r1, TEXT

    mov r2, #(TEXT_END-TEXT)
    swi #0

    mov r7, #SYS_EXIT
    mov r0, #0
    swi #0

TEXT:
    .ascii "hello\n"
TEXT_END:




/////////////////////////////////runtime memory/////////////////////////////////
_end:
