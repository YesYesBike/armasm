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
	.include "include/sys/fb.s"

//////////////////////////////////main program//////////////////////////////////

	//filling framebuffer
	//r4: current address
	//r5: endpoint
	//r6: backup
	//r8: color

	//TODO
	//1. double buffering
	//2. loop

main:
	bl fb_init		//r0: fb address / r1: fb len / r2: xres / r3: yres

	mov r4, r0		//r4: current
	add r5, r0, r1	//r5: endpoint
	mov r6, r0		//r6: backup
	mov r7, #SYS_NANOSLEEP

main.loop:

	mov r8, #0xf81f	//magenta
main.loop_magenta:
	strh r8, [r4], #2
	cmp r4, r5
	bne main.loop_magenta

	ldr r0, main.TIME_ADDR
	mov r1, #0
	swi #0

	mov r4, r6
	mov r8, #0x07ff	//cyan

main.loop_cyan:
	strh r8, [r4], #2
	cmp r4, r5
	bne main.loop_cyan

	ldr r0, main.TIME_ADDR
	mov r1, #0
	swi #0

	mov r4, r6
	mov r8, #0xffe0	//yellow

main.loop_yellow:
	strh r8, [r4], #2
	cmp r4, r5
	bne main.loop_yellow

	ldr r0, main.TIME_ADDR
	mov r1, #0
	swi #0

	mov r4, r6
	b main.loop




	//never reached...

main.TIME_ADDR:
	addr4 main.TIME
main.TIME:				//struct timespec
	.4byte 0			//tv_sec
	.4byte 50000000		//tv_nsec: 0.05sec


/////////////////////////////////runtime memory/////////////////////////////////
_end:
