//// This file is used to define the overall appearance of the system.

////////////////////////////////////////////////////////////////////////////////
//// window-manager appearance

#define WM_FONT			"Cascadia Mono:size=10:antialias=true:autohint=true"

#define WM_BORDER_WIDTH		1 	/* border pixel of windows */
#define WM_GAP_WIDTH		0       /* gaps between windows */
#define WM_SNAP			16      /* snap pixel */
#define WM_SHOWBAR		1       /* 0 means no bar */
#define WM_TOPBAR		0 	/* 0 means bottom bar */

#define WM_COL_NORM_FG		"#FFFFFF"   /* non selected workspace foreground color */
#define WM_COL_NORM_BG		"#212529"   /* non selected workspace background color */
#define WM_COL_SEL_FG		"#70B3FF"   /* selected workspace foreground color */
#define WM_COL_SEL_BG		"#000000"   /* selected workspace background color */

#define WM_COL_NORM_BORDER  	"#353535"   /* non selected window border color */
#define WM_COL_SEL_BORDER  	"#70B3FF"   /* selected window border color */

#define WM_COL_DMENU_NB  	"#212529"   /* dmenu normal background color */
#define WM_COL_DMENU_NF  	"#FFFFFF"   /* dmenu normal foreground color */
#define WM_COL_DMENU_SB  	"#70B3FF"   /* dmenu selected background color */
#define WM_COL_DMENU_SF  	"#FFFFFF"   /* dmenu selected foreground color */
#define WM_COL_DMENU_OB		"#5093BF"   /* dmenu already selected background color */
#define WM_COL_DMENU_OF		"#FFFFFF"   /* dmenu already selected foreground color */

////////////////////////////////////////////////////////////////////////////////
//// terminal appearance

#define THEME_TERM_FONT "Cascadia Mono:pixelsize=14:antialias=true:autohint=true"

/*	colors are defined as an array of strings, each string is a color in
	hexadecimal format. They are defined in the following order:
	8 normal colors: red, green, yellow, blue, magenta, cyan, white
	8 bright colors: red, green, yellow, blue, magenta, cyan, white
*/
#define THEME_TERM_COLORS {\
	"#000000", "#FB4B4E", "#7CB518", "#ED9B40", "#009FB7", "#5B5F97", "#087E8B", "#cccccc",\
	"#000000", "#cccccc", "#cccccc", "#cccccc", "#cccccc", "#cccccc", "#cccccc", "#cccccc",\
	[255] = 0, "#ff0004", "#555555", "#000000", }


