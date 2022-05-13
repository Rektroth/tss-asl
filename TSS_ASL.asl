state("LEGOSTARWARSSKYWALKERSAGA_DX11")
{
    byte load : 0x05D8D850, 0xD8, 0x40, 0x10, 0x58, 0xB0, 0x0, 0x1B8;
    byte loads : 0x05D9E1A8, 0xC8, 0x10, 0x50, 0x60, 0x38, 0x30, 0xE0;
    byte episodeSelect : 0x05B8A730, 0xFCD; // need something better
    byte completedLevels : 0x05D8D850, 0x278, 0xCC;
    // byte gameSave : 0x00000000;
}

startup
{
    refreshRate = 60;
    settings.Add("exitSaveReset", false, "Reset when exiting game save");
}

isLoading
{
    return current.load == 1 && current.loads == 1;
}

start
{
    return old.episodeSelect > 0 && current.episodeSelect == 0;
}


split
{
    return old.completedLevels < current.completedLevels;
}

/*
reset
{
    if (settings["exitSaveReset"])
    {
        return old.gameSave > 0 && current.gameSave == 0;
    }
}
*/
