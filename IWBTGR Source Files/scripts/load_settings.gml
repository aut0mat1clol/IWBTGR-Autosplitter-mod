global.savedir=working_directory+"\save"

directory_create(global.savedir)
directory_create(global.savedir+"\backups")

if (!directory_exists(global.savedir) || disk_free()<1000000) {
    //use appdata if disk is readonly
    global.savedir=directory_previous(directory_previous(directory_previous(temp_directory)))+"Roaming\IWBTG"
    directory_create(global.savedir)
    directory_create(global.savedir+"\backups")
}

global.unlmap=ds_map_create()
global.setmap=ds_map_create()
global.joymap=ds_map_create()
global.datamap=ds_map_create()

select_save(0)

global.unlfile=global.savedir+"\items.ini"
global.setfile=global.savedir+"\config.ini"
global.joyfile=global.savedir+"\gamepads.ini"

if (file_exists(global.unlfile)) {
    f=file_text_open_read(global.unlfile)
    ds_map_read_safe(global.unlmap,file_text_read_string(f))
    file_text_close(f)
}

if (file_exists(global.joyfile)) {
    f=file_text_open_read(global.joyfile)
    ds_map_read_safe(global.joymap,file_text_read_string(f))
    file_text_close(f)
}

success=file_exists(global.setfile)
if (success) {
    f=file_text_open_read(global.setfile)
    success=ds_map_read_safe(global.setmap,file_text_read_string(f))
    file_text_close(f)
}

if (success) {
    //yeah i know this could be a for loop but we need to have that sweet 1.0 compatibility
    keyboard[key_up   ]=settings("keyup"   )
    keyboard[key_down ]=settings("keydown" )
    keyboard[key_left ]=settings("keyleft" )
    keyboard[key_right]=settings("keyright")
    keyboard[key_jump ]=settings("keyjump" )
    keyboard[key_shoot]=settings("keyshoot")
    keyboard[key_reset]=settings("keyreset")
    keyboard[key_pause]=settings("keypause")
    keyboard[key_skip ]=settings("keyskip" )
    keyboard[key_back ]=settings("keyback" )

    music_updatevolume()

    if (settings("winscale")==0) {
        if (global.dw>1600+100 && global.dh>1216+100)
            settings("winscale",2)
        else
            settings("winscale",1)
    } else {
        if (settings("winscale")>1 && (800*settings("winscale")+100>global.dw || 608*settings("winscale")+100>global.dh))
            settings("winscale",1)
    }

    if (settings("full") || global.crt) {
        settings("full",0)
        global.init_fullscreen=1
        alarm[0]=2
    } else alarm[4]=2

    //convert 1.0 saves
    save=0
    if (settings("unlock1")) {unlocks("1",1) settings("unlock1",0) save=1}
    if (settings("unlock2")) {unlocks("2",1) settings("unlock1",0) save=1}
    if (settings("secret1")) {unlocks("secret1",1) settings("secret1",0) save=1}
    if (settings("secret2")) {unlocks("secret2",1) settings("secret2",0) save=1}
    if (settings("secret3")) {unlocks("secret3",1) settings("secret3",0) save=1}
    if (settings("secret4")) {unlocks("secret4",1) settings("secret4",0) save=1}
    if (settings("secret5")) {unlocks("secret5",1) settings("secret5",0) save=1}
    if (settings("secret6")) {unlocks("secret6",1) settings("secret6",0) save=1}

    //convert 1.2 saves
    if (!settings("bossrush_time1")) {settings("bossrush_time1",60*30) save=1}
    if (!settings("bossrush_time2")) {settings("bossrush_time2",60*30) save=1}
    if (!settings("bossrush_time3")) {settings("bossrush_time3",60*30) save=1}

    if (save) save_settings()
    update_border()
} else {
    input_defaults()

    settings("volmus",50)
    settings("volsfx",50)
    settings("border",1)
    settings("full",0)
    settings("vsync",0)
    settings("musdamp",1)

    settings("smoothmetroid",1)

    lid=io_get_language()
    //spanish
    if (lid==1034 || lid==2058 || lid==3082 || lid==4106 || lid==5130 || lid==6154 || lid==7178 || lid==8202 || lid==9226 || lid==10250 || lid==11274 || lid==12298 || lid==13322 || lid==14346 || lid==15370 || lid==16394 || lid==17418 || lid==18442 || lid==19466 || lid==20490 || lid==21514 || lid==58378) settings("language",2)
    //japanese
    if (lid==1041) settings("language",1)

    if (global.dw>1600+100 && global.dh>1216+100)
        settings("winscale",2)
    else
        settings("winscale",1)
    alarm[4]=2

    settings("bossrush_time",60*30)
    settings("bossrush_time1",60*30)
    settings("bossrush_time2",60*30)
    settings("bossrush_time3",60*30)

    music_updatevolume()

    save_settings()
}

load_lang()

settings("softlock_secret",!file_exists(global.savedir+"\softlock.txt"))
