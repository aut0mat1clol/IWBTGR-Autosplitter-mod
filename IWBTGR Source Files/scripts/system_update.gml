var L,R;

if (!game_started) exit

FMODUpdate()

ofc=global.focus
global.focus=window_has_focus()
if (global.focus && !ofc) {
    global.dw=display_get_width()
    global.dh=display_get_height()
    if (settings("winscale")>1 && (800*settings("winscale")+100>global.dw || 608*settings("winscale")+100>global.dh)) {
        settings("winscale",1) alarm[4]=2
    }
}

input_update()

if (global.gamemaker && instance_exists(player) && mouse_check_button_pressed(mb_right)) {
    func=show_menu("Debug Menu|-|Go to...|Infinite Jump|Godmode|Hitboxes|Autofire|Save Here",0)
    if (func=1) {
        s="Select room:|-"
        r=rGuy1
        do {
            s+="|"+room_get_name(r)
            r=room_next(r)
        } until (r=-1)
        goto=show_menu(s,0)
        if (goto) {
            r=rGuy1
            repeat (goto-1) r=room_next(r)
            with (player) instance_destroy()
            room_goto(r)
        }
    }
    if (func=2) {global.jumbpbsdtdve=!global.jumbpbsdtdve}
    if (func=3) {global.god=!global.god}
    if (func=4) {global.seetriggers=!global.seetriggers if (!global.seetriggers) {
        with (trigger) visible=0
        with (blockTrapDestructible) visible=0
        with (blockKill) visible=0
        with (musicChanger) visible=0
        with (ZeldaCollision) visible=0}}
    if (func=5) {global.autofire=!global.autofire}
    if (func=6) {saveGame()}
}

if (global.seetriggers) {
    with (trigger) visible=1
    with (blockTrapDestructible) visible=1
    with (blockKill) visible=1
    with (musicChanger) visible=1
    with (ZeldaCollision) visible=1
    with (SoftlockBlocker) visible=1
}

if (global.hitboxes) {
    with (trigger) visible=1
    with (SoftlockBlocker) visible=1
    with (all) if (sprite_index=sprControllerMMF2) visible=1
}

if (!instance_exists(ErrorTrap) && !global.pause) {
    if (global.bossrush==2) global.tick+=1
    else with (player) global.tick+=1
}

if (global.bossrush=1) {
    global.tick=0
    global.time=0
}

if (global.tick>=50) {
    global.tick=0
    global.time+=1
}

if (global.autofire || (global.diff==0 && global.char==4)) {
    global.autofireF=(global.autofireF+1) mod 3
} else global.autofireF=1

//accurate per-frame fps
old_millis=current_millis
current_millis=(date_current_time()*1000)/onesecond
global.pfps=mean(global.pfps,(1000/max(1,current_millis-old_millis)))

if (global.gamemaker && keyboard_check(ord("F"))) {
    room_speed=9999
    FMODInstanceSetPitch(music_instance(),global.pfps/50)
} else if (global.gamemaker && keyboard_check(ord("G"))) {
    room_speed=10
    FMODInstanceSetPitch(music_instance(),global.pfps/50)
} else if (global.focus) {
    voldamp=min(1,voldamp+0.05)
    FMODMasterSetVolume(voldamp)
    if (global.minimized) {
        global.minimized=0
        resume_music()
    }
    if (room_speed!=50) FMODInstanceSetPitch(music_instance(),1)
    room_speed=50
} else {
    if (room_speed=50) {
        if (settings("musdamp")) {
            voldamp=max(0.25,voldamp-0.05)
            FMODMasterSetVolume(voldamp)
        }
    }
    global.input_h=0
    global.input_v=0
}

if (global.importantsound) {
    if (!FMODInstanceIsPlaying(global.importantsound)) {
        global.importantsound=0
        alarm[2]=20
    }
}

if (settings("full")) {
    global.mx=view_xview[0]+((window_mouse_get_x()-(global.dw-global.rw)/2)/global.rw)*800
    global.my=view_yview[0]+(window_mouse_get_y()/global.rh)*global.resh
} else if (settings("border") && global.win_ver>5) {
    s=settings("winscale")
    global.mx=view_xview[0]+(window_mouse_get_x()-3)/s
    global.my=view_yview[0]+(window_mouse_get_y()-29)/s
} else {
    s=settings("winscale")
    global.mx=view_xview[0]+window_mouse_get_x()/s
    global.my=view_yview[0]+window_mouse_get_y()/s
}

update_titlebar()

if (global.gamemaker && keyboard_check(vk_tab)) {
    if (!remembergod) remembergod=global.god+1
    global.god=1
    with (player) {x=global.mx y=global.my xprevious=x yprevious=y vspeed=0}
} else if (remembergod) {
    global.god=remembergod-1
    remembergod=0
}

if (keyboard_check_pressed(ord("Q"))) {
    if (instance_exists(VicViper)) {
        if (VicViper.active) {
            with (VicViper) event_user(0)
        } else killPlayer(noone)
    } else killPlayer(noone)
    global.softlocks=0
}

if (room=rGuyTower || room=rGuyBoss) if (settings("devkeys") && !global.bossrush) {
    if (keyboard_check(ord("E")) && keyboard_check(ord("N")) && keyboard_check(ord("D"))) {
        with (player) instance_destroy()
        room_goto(rEnding)
    }
}

if (keyboard_check_pressed(vk_escape)) {
    close_button()
}

if (keyboard_check_pressed(vk_f2)) {
    exit_title()
}

if (keyboard_check_pressed(vk_f11)) {
    toggle_fullscreen()
    exit
}

if (keyboard_check_pressed(vk_f4)) {
    if (keyboard_check(vk_alt)) {
        close_button()
    } else {
        toggle_fullscreen()
        exit
    }
}

if (keyboard_check_pressed(vk_enter)) {
    if (keyboard_check(vk_alt)) {
        toggle_fullscreen()
        exit
    }
}

if (keyboard_check_pressed(vk_f12)) {
    take_screenshot()
    exit
}
