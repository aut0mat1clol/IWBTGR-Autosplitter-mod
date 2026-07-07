//updates the title bar functionality like carrying and closing

if (!settings("full")) {
    if (settings("border") && global.win_ver>5) {
        if (!window_grab) {
            window_x=window_mouse_get_x()/settings("winscale")
            window_y=window_mouse_get_y()/settings("winscale")
            if (clickX==0 || clickX==1) {
                cx=window_x-(800+6-32+6)
                cy=window_y-(5)
                clickX=(cx>=0 && cy>=0 && cx<21 && cy<21)
            }
            if (clickM==0 || clickM==1) {
                cx=window_x-(800+6-32+6-46)
                cy=window_y-(5)
                clickM=(cx>=0 && cy>=0 && cx<21 && cy<21)
            }
        }

        if (mouse_check_button_pressed(mb_left)) {
            if (window_y<30) {
                if (clickX=1) clickX=2
                else if (clickM=1) clickM=2
                else {
                    window_grab=1
                    window_x=window_mouse_get_x()
                    window_y=window_mouse_get_y()
                }
            }
        }

        if (clickX==2 || clickX==-1) {
            cx=window_x-(800+6-32+6)
            cy=window_y-(5)

            if (!(cx>=0 && cy>=0 && cx<21 && cy<21)) clickX=-1
            else clickX=2
            if (!mouse_check_button(mb_left)) {
                if (clickX==2) close_button()
                clickX=0
            }
        }

        if (clickM==2 || clickM==-1) {
            cx=window_x-(800+6-32+6-46)
            cy=window_y-(5)

            if (!(cx>=0 && cy>=0 && cx<21 && cy<21)) clickM=-1
            else clickM=2
            if (!mouse_check_button(mb_left)) {
                if (clickM==2) {
                    window_minimize()
                    set_application_title(title)
                    FMODMasterSetVolume(0)
                    pause_music()
                    room_speed=10
                    global.minimized=1
                }
                clickM=0
            }
        }

        if (window_grab) {
            window_set_position(display_mouse_get_x()-window_x,display_mouse_get_y()-window_y)
            if (!mouse_check_button(mb_left)) window_grab=0
        }
    }

    window_caption="I Wanna Be The Guy"
} else {
    window_grab=0
    window_caption=""
}

stat_string=""

if (room!=rTitle && room!=rFiles && room!=rEnding && room!=rCredits && room!=rBossRush) {
    stat_string="Death: "+string(global.death)+" - Time: "+time_str(global.time)

    if (!settings("full")) window_caption+=" - "
    window_caption+=stat_string
}

room_caption=window_caption
