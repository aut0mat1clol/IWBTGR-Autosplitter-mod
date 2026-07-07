//this is used after a fullscreen toggle to return the
//viewport to the standard aiwana sizes.

if (settings("full")) {
    view_wport[0]=800
    view_hport[0]=global.resh
} else {
    draw_clear(0)
    if (global.init_fullscreen) toggle_fullscreen()
    else window_set_region_scale(0,1)
}
