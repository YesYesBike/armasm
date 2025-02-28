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

	.set BUF_LEN, 32
main:
	//mov r0, #STDIN
	ldr r1, main_BUF_ADDR
	mov r2, #BUF_LEN
	mov r7, #SYS_READ
	svc #0

	sub r0, r0, #1
	strb r5, [r1, r0]
	mov r4, r0

	mov r0, #STDOUT
	ldr r1, main_MSG_ADDR
	mov r2, #main_MSG_LEN
	mov r7, #SYS_WRITE
	svc #0

	mov r0, #STDOUT
	ldr r1, main_BUF_ADDR
	mov r2, r4
	svc #0

	mov r0, #STDOUT
	ldr r1, main_MSG2_ADDR
	mov r2, #main_MSG2_LEN
	svc #0

	eor r0, r0, r0
	mov r7, #SYS_EXIT
	svc #0

	.set main_MSG_LEN, (main_MSG2-main_MSG)
	.set main_MSG2_LEN, (main_MSG_END-main_MSG2)

main_MSG:
	.ascii "Do-mo, "
main_MSG2:
	.ascii "=san.\n"
main_MSG_END:

	.balign 8
main_BUF_ADDR:
	addr4 main_BUF
main_MSG_ADDR:
	addr4 main_MSG
main_MSG2_ADDR:
	addr4 main_MSG2

	.balign 8
main_BUF:
	.rept BUF_LEN
	.byte 0
	.endr

/////////////////////////////////runtime memory/////////////////////////////////
_end:
