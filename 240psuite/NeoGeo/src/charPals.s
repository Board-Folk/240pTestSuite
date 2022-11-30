.globl logo_Palettes
logo_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl sonic_back_Palettes
sonic_back_Palettes:
	.word	0x0002 ;* 2 palettes
	.word	0x8000, 0x020b, 0xb24d, 0x179f, 0x3bdf, 0x7dff, 0x2040, 0x44b0, 0x68f0, 0x2060, 0x0200, 0x8720, 0x6840, 0x6fd0, 0xcd70, 0x879b
	.word	0x8000, 0x0200, 0x6840, 0x8720, 0x879b, 0x179f, 0x3bdf, 0x58bf, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl sonic_water_Palettes
sonic_water_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x879b, 0x3bdf, 0x58bf, 0x929d, 0x179f, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl sonic_floor_Palettes
sonic_floor_Palettes:
	.word	0x0003 ;* 3 palettes
	.word	0x8000, 0x6840, 0x0d70, 0x2720, 0xc200, 0x6f80, 0x44b0, 0x68f0, 0x0070, 0x2040, 0x1dbf, 0x3b8f, 0x587f, 0x7fff, 0x6880, 0x8000
	.word	0x8000, 0xc200, 0x7888, 0x0bbb, 0x7fff, 0x2720, 0x7444, 0x44b0, 0x6880, 0x6ff0, 0xf242, 0x6440, 0x5474, 0x58d8, 0x2787, 0x8000
	.word	0x8000, 0x6880, 0x6440, 0x44b0, 0x68f0, 0x7fff, 0x0070, 0x2040, 0xc200, 0x6840, 0x0d70, 0x2720, 0x6f80, 0x4fd0, 0x8000, 0x8000

.globl kiki_Palettes
kiki_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xb742, 0xd874, 0xab87, 0xf484, 0xf888, 0x8000, 0xc270, 0x7444, 0xc800, 0x1d74, 0x8bbb, 0xe420, 0x8000, 0x8000, 0x8000

.globl scroll_grid_Palettes
scroll_grid_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xfeee, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorchart_Palettes
colorchart_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x5fff, 0x8000, 0x7fff, 0x4f00, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorebu75_Palettes
colorebu75_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7bbb, 0x6bb0, 0x30bb, 0x20b0, 0x5b0b, 0x4b00, 0x100b, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorebu75_304_Palettes
colorebu75_304_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7bbb, 0x6bb0, 0x30bb, 0x20b0, 0x4b00, 0x100b, 0x8000, 0x5b0b, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl monoscopes_Palettes
monoscopes_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x4f00, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl grids_Palettes
grids_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x4f00, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl overscan_horz_Palettes
overscan_horz_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl overscan_vert_Palettes
overscan_vert_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl back_Palettes
back_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x004c, 0xf26e, 0xd48e, 0x0ccc, 0xfeee, 0x8008, 0x8000, 0x0222, 0x0444, 0xf666, 0xd6ae, 0x8000, 0x8000, 0x8000, 0x8000

.globl gillian_Palettes
gillian_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x3b84, 0x6fdb, 0xcd97, 0x7fff, 0xa742, 0x8972, 0x7000, 0x8333, 0x6422, 0xa740, 0x7444, 0x0222, 0x7111, 0x8000

.globl gblink1_Palettes
gblink1_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xefdb, 0x8000, 0xcd97, 0x7fff, 0x2741, 0x8972, 0x8bbb, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl gblink2_Palettes
gblink2_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xefdb, 0x8000, 0xcd97, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl title_Palettes
title_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xfeee, 0x0ccc, 0x004c, 0x8008, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl messagebox_Palettes
messagebox_Palettes:
	.word	0x0003 ;* 3 palettes
	.word	0x8000, 0xa742, 0x4872, 0xb522, 0x8000, 0x0222, 0xcd97, 0x6fdb, 0x748f, 0x517f, 0x917f, 0x0111, 0x7444, 0x5676, 0x8000, 0x8000
	.word	0x8000, 0x6fdb, 0x8000, 0xcd97, 0xb522, 0xa742, 0x4872, 0x7fff, 0x748f, 0x517f, 0xb04d, 0x203b, 0x1111, 0x5676, 0x7444, 0x0111
	.word	0x8000, 0x748f, 0x517f, 0xb04d, 0x203b, 0x917f, 0x8000, 0x0111, 0x1111, 0x7444, 0x5676, 0xf6af, 0x4111, 0x7fff, 0x0222, 0x8000

.globl pluge_Palettes
pluge_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x7000, 0x5fff, 0x8ccc, 0x8888, 0x0444, 0x0001, 0x1000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorchartsingle_Palettes
colorchartsingle_Palettes:
	.word	0x0004 ;* 4 palettes
	.word	0x8000, 0x7000, 0x0111, 0x7111, 0x0222, 0x7222, 0xf333, 0x7333, 0x0444, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000
	.word	0x8000, 0x7444, 0x0555, 0x7555, 0xd666, 0x8777, 0xf777, 0x7777, 0x8888, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000
	.word	0x8000, 0x0888, 0x7888, 0xf999, 0x8aaa, 0xdaaa, 0x8bbb, 0xfbbb, 0x8ccc, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000
	.word	0x8000, 0x0ccc, 0x8ddd, 0xfddd, 0x8eee, 0xfeee, 0x2fef, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorchart_light_Palettes
colorchart_light_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x4f00, 0x20f0, 0x100f, 0xffff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorchart_dark_Palettes
colorchart_dark_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x4f00, 0x20f0, 0x100f, 0xffff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorbarssmpte75_Palettes
colorbarssmpte75_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7bbb, 0x6bb0, 0x100b, 0xf111, 0x30bb, 0x20b0, 0x5b0b, 0x8025, 0xffff, 0x4b00, 0xc307, 0x7000, 0x8222, 0x8000, 0x8000

.globl colorbarssmpte75_304_Palettes
colorbarssmpte75_304_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7bbb, 0x6bb0, 0x100b, 0xf111, 0x30bb, 0x20b0, 0x5b0b, 0x4b00, 0x8025, 0xffff, 0xc307, 0x7000, 0x8222, 0x8000, 0x8000

.globl refcolor_Palettes
refcolor_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7bbb, 0x6bb0, 0x30bb, 0x20b0, 0x5b0b, 0x4b00, 0x100b, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl refcolor_304_Palettes
refcolor_304_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7bbb, 0x6bb0, 0x30bb, 0x20b0, 0x5b0b, 0x4b00, 0x100b, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorbleedbars_Palettes
colorbleedbars_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0xce00, 0x00e0, 0x900e, 0xfeee, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl colorbleedcheck_Palettes
colorbleedcheck_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0xce00, 0x00e0, 0x900e, 0xfeee, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl grayramp_Palettes
grayramp_Palettes:
	.word	0x0004 ;* 4 palettes
	.word	0x8000, 0x7fff, 0x0fff, 0xfeee, 0x8eee, 0xfddd, 0x8ddd, 0xfccc, 0x8ccc, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000
	.word	0x8000, 0x7bbb, 0x8bbb, 0xfaaa, 0x8aaa, 0xf999, 0x8999, 0x0888, 0x8888, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000
	.word	0x8000, 0x7777, 0xf777, 0x8777, 0xf666, 0x8666, 0xf555, 0x7444, 0x0444, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000
	.word	0x8000, 0x8444, 0xf333, 0x8333, 0x0222, 0x7111, 0x0111, 0x7000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl ire_Palettes
ire_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x2fef, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl sharp_Palettes
sharp_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xd666, 0x8000, 0xfeee, 0x0222, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl sharpbrick_Palettes
sharpbrick_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x0664, 0x0422, 0x0200, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl conver_grid_Palettes
conver_grid_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl conver_dot_Palettes
conver_dot_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl conver_star_Palettes
conver_star_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl conver_rgb_Palettes
conver_rgb_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xfeee, 0x900e, 0x00e0, 0xce00, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl conver_rgb_b_Palettes
conver_rgb_b_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xfeee, 0x8000, 0x900e, 0x00e0, 0xce00, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl donna_Palettes
donna_Palettes:
	.word	0x0013 ;* 19 palettes
	.word	0x8000, 0xebbe, 0xf777, 0x4511, 0xfa87, 0xed99, 0x2c77, 0x9b54, 0x1653, 0x8000, 0x3833, 0x8333, 0xfa44, 0xcfca, 0x7fff, 0x1fec
	.word	0x8000, 0xf777, 0xcfca, 0xed99, 0x1653, 0x4511, 0x8333, 0x8000, 0xfa87, 0xfbbb, 0x1fec, 0xfa44, 0x7fff, 0xebbe, 0xceb5, 0x4873
	.word	0x8000, 0xebbe, 0xf777, 0x8000, 0xfa87, 0xfff9, 0xfeb5, 0x8333, 0x1653, 0x4873, 0x4511, 0x8666, 0x1334, 0x0559, 0x677c, 0x7bbb
	.word	0x8000, 0xcfca, 0xed99, 0xf777, 0x4511, 0xfa44, 0x8000, 0x1653, 0x7fff, 0xebbe, 0x8333, 0xceb5, 0x2c77, 0x4873, 0xfbbb, 0xfa87
	.word	0x8000, 0xcfca, 0x8333, 0xed99, 0xfa44, 0x4511, 0x8000, 0xfbbb, 0xf777, 0x1fec, 0x1653, 0xfa87, 0x2c77, 0x7fff, 0x8000, 0x8000
	.word	0x8000, 0xfa87, 0xcfca, 0x8333, 0x8000, 0xebbe, 0xf777, 0x4511, 0xed99, 0x1334, 0x1653, 0xfeb5, 0x9b54, 0x3833, 0xefed, 0x2c77
	.word	0x8000, 0xfa87, 0x4511, 0xed99, 0x4873, 0x1fec, 0x7fff, 0xf777, 0x1653, 0xfbbb, 0x8000, 0xfa44, 0x8333, 0xcfca, 0xefed, 0x7bbb
	.word	0x8000, 0x4511, 0xfeb5, 0x1653, 0x8000, 0xf777, 0xefed, 0x9b54, 0x7bbb, 0xfa87, 0x8333, 0xcfca, 0x4873, 0xdd82, 0xed99, 0x2c77
	.word	0x8000, 0xfeb5, 0x4873, 0x8000, 0x4511, 0x9b54, 0xebbe, 0x1653, 0x8333, 0x3833, 0xf777, 0xdd82, 0xfa87, 0xed99, 0xcfca, 0xefed
	.word	0x8000, 0xfeb5, 0xfff9, 0xf777, 0x8666, 0x1653, 0x4873, 0xfa87, 0xdd82, 0x7bbb, 0xefed, 0x8000, 0xcfca, 0x4511, 0x8333, 0xed99
	.word	0x8000, 0xfeb5, 0x4873, 0x8000, 0x9b54, 0x4511, 0x1653, 0x8333, 0xfa87, 0x3833, 0xed99, 0x2c77, 0xcfca, 0xefed, 0x8000, 0x8000
	.word	0x8000, 0xcfca, 0xfa87, 0x1653, 0xefed, 0xf777, 0x4511, 0x4873, 0xdd82, 0x8333, 0xfeb5, 0xfff9, 0x8666, 0x7bbb, 0x8000, 0xebbe
	.word	0x8000, 0xcfca, 0xfa87, 0x1653, 0x4873, 0x4511, 0xed99, 0x2c77, 0x3833, 0x8000, 0x9b54, 0xf777, 0xdd82, 0x8333, 0xfeb5, 0xfff9
	.word	0x8000, 0x8666, 0xf777, 0xebbe, 0x8000, 0x1334, 0xfeb5, 0x8333, 0xcfca, 0xfa87, 0xefed, 0x9b54, 0x1653, 0x4873, 0x4511, 0xed99
	.word	0x8000, 0xfeb5, 0x1653, 0x8666, 0xdd82, 0x8333, 0xefed, 0x8000, 0x7bbb, 0x4873, 0xf777, 0xfa87, 0xfff9, 0x1334, 0x0559, 0x677c
	.word	0x8000, 0xfff9, 0xfa87, 0x1653, 0x4511, 0xfeb5, 0x8000, 0x9b54, 0x4873, 0xcfca, 0xf777, 0xefed, 0x7bbb, 0x8333, 0x3833, 0xed99
	.word	0x8000, 0xfeb5, 0xfff9, 0x4873, 0xfa87, 0x1653, 0xdd82, 0xf777, 0x8000, 0x4511, 0x8333, 0xebbe, 0x8666, 0x9b54, 0xed99, 0xcfca
	.word	0x8000, 0x4511, 0x8000, 0x8333, 0xcfca, 0xefed, 0x2c77, 0x9b54, 0x1653, 0x8666, 0xfa87, 0xfeb5, 0xf777, 0x8444, 0xed99, 0x7777
	.word	0x8000, 0xefed, 0x7bbb, 0x8666, 0x7fff, 0xf777, 0xcfca, 0xfeb5, 0x8000, 0x8333, 0x4873, 0xed99, 0x1653, 0xfa87, 0x1334, 0x8000

.globl slug_Palettes
slug_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x6b83, 0x2100, 0xe861, 0xdec6, 0x9885, 0x2653, 0x2320, 0x2ba8, 0x0fff, 0x2431, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl slug_shadow_Palettes
slug_shadow_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0xa100, 0x2100, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl shape_shadow_Palettes
shape_shadow_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl marker_striped_Palettes
marker_striped_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl marker_Palettes
marker_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0xfeee, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl check_Palettes
check_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl vertstripe_Palettes
vertstripe_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl horzstripe_Palettes
horzstripe_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl barcode_Palettes
barcode_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8bbb, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl led_1x_Palettes
led_1x_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl led_2x_Palettes
led_2x_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl led_4x_Palettes
led_4x_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl led_6x_Palettes
led_6x_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl led_8x_Palettes
led_8x_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_0_Palettes
num_0_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_1_Palettes
num_1_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_2_Palettes
num_2_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_3_Palettes
num_3_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_4_Palettes
num_4_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_5_Palettes
num_5_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_6_Palettes
num_6_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_7_Palettes
num_7_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_8_Palettes
num_8_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_9_Palettes
num_9_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_0_w_Palettes
num_0_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_1_w_Palettes
num_1_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_2_w_Palettes
num_2_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_3_w_Palettes
num_3_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_4_w_Palettes
num_4_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_5_w_Palettes
num_5_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_6_w_Palettes
num_6_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_7_w_Palettes
num_7_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_8_w_Palettes
num_8_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl num_9_w_Palettes
num_9_w_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x7fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl circle_blue_Palettes
circle_blue_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x100f, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl circle_red_Palettes
circle_red_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x4f00, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl separator_Palettes
separator_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl bar_l_Palettes
bar_l_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl audiosync_bar_Palettes
audiosync_bar_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

.globl audiosync_floor_Palettes
audiosync_floor_Palettes:
	.word	0x0001 ;* 1 palettes
	.word	0x8000, 0x5fff, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000, 0x8000

