if (game_started && room!=rInit) {
    with (playerStart) {
        if (!instance_exists(player)) {
            instance_create(x+17,y+23,player)
            if (global.castleboost) player.vspeed=-24

        }
        instance_destroy()
    }

    global.castleboost=0

    if (global.restart) {
        global.restart=0
        load_game_execute()
        restarted=1
    } else {
        alarm[1]=2
        restarted=0
    }

    with (cameraHard) event_user(0)

    update_titlebar()

    // LiveSplit autosplitter hook
    autosplitter_state("room", room_get_name(room))

    if (room!=rBossRush && room!=rMetroid) play_music(room_song())

    room_speed=50

    if (settings("full")) {
        view_wport[0]=800
        view_hport[0]=608
        if (!instance_exists(PauseMenu))
            window_set_cursor(cr_none)
    } else {
        if (!(settings("border") && global.win_ver>5)) {
            view_wport[0]=800
            view_hport[0]=608
        }
    }

    cement(block)
    cement(blockKill)

    if (instance_exists(Cart)) {
        if (player.x>20000) {
            with (Cart) event_user(0)
            view_xview[0]=max(22368+32,player.x+54-400)
        } else {
            player.carted=1
            Cart.x=player.x-64
        }
    }

    if (global.factory_ceiling_flag) {
        if (global.factory_ceiling_flag==1) {
            with (FactoryCeiling) instance_destroy()
            with (Ryu) instance_destroy()
        }
        global.factory_ceiling_flag=0
        with (RyuButton) event_user(0)
    }

    if (global.save_on_room_change && !restarted && room!=rTitle && room!=rFiles && room!=rEnding) {
        if (global.orb_on_room_change="orb_dragon" && global.char==3) {
            instance_create(player.x,player.y,OwataIn)
        }
        savedata(global.orb_on_room_change,1)
        if (global.diff<3) {
            saveGame()
            autosave=200
        }
    }
    global.save_on_room_change=0

    if (settings("crashing")) {
        if (!irandom(50)) global.needs_crash=1

        if (global.needs_crash) {
            error=choose(0,1,2,3,4)

            if (error=0) {
                cursor=0
                save_position/=cursor
            }
            if (error=1) {
                while 1 {}
            }
            if (error=2) {
                roomTo=-1
                room_goto(roomTo)
            }
            if (error=3) {
                screen_save("")
            }
            if (error=4) {
                savefile=-4
                file_text_close(savefile)
            }
        }
    }
}
