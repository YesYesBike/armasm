	.ifndef __FUNC_EXIT__
	.set __FUNC_EXIT__, 0

	.include "include/syscalls.s"

exit:
	mov x8, SYS_EXIT
	svc #0

	.endif
