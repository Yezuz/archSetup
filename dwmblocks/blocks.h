//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/	 	/*Update Interval*/	/*Update Signal*/
	/*{" 🐧 ", "/opt/dwmblocks-distrotube-git/scripts/kernel", 360, 2},*/
	{"", "~/.config/dwmblocks-distrotube-git/scripts/battery", 30, 2},
	{"  ", "~/.config/dwmblocks-distrotube-git/scripts/cpu2", 1, 18},	
	{"   ", "~/.config/dwmblocks-distrotube-git/scripts/memory", 6, 1},
	/*{" 🔊 ", "/opt/dwmblocks-distrotube-git/scripts/volume", 2, 10}, */
	{"", "~/.config/dwmblocks-distrotube-git/scripts/cpu",6 , 10},
	{"  ", "~/.config/dwmblocks-distrotube-git/scripts/clock", 5, 0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = '|';
