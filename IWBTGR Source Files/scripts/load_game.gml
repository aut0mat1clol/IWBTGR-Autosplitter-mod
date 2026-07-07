//loads the save file and starts it up

if (!file_exists(global.savefile)) room_goto(rGuy1)
else {
    read_save()
    global.restart=1
    global.diff=savedata("diff")
    global.char=savedata("char")

    //ok we need to do some acrobatics here for I Wanna Play Online compatibility
    //because we don't restart the game here
    global.gotoroomnextframe=savedata("saveroom")
}
