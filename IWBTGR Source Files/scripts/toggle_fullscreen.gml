settings("full",!settings("full"))

if (settings("full")) {
    if (!instance_exists(PauseMenu))
        window_set_cursor(cr_none)
} else window_set_cursor(cr_default)

if (global.crt && !settings("full")) {
    settings("full",1)
} else update_fullscreen()
