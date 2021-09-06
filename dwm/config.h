#include <X11/XF86keysym.h>

/* volume */
static const char *upvol[] = {"/usr/bin/pactl", "set-sink-volume", "0", "+5%",
                              NULL};
static const char *downvol[] = {"/usr/bin/pactl", "set-sink-volume", "0", "-5%",
                                NULL};
static const char *mutevol[] = {"/usr/bin/pactl", "set-sink-mute", "0",
                                "toggle", NULL};
/* brightness */
static const char *brightup[] = {"brightnessctl", "set", "5%+", NULL};
static const char *brightdown[] = {"brightnessctl", "set", "5%-", NULL};
/* appearence */
static const unsigned int borderpx = 1; /* border pixel of windows */
static const unsigned int snap = 32;    /* snap pixel */
static const unsigned int gappx = 6;    /* pixel gap between clients */
static const int showbar = 1;           /* 0 means no bar */
static const int topbar = 1;            /* 0 means bottom bar */
static const int horizpadbar = 6;       /* horizontal padding for statusbar */
static const int vertpadbar = 7;        /* vertical padding for statusbar */
/* Mononoki Nerd Font must be installed from AUR nerd-fonts-complete.
 * Otherwise, your default font will be Hack which is found in the standard
 * Arch repos and is listed as a dependency for this build. JoyPixels is also
 * a hard dependency and makes colored fonts and emojis possible.
 */
static const char *fonts[] = {
    /* "Liberation Mono: Font:size=8:antialias=true:autohint:true", */
    "Source Code Pro: Font:size=9:antialias=true:autohint:true",
    /* "CodeNewRoman Nerd Font: Font:size=9:antialias=true:autohint:true", */
    /* "SauceCodePro Nerd Font: Font:size=8:antialias=true:autohint:true", */
    "Mononoki Nerd Font: Font:size=9:antialias=true:autohint=true",
    "Hack:size=8:antialias=true:autohint=true",
    "JoyPixels:size=10:antialias=true:autohint=true"};
static const char col_1[] = "#383c4a"; /* background color of bar */
static const char col_2[] = "#282c34"; /* border color unfocused windows */
static const char col_3[] = "#ffffff";
static const char col_4[] = "#5294E2"; /* border color focused windows and tags */
/* bar opacity
 * 0xff is no transparency.
 * 0xee adds wee bit of transparency.
 * Play with the value to get desired transparency.
 */
static const unsigned int baralpha = 0xff;
static const unsigned int borderalpha = OPAQUE;
static const char *colors[][3] = {
    /*               fg         bg         border   */
    [SchemeNorm] = {col_3, col_1, col_2},
    [SchemeSel] = {col_3, col_4, col_4},
};
static const unsigned int alphas[][3] = {
    /*               fg      bg        border     */
    [SchemeNorm] = {OPAQUE, baralpha, borderalpha},
    [SchemeSel] = {OPAQUE, baralpha, borderalpha},
};

/* tagging */
/* static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };
 */
static const char *tags[] = {"", "", "", "", "", "", "", "", ""};

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    {"terminology", "main", NULL, 1 << 2, 0, -1},
    {"st-256color", "st-256color", NULL, 1 << 2, 0, -1},
    {"azuredatastudio", "azuredatastudio", NULL, 1 << 5, 0, -1},
    {"firefox", "Navigator", NULL, 1 << 4, 0, -1},
    {"org.remmina.Remmina", "org.remmina.Remmina", NULL, 1 << 7, 0, -1},
    {"Microsoft-edge-dev", "microsoft-edge-dev", NULL, 2, 0, -1},
    {"Code", "code", NULL, 1 << 6, 0, -1},
    {"Emacs", "emacs", NULL, 1 << 6, 0, -1},
    {"Thunderbird", "Mail", NULL, 1 << 8, 0, -1},
    {"Org.gnome.Nautilus", "org.gnome.Nautilus", NULL, 1 << 3, 0, -1},
    {NULL, "FVim", "FVim", 1 << 6, 0, -1},

};

/* layout(s) */
static const float mfact = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints =
    0; /* 1 means respect size hints in tiled resizals */

#include "layouts.c"
static const Layout layouts[] = {
    /* symbol     arrange function */
    {"[]=", tile}, /* first entry is default */
    {"><>", NULL}, /* no layout function means floating behavior */
    {"[M]", monocle}, {"HHH", grid}, {"[]=", tile},
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY, TAG)                                                      \
  {MODKEY, KEY, view, {.ui = 1 << TAG}},                                       \
      {MODKEY | ControlMask, KEY, toggleview, {.ui = 1 << TAG}},               \
      {MODKEY | ShiftMask, KEY, tag, {.ui = 1 << TAG}},                        \
      {MODKEY | ControlMask | ShiftMask, KEY, toggletag, {.ui = 1 << TAG}},
#define CMD(cmd)                                                               \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd)                                                             \
  {                                                                            \
    .v = (const char *[]) { "/bin/sh", "-c", cmd, NULL }                       \
  }

/* dmenu */
static char dmenumon[2] =
    "0"; /* component of dmenucmd, manipulated in spawn() */
/* If you are using the standard dmenu program, use the following. */
//static const char *dmenucmd[] = {"dmenu_run", "-p", "Run: ", NULL};
/* If you are using the dmenu-distrotube-git program, use the following for a
 * cooler dmenu! */
static const char *dmenucmd[]    = { "dmenu_run", "-g", "10", "-l", "48",
"-p", "Run: ", NULL };

/* the st terminal with tabbed */
static const char *termcmd[] = {"st", NULL};
/* An alternative way to launch st along with the fish shell */
/* static const char *termcmd[]     = { "st", "-e fish", NULL }; */
static const char *tabtermcmd[] = {"tabbed", "-r", "2", "st", "-w", "''", NULL};

static Key keys[] = {
    /* modifier             key        function        argument */
    {MODKEY | ShiftMask, XK_Return, spawn, {.v = dmenucmd}},
    {MODKEY, XK_Return, spawn, {.v = termcmd}},
    {Mod1Mask, XK_Return, spawn, {.v = tabtermcmd}},
    {MODKEY, XK_b, togglebar, {0}},
    {MODKEY | ShiftMask, XK_j, rotatestack, {.i = +1}},
    {MODKEY | ShiftMask, XK_k, rotatestack, {.i = -1}},
    {MODKEY, XK_j, focusstack, {.i = +1}},
    {MODKEY, XK_k, focusstack, {.i = -1}},
    {MODKEY, XK_i, incnmaster, {.i = +1}},
    {MODKEY, XK_d, incnmaster, {.i = -1}},
    {MODKEY, XK_h, setmfact, {.f = -0.05}},
    {MODKEY, XK_l, setmfact, {.f = +0.05}},
    {MODKEY | ControlMask, XK_Return, zoom, {0}},
    {MODKEY, XK_Tab, view, {0}},
    {MODKEY | ShiftMask, XK_c, killclient, {0}},

    /* Layout manipulation */
    {MODKEY, XK_Tab, cyclelayout, {.i = -1}},
    {MODKEY | ShiftMask, XK_Tab, cyclelayout, {.i = +1}},
    {MODKEY, XK_space, setlayout, {0}},
    {MODKEY | ShiftMask, XK_space, togglefloating, {0}},

    /* Switch to specific layouts */
    {MODKEY, XK_t, setlayout, {.v = &layouts[0]}},
    {MODKEY, XK_f, setlayout, {.v = &layouts[1]}},
    {MODKEY, XK_m, setlayout, {.v = &layouts[2]}},
    {MODKEY, XK_g, setlayout, {.v = &layouts[3]}},

    {MODKEY, XK_0, view, {.ui = ~0}},
    {MODKEY | ShiftMask, XK_0, tag, {.ui = ~0}},

    /* Switching between monitors */
    {MODKEY, XK_comma, focusmon, {.i = -1}},
    {MODKEY, XK_period, focusmon, {.i = +1}},
    {MODKEY | ShiftMask, XK_comma, tagmon, {.i = -1}},
    {MODKEY | ShiftMask, XK_period, tagmon, {.i = +1}},

    /* Apps Launched with SUPER + ALT + KEY */
    {MODKEY | Mod1Mask, XK_a, spawn, CMD("azuredatastudio")},
    {MODKEY | Mod1Mask, XK_c, spawn, CMD("code")},
    //{ MODKEY|Mod1Mask,        XK_e,    spawn,          CMD("st -e emacsclient
    //-c -a emacs") },
    {MODKEY | Mod1Mask, XK_e, spawn, CMD("emacs")},
    {MODKEY | Mod1Mask, XK_f, spawn, CMD("firefox")},
    {MODKEY | Mod1Mask, XK_h, spawn, CMD("st -e htop")},
    //{MODKEY | Mod1Mask, XK_g, spawn, CMD("geary")},
    {MODKEY | Mod1Mask, XK_l, spawn, CMD("librewolf")},
    {MODKEY | Mod1Mask, XK_s, spawn, CMD("xlock")},
    {MODKEY | Mod1Mask, XK_t, spawn, CMD("thunderbird")},
    //{ MODKEY|Mod1Mask,        XK_r,    spawn,          CMD("st -e rtv") },
    {MODKEY | Mod1Mask, XK_r, spawn, CMD("remmina")},

    /* Dmenu scripts launched with ALT + CTRL + KEY */
    //{Mod1Mask | ControlMask, XK_e, spawn, CMD("./.dmenu/dmenu-edit-configs.sh")},
    {Mod1Mask | ControlMask, XK_k, spawn, CMD("dmkill")},
    {Mod1Mask | ControlMask, XK_q, spawn, CMD("dmlogout")},
    {Mod1Mask | ControlMask, XK_Delete, spawn, CMD("dmlogout")},
    {Mod1Mask | ControlMask, XK_m, spawn, CMD("dmsetupmonitor")},
    {Mod1Mask | ControlMask, XK_n, spawn, CMD("dmdisconnectmonitor")},
    {Mod1Mask | ControlMask, XK_f, spawn, CMD("dmsearch")},
    {Mod1Mask | ControlMask, XK_r, spawn, CMD("dmreddio")},
    {Mod1Mask | ControlMask, XK_s, spawn, CMD("dmscrot")},
    {Mod1Mask | ControlMask, XK_Shift_R, spawn, CMD("dmconf")},
    {Mod1Mask | ControlMask, XK_h, spawn, CMD("dman")},
    //{Mod1Mask | ControlMask, XK_r, spawn, CMD("./.dmenu/dmenu-reddio.sh")},
    //{Mod1Mask | ControlMask, XK_s, spawn, CMD("./.dmenu/dmenu-surfraw.sh")},
    //{Mod1Mask | ControlMask, XK_i, spawn, CMD("./.dmenu/dmenu-scrot.sh")},

    TAGKEYS(XK_1, 0) TAGKEYS(XK_2, 1) TAGKEYS(XK_3, 2) TAGKEYS(XK_4, 3)
        TAGKEYS(XK_5, 4) TAGKEYS(XK_6, 5) TAGKEYS(XK_7, 6) TAGKEYS(XK_8, 7)
            TAGKEYS(XK_9, 8)
           // {MODKEY | ShiftMask, XK_q, quit, {0}},
    {MODKEY | ShiftMask, XK_r, quit, {1}},

    // Volume
    // for use with dwmvlocks & sltatus
    {0, XF86XK_AudioLowerVolume, spawn, {.v = downvol}},
    {0, XF86XK_AudioRaiseVolume, spawn, {.v = upvol}},
    {0, XF86XK_AudioMute, spawn, {.v = mutevol}},
    // for use with avdd
    //{0, XF86XK_AudioLowerVolume, spawn, CMD("~/.local/bin/avd/cmd/lowervol-amixer")},
    //{0, XF86XK_AudioMute, spawn, CMD("~/.local/bin/avd/cmd/mutevol-amixer")},
    //{0, XF86XK_AudioRaiseVolume, spawn, CMD("~/.local/bin/avd/cmd/raisevol-amixer")},

    // Brightness
    // for use with dwmblocks & sltatus
    {0, XF86XK_MonBrightnessUp, spawn, {.v = brightup}},
    {0, XF86XK_MonBrightnessDown, spawn, {.v = brightdown}},
    // For use with avdd
    //{0, XF86XK_MonBrightnessUp, spawn, CMD("brightnessctl set 10%+ ; avds bl")},
    //{0, XF86XK_MonBrightnessDown, spawn, CMD("brightnessctl set 10%- ; avds bl")},
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle,
 * ClkClientWin, or ClkRootWin */
static Button buttons[] = {
    /* click           event mask   button          function        argument */
    {ClkLtSymbol, 0, Button1, setlayout, {0}},
    {ClkLtSymbol, 0, Button3, setlayout, {.v = &layouts[2]}},
    {ClkWinTitle, 0, Button2, zoom, {0}},
    {ClkStatusText, 0, Button2, spawn, {.v = termcmd}},
    {ClkClientWin, MODKEY, Button1, movemouse, {0}},
    {ClkClientWin, MODKEY, Button2, togglefloating, {0}},
    {ClkClientWin, MODKEY, Button3, resizemouse, {0}},
    {ClkTagBar, 0, Button1, view, {0}},
    {ClkTagBar, 0, Button3, toggleview, {0}},
    {ClkTagBar, MODKEY, Button1, tag, {0}},
    {ClkTagBar, MODKEY, Button3, toggletag, {0}},
};
