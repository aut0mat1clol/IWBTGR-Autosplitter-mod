//reset to last checkpoint

if (global.birdo_crash=2 && settings("crashing")) global.needs_crash=1

if (room!=rTitle && room!=rFiles && room!=rEnding) {
    //we use the gravity variable to detect that iwpo loaded a save
    global.grav=1
    loadGame()
    if (global.grav==1) {
        global.grav=0
        with (player) instance_destroy()
        if (global.bossrush) {
            room_goto(rBossRush)
        } else {
            global.restart=1
            if (settings("resmus")) play_music("")

            if (global.diff=3) {
                reset_impossible()
            } else {
                update_deathtime()
                commit_save()
            }

            roomTo=savedata("saveroom")
            if (!roomTo) roomTo=rTitle

            room_goto(roomTo)
        }
    }
}
