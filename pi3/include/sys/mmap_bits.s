	.ifndef __SYS_MMAP_BITS__
	.set __SYS_MMAP_BITS__, 0

	//prot
	.set MMAP_READ, 1
	.set MMAP_WRITE, 2
	.set MMAP_EXEC, 4
	.set MMAP_NONE, 0
	.set MMAP_RW, (MMAP_READ+MMAP_WRITE)
	.set MMAP_RWX, (MMAP_RW+MMAP_EXEC)

	//flags
	.set MMAP_SHARED, 1
	.set MMAP_PRIVATE, 2
	.set MMAP_SHARED_VALIDATE, 3

	.set MMAP_FIXED, 0x10
	.set MMAP_FILE, 0
	.set MMAP_ANON, 0x20
	.set MMAP_HUGETLB, 0x40000


	.endif
