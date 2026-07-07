global.gotoroomnextframe=0

if (settings("crashing")) {
    surface_reset_target()
    draw_clear(0)
    draw_window()
    screen_refresh()
    pause_music()
    while (keyboard_key!=vk_nokey) {io_handle() sleep(20)}
}

if (room=rMechaBirdoBoss) global.birdo_crash=1
if (room=rBowserBoss) global.bowser_crash=1
global.lastroom=room

input_clear()
