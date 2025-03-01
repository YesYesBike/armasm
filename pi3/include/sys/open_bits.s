	.ifndef __SYS_OPEN_BITS__
	.set __SYS_OPEN_BITS__, 0

	//see /usr/include/bits/fcntl-linux.h

	.set SYS_O_RD,		0
	.set SYS_O_WR,		1
	.set SYS_O_RDWR,	2
	.set SYS_O_CREAT,	0100
	.set SYS_O_TRUNC,	01000
	.set SYS_O_APPEND,	02000

	.endif
