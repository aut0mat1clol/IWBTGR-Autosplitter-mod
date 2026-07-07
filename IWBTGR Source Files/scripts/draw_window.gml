//draws the title bar and buttons
var foc;
if (!settings("full") && settings("border") && global.win_ver>5) {
    foc=(global.focus && !instance_exists(PauseMenu))
    //window border
    ff=!foc*15
    draw_sprite(sprWindow,ff,0,0)
    draw_sprite_stretched(sprWindow,ff+1,32,0,800+6-64,32)
    draw_sprite(sprWindow,ff+2,800+6-32,0)
    draw_sprite_stretched(sprWindow,ff+3,0,32,32,29+608-32)
    draw_sprite_stretched(sprWindow,ff+4,800+6-3,32,32,29+608-32)
    draw_sprite(sprWindow,ff+5,0,29+608)
    draw_sprite_stretched(sprWindow,ff+6,32,29+608,800+6-64,32)
    draw_sprite(sprWindow,ff+7,800+6-32,29+608)

    draw_sprite(sprWindow,ff+8+max(0,clickX),800+6-32,0)

    draw_sprite(sprWindow,ff+11,800+6-32-23,0)

    draw_sprite(sprWindow,ff+12+max(0,clickM),800+6-32-46,0)

    draw_set_font(fCaption)
    if (!foc) draw_set_alpha(0.7)
    else {
        draw_set_color(0)
        draw_text(26,8,window_caption)
    }
    draw_set_color($ffffff)
    draw_text(25,7,window_caption)
    draw_set_alpha(1)

    time+=1
    texture_set_interpolation(1)
    if (foc) draw_sprite_ext(sprCherry,time/10*foc,15,17,0.65,0.65,0,0,0.5)
    draw_sprite_ext(sprCherry,time/10*foc,14,16,0.65,0.65,0,$ffffff,1)
    texture_set_interpolation(0)
}
