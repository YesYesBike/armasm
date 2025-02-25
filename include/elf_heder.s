	.ifndef __ELF_HEDER__
	.set __ELF_HEDER__, 0

	//ELF Header
	.ascii "\177ELF"			//e_ident[EI_MAG]: ELF magic number
	.byte 0x02					//e_ident[EI_CLASS]: 1: 32-bit, 2: 64-bit
	.byte 0x01					//e_ident[EI_DATA]: 1: little, 2: big
	.byte 0x01					//e_ident[EI_VERSION]: ELF header version; must be 1
	.byte 0x00					//e_ident[EI_OSABI]: Target OS ABI; should be 0
	.byte 0x00					//e_ident[EI_ABIVERSION]: ABI version; 0 is ok for Linux
	.rept 7
	.byte 0x00
	.endr						//e_ident[EI_PAD]: unused, should be 0
	.short 0x0002				//e_type: object file type; 2: executable
	.short 0x00B7				//e_machine: instruction set architecture / Aarch64
	.int 0x00000001				//e_version: ELF identification version; must be 1
	.quad (LOAD_ADDRESS+ENTRY_ADDRESS)			//e_entry: memory address of entry point (where process starts)
	.quad 0x40					//e_phoff: program header offset
	.quad 0x0					//e_shoff: section header offset
	.int 0x0					//e_flags: none
	.short 0x40					//e_ehsize: sizeof ELF_HEADER
	.short 0x38					//e_phentsize: sizeof PROGRAM_HEADER
	.short 0x01					//e_phnum: number of program header entries: ONE
	.short 0x00					//e_shentsize: sizeof each section header entries
	.short 0x00					//e_shnum: number of each section header entries
	.short 0x00					//e_shstrndx: index of section header tables

	//Program Header
	.int 0x01					//p_type: segment type; 1: loadable
	.int 0x07					//p_flags: segment-dependent flags (1: X, 2: W, 4: R)
	.quad 0x78					//p_offset: offset of code start in file (0x40+0x38)
	.quad (LOAD_ADDRESS+0x78)	//p_vaddr: virtual address of segment in memory
	.quad 0x0					//p_paddr: physical address(ignored?)
	.quad CODE_SIZE				//p_filesz: sizeof segment in file image(disk)
	.quad (CODE_SIZE+EXTRA_MEMORY_SIZE)	//p_memsz: sizeof segment in memory
	.quad 0x0					//p_align: alignment (doesn't matter, only 1 segment)

	.endif
