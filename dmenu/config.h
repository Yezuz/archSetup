//Dependencies: dmscripts-git by Derek Taylor
static int topbar = 1;       /* -b  option; if 0, dmenu appears at bottom     */
static int centered = 0;     /* -c option; centers dmenu on screen */
static int min_width = 500;  /* minimum width when centered */
static int fuzzy = 1;        /* -F  option; if 0, dmenu doesn't use fuzzy matching     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"SauceCodePro Nerd Font: pixelsize=12 : antialias=true: autohint=true"
	"CodeNewRoman Nerd Font:pixelsize=13:antialias=true:autohint=true",
	"Source Code Pro:pixelsize=9:antialias=true:autohint=true"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	/* [SchemeNorm] = { "#aaaaaa", "#383c4a" }, */
	[SchemeNorm] = { "#aaaaaa", "#000000" },
	[SchemeSel] = { "#ffffff", "#5294E2" },
	[SchemeSelHighlight] = { "#d7d7d7", "#000000" },
	[SchemeNormHighlight] = { "#e78481", "#000000" },
	[SchemeOut] = { "#000000", "#00ffff" },
	[SchemeMid] = { "#d7d7d7", "#1f2026" },
};
/* -l and -g options; controls number of lines and columns in grid if > 0 */
static unsigned int lines      = 0;
static unsigned int lineheight = 22;  /* -h option; minimum height of a menu line */
static unsigned int columns    = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";

/* Size of the window border */
static unsigned int border_width = 0;  /* -bw option; to add border width */
