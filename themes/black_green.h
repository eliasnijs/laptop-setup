//// This file is used to define the overall appearance of the system.

////////////////////////////////////////////////////////////////////////////////
//// window-manager appearance

#define WM_FONT			"Cascadia Mono:size=10:antialias=true:autohint=true"

#define WM_BORDER_WIDTH		1 	/* border pixel of windows */
#define WM_GAP_WIDTH		0       /* gaps between windows */
#define WM_SNAP			16      /* snap pixel */
#define WM_SHOWBAR		1       /* 0 means no bar */
#define WM_TOPBAR		1 	/* 0 means bottom bar */

#define WM_COL_NORM_FG		"#bbbbbb"   /* non selected workspace foreground color */
#define WM_COL_NORM_BG		"#000000"   /* non selected workspace background color */
#define WM_COL_SEL_FG		"#40FF40"   /* selected workspace foreground color */
#define WM_COL_SEL_BG		"#000000"   /* selected workspace background color */

#define WM_COL_NORM_BORDER  	"#444444"   /* non selected window border color */
#define WM_COL_SEL_BORDER  	"#40FF40"   /* selected window border color */

#define WM_COL_DMENU_NB  	"#000000"   /* dmenu normal background color */
#define WM_COL_DMENU_NF  	"#bbbbbb"   /* dmenu normal foreground color */
#define WM_COL_DMENU_SB  	"#000000"   /* dmenu selected background color */
#define WM_COL_DMENU_SF  	"#40FF40"   /* dmenu selected foreground color */

////////////////////////////////////////////////////////////////////////////////
//// terminal appearance

#define THEME_TERM_FONT "Cascadia Mono:size=14:antialias=true:autohint=true"

/*	colors are defined as an array of strings, each string is a color in
	hexadecimal format. They are defined in the following order:
	8 normal colors: red, green, yellow, blue, magenta, cyan, white
	8 bright colors: red, green, yellow, blue, magenta, cyan, white
*/
#define THEME_TERM_COLORS {\
	"#000000", "#FB4B4E", "#7CB518", "#ED9B40", "#009FB7", "#5B5F97", "#087E8B", "#cccccc",\
	"#000000", "#cccccc", "#cccccc", "#cccccc", "#cccccc", "#cccccc", "#cccccc", "#cccccc",\
	[255] = 0, "#40FF40", "#555555", "#000000", }


