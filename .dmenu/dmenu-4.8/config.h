/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"ProFontIIx Nerd Font Mono:size=6.5"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
                    /*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#000000" },
	[SchemeSel] = { "#000000", "#1CDC9A" },
	[SchemeSelHighlight] = { "#ffff00", "#1CDC9A" },
	[SchemeNormHighlight] = { "#1CDC9A", "#000000" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
