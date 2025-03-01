	.ifndef __SYSCALLS__
	.set __SYSCALLS__, 0

	//SYSCALLS
	.set SYS_EXIT, 1
	.set SYS_READ, 3
	.set SYS_WRITE, 4
	.set SYS_OPEN, 5
	.set SYS_CLOSE, 6
	.set SYS_IOCTL, 54
	.set SYS_MUNMAP, 91
	.set SYS_NANOSLEEP, 162
	.set SYS_MMAP2, 192

	//fd
	.set STDIN, 0
	.set STDOUT, 1
	.set STDERR, 2

	//permission
	.set PERM_DEF, 0644
	.set PERM_EXE, 0755

	.include "include/sys/open_bits.s"


	.endif
