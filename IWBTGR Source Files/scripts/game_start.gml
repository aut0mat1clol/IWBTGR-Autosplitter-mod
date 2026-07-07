global.dffdgdfg=""

window_set_position(window_get_x(),window_get_y()-20)

draw_background(bgLoader,0,0)
screen_refresh()
draw_set_color($ffffff)
draw_set_circle_precision(64)
set_application_title(title)
set_automatic_draw(0)

//music quietener for use during development so we dont go fucking insane
global.gain=1

//small screen mode
global.crt=0
global.offh=0
global.nodq=0

global.jp=0

global.restart=0
global.boshysong=0
global.factory_ceiling_flag=0
global.save_on_room_change=0
global.pause_delay=0
global.seetriggers=0
global.pause=0
global.bossrush=0
global.asl_event_id=0
global.minimized=0
global.boshystretch=0

time=0

remembergod=0
autosave=0

appsurf=-1
dequanto=-1

window_grab=0

global.pfps=50

global.dw=display_get_width()
global.dh=display_get_height()
global.resh=608

global.pause_x=floor(400-110)
global.pause_y=floor(304-100)

if (global.dw<1024 && global.dh<768) {
    global.crt=1
    if (global.dw=800 && global.dh=600) {
        global.resh=600
        global.offh=4
        global.nodq=1
    }
}

global.gamemaker=string_pos("\appdata\local\temp\gm_ttt_",string_lower(program_directory))

for (i=room_first;i!=-1;i=room_next(i)) {
    room_set_view_enabled(i,1)
    room_set_view(i,0,1,0,0,800,608,0,0,800+6,608+29+3,0,0,0,0,noone)
}

if (!load_dll()) exit

global.focus=1
global.window_color=window_get_caption_color()
global.win_ver=get_windows_version()

load_assets()
load_settings()
update_skin()
input_init()

if (!global.focus) {
    if (settings("musdamp")) {
        voldamp=0.25
        FMODMasterSetVolume(voldamp)
    }
}

instance_create(0,0,ViewMover)

draw_clear(0)
screen_refresh()

dx8_set_vsync(0)

screen_init()

current_millis=(date_current_time()*1000)/onesecond

room_goto_next()

game_started=1
