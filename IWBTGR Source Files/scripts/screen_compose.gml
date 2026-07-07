//during end step, compose the window and update the internal buffer.

appsurf=sureface(appsurf,800,global.resh)
d3d_set_projection_ortho(0,0,800,global.resh,0)
draw_make_opaque()
surface_reset_target()

if (settings("full")) {
    if (global.nodq) {
        draw_surface(appsurf,0,0)
    } else {
        scalefactor=max(2,1+min(ceil(global.rw/800),ceil(global.rh/global.resh)))
        dequanto=sureface(dequanto,800*scalefactor,global.resh*scalefactor)
        if (surface_set_target_safe(dequanto)) {
            appsurf=sureface(appsurf,800,global.resh)
            texture_set_interpolation(1)
            if (global.boshystretch) draw_surface_stretched(appsurf,0,0,800*800*scalefactor,global.resh*scalefactor)
            else draw_surface_stretched(appsurf,0,0,800*scalefactor,global.resh*scalefactor)
            surface_reset_target()
            d3d_set_projection_ortho(0,0,global.rw,global.rh,0)
            draw_surface_stretched(dequanto,0,0,global.rw,global.rh)
            texture_set_interpolation(0)
        }
    }
} else {
    if (settings("border") && global.win_ver>5) {
        d3d_set_projection_ortho(0,0,800+6,608+29+3,0)
        if (global.boshystretch) draw_surface_stretched(appsurf,3,29,800*800,608)
        else draw_surface(appsurf,3,29)
        draw_window()
    } else {
        draw_surface(appsurf,0,0)
    }
}

global.boshystretch-=1
