	.ifndef __TERM__
	.set __TERM__, 0

	//void term_init(void);
	//void term_raw(void);
	//void term_orig(void);

	.include "include/syscalls.s"
	.include "include/sys/term/bits.s"

term_init:
	push {r7}

	mov r0, #STDIN
	mov r1, #TCGETS
	ldr r2, term_init.ORIG_ADDR
	mov r7, #SYS_IOCTL
	swi #0

	//TODO: memcpy
	mov r0, #STDIN
	mov r1, #TCGETS
	ldr r2, term_init.RAW_ADDR
	mov r7, #SYS_IOCTL
	swi #0

	ldr r0, [r2]	//c_iflag
	ldr r1, term_init.IMASK
	bic r0, r0, r1
	str r0, [r2]

	ldr r0, [r2, #4]	//c_oflag
	ldr r1, term_init.OMASK
	bic r0, r0, r1
	str r0, [r2, #4]

	ldr r0, [r2, #8]	//c_cflag
	ldr r1, term_init.CMASK
	bic r0, r0, r1
	ldr r1, term_init.CSET
	orr r0, r0, r1
	str r0, [r2, #8]

	ldr r0, [r2, #12]	//c_lflag
	ldr r1, term_init.LMASK
	bic r0, r0, r1
	str r0, [r2, #12]

	pop {r7}
	mov pc, lr


term_init.ORIG_ADDR:
	addr4 term_init.ORIG
term_init.RAW_ADDR:
	addr4 term_init.RAW
term_init.ORIG:
	.rept 64
	.byte 0
	.endr
term_init.RAW:
	.rept 64
	.byte 0
	.endr

term_init.IMASK:
	.4byte TERM_IMASK
term_init.OMASK:
	.4byte TERM_OMASK
term_init.LMASK:
	.4byte TERM_LMASK
term_init.CMASK:
	.4byte TERM_CMASK
term_init.CSET:
	.4byte TERM_CSET


term_raw:
	push {r7}

	mov r0, #STDIN
	mov r1, #TCSETS
	ldr r2, term_init.RAW_ADDR
	mov r7, #SYS_IOCTL
	swi #0

	pop {r7}
	mov pc, lr

term_orig:
	push {r7}

	mov r0, #STDIN
	mov r1, #TCSETS
	ldr r2, term_init.ORIG_ADDR
	mov r7, #SYS_IOCTL
	swi #0

	pop {r7}
	mov pc, lr



	.endif
