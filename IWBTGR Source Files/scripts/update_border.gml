if (global.win_ver<6) settings("border",0)

if (!settings("full")) {
    if (settings("border") && global.win_ver>5) {
        window_set_showborder(0)
        view_wport[0]=800+6
        view_hport[0]=608+29+3
    } else {
        window_set_showborder(1)
        view_wport[0]=800
        view_hport[0]=608
    }

    for (i=room_first;i!=-1;i=room_next(i))
        room_set_view(i,0,1,0,0,800,608,0,0,view_wport[0],view_hport[0],0,0,0,0,noone)
}

update_skin()
