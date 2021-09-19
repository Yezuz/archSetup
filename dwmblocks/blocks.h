//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/
	{"", "~/tools/archSetup/dwmblocks/scripts/battery", 30, 2},
	{"  ", "~/tools/archSetup/dwmblocks/scripts/cpu2", 1, 18},	
	{"   ", "~/tools/archSeetup/dwmblocks/scripts/memory", 6, 1},
	/*{" 🔊 ", "/opt/dwmblocks-distrotube-git/scripts/volume", 2, 10}, */
	{"", "~/tools/archSetup/dwmblocks/scripts/cpu",6 , 10},
	{"  ", "~/tools/archSetup/dwmblocks/scripts/clock", 5, 0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
