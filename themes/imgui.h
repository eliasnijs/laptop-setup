//// This file is used to define the overall appearance of the system.

////////////////////////////////////////////////////////////////////////////////
//// window-manager appearance

#define WM_FONT			"Cascadia Mono:size=10:antialias=true:autohint=true"

#define WM_BORDER_WIDTH		3 	/* border pixel of windows */
#define WM_GAP_WIDTH		0       /* gaps between windows */
#define WM_SNAP			16      /* snap pixel */
#define WM_SHOWBAR		1       /* 0 means no bar */
#define WM_TOPBAR		1 	/* 0 means bottom bar */

#define WM_COL_NORM_FG		"#eeeeee"   /* non selected workspace foreground color */
#define WM_COL_NORM_BG		"#0E0E0E"   /* non selected workspace background color */
#define WM_COL_SEL_FG		"#eeeeee"   /* selected workspace foreground color */
#define WM_COL_SEL_BG		"#294A7A"   /* selected workspace background color */

#define WM_COL_NORM_BORDER  	"#1D2E48"   /* non selected window border color */
#define WM_COL_SEL_BORDER  	"#294A7A"   /* selected window border color */

#define WM_COL_DMENU_NB  	"#0E0E0E"   /* dmenu normal background color */
#define WM_COL_DMENU_NF  	"#eeeeee"   /* dmenu normal foreground color */
#define WM_COL_DMENU_SB  	"#294A7A"   /* dmenu selected background color */
#define WM_COL_DMENU_SF  	"#eeeeee"   /* dmenu selected foreground color */
#define WM_COL_DMENU_OB		"#192A5A"   /* dmenu already selected background color */
#define WM_COL_DMENU_OF		"#eeeeee"   /* dmenu already selected foreground color */


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


