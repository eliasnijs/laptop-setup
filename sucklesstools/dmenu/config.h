/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */
#include "theme.h"

static int topbar = 1;
/* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	WM_FONT,
	"Noto Color Emoji:size=10:autohint=true:antialias=true"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	            /*     fg         bg       */
	[SchemeNorm] = { WM_COL_DMENU_NF, WM_COL_DMENU_NB },
	[SchemeSel]  = { WM_COL_DMENU_SF, WM_COL_DMENU_SB },
	[SchemeOut]  = { WM_COL_DMENU_OF, WM_COL_DMENU_OB },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/* Characters not considered part of a word while deleting words
 * for example: " /?\"&[]" */
static const char worddelimiters[] = " ";
