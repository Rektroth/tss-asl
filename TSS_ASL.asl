state("LEGOSTARWARSSKYWALKERSAGA_DX11")
{
	byte load : 0x05D8D850, 0xD8, 0x40, 0x10, 0x58, 0xB0, 0x0, 0x1B8;
	byte loads : 0x05D9E1A8, 0xC8, 0x10, 0x50, 0x60, 0x38, 0x30, 0xE0;
	byte episodeSelect : 0x05B8A730, 0xFCD; // need something better
	byte numLevelsBeat : 0x05D8D850, 0x278, 0xCC;
	// byte mainMenu : 0x058A1168, 0x4C0, 0x110, 0x9B4;
	// byte inLevel : 0x00000000;
}

startup
{
	refreshRate = 60;
	//settings.Add("exitSaveReset", false, "Reset when exiting game save");
	//settings.Add("startOnLevelEntry", false, "Start on entering a level instead of an episode");
}

isLoading
{
	return current.load == 1 && current.loads == 1;
}

/*
reset
{
	return settings["exitSaveReset"] && old.mainMenu == 0 && current.mainMenu > 0;
}
*/

start
{
	/*
	if (settings["startOnLevelEntry"])
	{
		return old.inLevel == 0 && current.inLevel > 0;
	}
	*/
	
	return old.episodeSelect > 0 && current.episodeSelect == 0;
}

split
{
	return old.numLevelsBeat < current.numLevelsBeat;
}
