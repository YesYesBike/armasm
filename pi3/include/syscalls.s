	.ifndef __SYSCALLS__
	.set __SYSCALLS__, 0

	//SYSCALLS
	.set SYS_EXIT, 1
	.set SYS_READ, 3
	.set SYS_WRITE, 4
	.set SYS_IOCTL, 54


	//fd
	.set STDIN, 0
	.set STDOUT, 1
	.set STDERR, 2


	.endif
