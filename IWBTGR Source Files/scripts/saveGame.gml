//save game and update save file

//it's named like this for I Wanna Play Online

if (instance_exists(player)) {
    if (argument_count) hash=argument0
    else hash=""

    if (bowsercrash=1) if (global.bowser_crash=1) global.bowser_crash=2
    if (global.birdo_crash=1) global.birdo_crash=2
    if (crashy && settings("crashing")) global.needs_crash=1
    if ((savedata("saved") && global.diff==3) || global.bossrush) exit

    with (player) {
        savedata("savex",x)
        savedata("savey",y)
        savedata("savew",image_xscale)
    }

    savedata("legit",savedata("legit") && legit())

    savedata("saved",1)
    savedata("saveroom",room)
    update_deathtime()

    if (global.diff!=3) {
        //save automated backup if it's a new save point
        if (hash!=string(savedata("hash"))) save_backup()
        savedata("hash",hash)

        commit_save()
        if (global.savenum!=0) {
            s=surface_create(128,96)
            surface_set_target(s)
            draw_surface_stretched(world.appsurf,0,0,128,96)
            surface_reset_target()
            surface_save(s,global.saveimg)
            surface_free(s)
            if (file_exists(filename_change_ext(global.saveimg,".bmp")))
                file_delete(filename_change_ext(global.saveimg,".bmp"))
        }
    }
}
