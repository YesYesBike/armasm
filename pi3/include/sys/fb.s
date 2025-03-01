	.ifndef __SYS_FB__
	.set __SYS_FB__, 0

	.include "include/syscalls.s"
	.include "include/sys/mmap_bits.s"
	.include "include/sys/fb_def.s"

	//bits_per_pixel: 16(rgb565)
	//may differ by monitor?


	//NOTE Should have a permission for /dev/fb0

	//void *fb_init(void);
	//return framebuffer memory address on success
	//0 on fail

	//additional reutrn value
	//r1: framebuffer size
	//r2: xres
	//r3: yres


fb_init:
	stmfd sp!, {r4, r5, r7}
	sub sp, sp, #160			//allocate memory for fb info

	ldr r0, fb_init.FBPATH_ADDR
	mov r1, #SYS_O_RDWR
	mov r7, #SYS_OPEN
	swi #0

	tst r0, r0				//if r0 < 0
	bmi fb_init.fail		//then fail

	str r0, fb_init.FD
	mov r4, r0				//r4 holds fd

	mov r1, #FB_GETFINFO
	mov r2, sp
	mov r7, #SYS_IOCTL
	swi #0

	ldr r1, [sp, #20]		//smem_len
	str r1, fb_init.FBLEN

	mov r0, #0				//NULL
	//r1: length
	mov r2, #MMAP_RW
	mov r3, #MMAP_SHARED	//HUGETLB not supported...
	//r4: fd
	mov r5, #0
	mov r7, #SYS_MMAP2		//using 7 registers for one syscall...
	swi #0

	//TODO proper error check: (void*)-1 or other value
	tst r0, r0				//if r0 < 0
	bmi fb_init.fail		//then fail

	str r0, fb_init.FB
	mov r5, r0				//r5 holds fb

	mov r0, r4
	mov r1, #FB_GETVINFO
	mov r2, sp
	mov r7, #SYS_IOCTL
	swi #0

	mov r0, r5				//fb
	ldr r1, fb_init.FBLEN	//len
	ldr r2, [sp]			//xres
	ldr r3, [sp, #4]		//yres

	b fb_init.done


fb_init.fail:
	mov r0, #0
fb_init.done:
	add sp, sp, #160
	ldmfd sp!, {r4, r5, r7}
	mov pc, lr		//bx lr

fb_init.FBPATH_ADDR:
	addr4 fb_init.FBPATH
fb_init.FBPATH:
	.ascii "/dev/fb0\0"
	.balign 4
fb_init.FD:		//File Descriptor
	.4byte 0
fb_init.FB:		//Framebuffer
	.4byte 0
fb_init.FBLEN:	//smem_len
	.4byte 0



	//void fb_close(void);
fb_close:
	ldr r0, fb_init.FD
	mov r7, #SYS_CLOSE
	swi #0

	ldr r0, fb_init.FB
	ldr r1, fb_init.FBLEN
	mov r7, #SYS_MUNMAP
	swi #0

	mov pc, lr

	.endif
