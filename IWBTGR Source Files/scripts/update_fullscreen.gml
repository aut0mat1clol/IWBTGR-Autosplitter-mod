global.init_fullscreen=0

draw_clear(0)
screen_refresh()
window_set_fullscreen(settings("full"))

if (settings("full")) {
    if (!instance_exists(PauseMenu))
        window_set_cursor(cr_none)
    //set up views to resize the backbuffer
    window_set_region_scale(-1,1)
    s=min(global.dw/800,global.dh/global.resh)
    global.rw=ceil(800*s)
    global.rh=ceil(global.resh*s)
    view_wport[0]=global.rw
    view_hport[0]=global.rh
    for (i=room_first;i!=-1;i=room_next(i))
        room_set_view(i,0,1,0,0,800,global.resh,0,0,global.rw,global.rh,0,0,0,0,noone)
} else {
    if (settings("winscale")>1 && global.resh*settings("winscale")>global.dh) {
        settings("winscale",1)
    }
    window_set_region_scale(settings("winscale"),1)
    if (settings("border") && global.win_ver>5) {
    //set up views to resize the window to fit our custom window border
        view_wport[0]=800+6
        view_hport[0]=608+29+3
        for (i=room_first;i!=-1;i=room_next(i))
            room_set_view(i,0,1,0,0,800,608,0,0,800+6,608+29+3,0,0,0,0,noone)
    } else {
        view_wport[0]=800
        view_hport[0]=608
        for (i=room_first;i!=-1;i=room_next(i))
            room_set_view(i,0,1,0,0,800,608,0,0,800,608,0,0,0,0,noone)
    }
    global.rw=view_wport[0]
    global.rh=view_hport[0]
    update_border()
}

reset_renderer()
