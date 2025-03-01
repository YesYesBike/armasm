	.ifndef __SYS_FB_DEF__
	.set __SYS_FB_DEF__, 0

	//see /usr/include/linux/fb.h
	//see kernel framebuffer documentations(https://docs.kernel.org/fb/index.html)


	//NOTE 32bit
	//struct fb_fix_screeninfo {
	//	char id[16];				0
	//	unsigned long smem_start;	16		//NOTE long in 32bit
	//	__u32 smem_len;				20
	//	__u32 type;					24
	//	__u32 type_aux;				28
	//	__u32 visual;				32
	//	__u16 xpanstep;				36
	//	__u16 ypanstep;				38
	//	__u16 ywrapstep;			40
	//	__u32 line_length;			44		//padding
	//	unsigned long mmio_start;	48
	//	__u32 mmio_len;				52
	//	__u32 accel;				56
	//	__u16 capabilities;			60
	//	__u16 reserved[2];			62
	//};


	//struct fb_bitfield {
	//	__u32 offset;
	//	__u32 length;
	//	__u32 msb_right;
	//};
	//12

	//struct fb_var_screeninfo {
	//	__u32 xres;						0
	//	__u32 yres;						4
	//	__u32 xres_virtual;				8
	//	__u32 yres_virtual;				12
	//	__u32 xoffset;					16
	//	__u32 yoffset;					20
	//	__u32 bits_per_pixel;			24
	//	__u32 grayscale;				28
	//	struct fb_bitfield red;			32
	//	struct fb_bitfield green;		44
	//	struct fb_bitfield blue;		56
	//	struct fb_bitfield transp;		68
	//	__u32 nonstd;					80
	//	__u32 activate;					84
	//	__u32 height;					88
	//	__u32 width;					92
	//	__u32 accel_flags;				96
	//	__u32 pixclock;					100
	//	__u32 left_margin;				104
	//	__u32 right_margin;				108
	//	__u32 upper_margin;				112
	//	__u32 lower_margin;				116
	//	__u32 hsync_len;				120
	//	__u32 vsync_len;				124
	//	__u32 sync;						128
	//	__u32 vmode;					132
	//	__u32 rotate;					136
	//	__u32 colorspace;				140
	//	__u32 reserved[4];				144
	//};

	//ioctl bits
	.set FB_GETVINFO, 0x4600
	.set FB_PUTVINFO, 0x4601
	.set FB_GETFINFO, 0x4602

	.endif
