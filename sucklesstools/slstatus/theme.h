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
#define WM_COL_DMENU_SB  	"#40FF40"   /* dmenu selected background color */
#define WM_COL_DMENU_SF  	"#000000"   /* dmenu selected foreground color */
#define WM_COL_DMENU_OB		"#40CC40"   /* dmenu already selected background color */
#define WM_COL_DMENU_OF		"#000000"   /* dmenu already selected foreground color */

////////////////////////////////////////////////////////////////////////////////
//// terminal appearance

#define THEME_TERM_FONT "Cascadia Mono:pixelsize=14:antialias=true:autohint=true"

/*	colors are defined as an array of strings, each string is a color in
	hexadecimal format. They are defined in the following order:
	8 normal colors: red, green, yellow, blue, magenta, cyan, white
	8 bright colors: red, green, yellow, blue, magenta, cyan, white
*/
#define THEME_TERM_COLORS {\
	"#7F7F8C", "#CD5C5C", "#9ACD32", "#BDB76B", "#75A0FF", "#EEEE00", "#CD853F", "#cecece",\
        "#8A7F7F", "#FF0000", "#89FB98", "#F0E68C", "#6DCEEB", "#FFDE9B", "#FFA0A0", "#FEFEFE",\
	[255] = 0, "#40FF40", "#555555", "#000000", }


