with (world) {
    if (appsurf!=-1) surface_free(appsurf) appsurf=-1
    if (dequanto!=-1) surface_free(dequanto) dequanto=-1
    alarm[0]=2

    //we save and load the game to resize gm8's backbuffer, for fullscreen 1:1 pixels.
    t=temp_directory+"\tmp.sav"
    game_save(t)
    game_load(t)
}
