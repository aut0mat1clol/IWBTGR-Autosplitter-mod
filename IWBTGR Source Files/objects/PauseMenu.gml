#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
screen_sprite=sprite_create_from_surface(world.appsurf,0,0,800,global.resh,0,0,0,0)

f=0
fade=0

active=0

button=-1
lastbutton=-1

with (ClownCar) if (inst) FMODInstanceSetPause(inst,1)
with (DraculaIntro) if (inst) FMODInstanceSetPause(inst,1)
with (GuyFirst) if (inst) FMODInstanceSetPause(inst,1)

instance_deactivate_all(1)
instance_activate_object(world)
instance_activate_object(global.screen_manager)
instance_activate_object(core)

if (settings("full")) window_set_cursor(cr_default)
if (!settings("border") && global.win_ver>5) {
    if (global.win_ver<8) win7=1
    else win10=1
}

x=global.pause_x
y=global.pause_y

global.pause=1

sel=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (screen_sprite!=-1) sprite_delete(screen_sprite)
screen_sprite=-1
instance_activate_all()
activation_update()

with (ClownCar) if (inst) FMODInstanceSetPause(inst,0)
with (DraculaIntro) if (inst) FMODInstanceSetPause(inst,0)
with (GuyFirst) if (inst) FMODInstanceSetPause(inst,0)

if (settings("full")) window_set_cursor(cr_none)

global.pause_delay=20
global.pause_x=x
global.pause_y=y
global.pause=0

if (sel=9) exit_title()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//keyboard control
v=0
if (global.input_v!=0) {
    if (!lockv) v=global.input_v
    lockv=1
} else {
    lockv=0
}

h=0
if (global.input_h!=0) {
    if (!lockh) h=global.input_h
    counter+=1
    lockh=1
} else {
    lockh=0
    counter=0
}

if (lockh) {
    if (sel=0) {if (counter<2 || counter>10) settings("volmus",median(0,settings("volmus")+global.input_h,100)) music_updatevolume()}
    if (sel=1) {if (counter<2 || counter>10) settings("volsfx",median(0,settings("volsfx")+global.input_h,100)) music_updatevolume()}
}

if (!down) {
    if (h=-1) {
        if (sel=3) sel=2
        if (sel=8) sel=4
        if (sel=9) sel=5
    }
    if (h=1) {
        if (sel=2) sel=3
        if (sel=4) sel=8
        if (sel=5) sel=9
    }
    if (v=-1) {
        if (sel=5) sel=4
        else if (sel=4) sel=2
        else if (sel=8) sel=3
        else if (sel=2 || sel=3) sel=1
        else if (sel=9) sel=8
        else sel=0
    }
    if (v=1) {
        if (sel=0) sel=1
        else if (sel=1) sel=3
        else if (sel=2) sel=4
        else if (sel=3) sel=8
        else sel=5
    }
}

if (global.key[key_jump]) {
    down=1 keyb=1
} else if (down && keyb) {
    down=0 keyb=0
    if (sel=2) toggle_fullscreen()
    if (sel=3) {settings("vsync",!settings("vsync"))}
    if (sel=4) {settings("border",!settings("border")) border_joke() win7=0 win10=0 if (!settings("border") && global.win_ver>5) {if (global.win_ver<8) win7=1 else win10=1} update_border() if (!settings("full")) reset_renderer()}
    if (sel=5 || sel=9) instance_destroy()
    if (sel=8) {settings("musdamp",!settings("musdamp"))}
}

if (global.key_released[key_shoot]) instance_destroy()

//mouse control

mx=global.mx-view_xview[0]-x
my=global.my-view_yview[0]-y

focus=0

if (mouse_check_button_pressed(mb_left) && !within(mx,my,0,0,220,200) && within(global.mx,global.my,view_xview[0],view_yview[0],800,608)) {
    if (global.haswinding && (win7 || win10)) play_sound("winding")
    else play_sound("Windows XP Ding")
    flash=30
}

if (button=-1) {
    //music slider
    if (within(mx,my,100,40,110,20)) button=0
    //sfx slider
    if (within(mx,my,100,70,110,20)) button=1

    //fullscreen
    if (within(mx,my,10,100,100,20)) button=2
    //vsync
    if (within(mx,my,113,100,100,20)) button=3
    //border
    if (within(mx,my,10,130,100,20)) button=4
    //quiet
    if (within(mx,my,113,130,100,20)) button=8

    //ok
    if (within(mx,my,11,167,63,23)) button=5
    //back
    if (within(mx,my,81,167,128,23)) button=9

    //close
    if (win7) {if (within(mx,my,184,5,31,17)) button=6}
    else if (win10) {if (within(mx,my,220-46,1,45,24)) button=6}
    else {if (within(mx,my,194,5,21,21)) button=6}

    //drag
    if (button!=6) if (within(mx,my,0,0,220,29)) {button=7 ofx=mx ofy=my}

    if (button!=-1) {
        focus=button
        if (!mouse_check_button_pressed(mb_left)) button=-1
    }
} else {
    down=1
    sel=button
    if (button=0) {settings("volmus",median(0,round(mx-105),100)) music_updatevolume()}
    if (button=1) {settings("volsfx",median(0,round(mx-105),100)) music_updatevolume()}

    if (button=2) if (!within(mx,my,10,100,100,20)) down=0
    if (button=3) if (!within(mx,my,113,100,100,20)) down=0
    if (button=4) if (!within(mx,my,10,130,100,20)) down=0
    if (button=8) if (!within(mx,my,113,130,100,20)) down=0

    if (button=5) if (!within(mx,my,11,167,63,23)) down=0
    if (button=9) if (!within(mx,my,81,167,128,23)) down=0

    if (button=6) {
        if (win7) {if (!within(mx,my,184,5,31,17)) down=0}
        else if (win10) {if (!within(mx,my,220-46,1,45,24)) down=0}
        else {if (!within(mx,my,194,5,21,21)) down=0}
    }
    if (button=7) {
        x=median(0,global.mx-view_xview[0]-ofx,800-sprite_width)
        y=median(0,global.my-view_yview[0]-ofy,global.resh-sprite_height)
    }

    if (!mouse_check_button(mb_left)) {
        action=0
        if (down) {
            action=button
        }
        down=0
        lastbutton=button
        button=-1

        if (action=2) toggle_fullscreen()
        if (action=3) {settings("vsync",!settings("vsync"))}
        if (action=4) {settings("border",!settings("border")) border_joke() win7=0 win10=0 if (!settings("border") && global.win_ver>5) {if (global.win_ver<8) win7=1 else win10=1} update_border() if (!settings("full")) reset_renderer()}
        if (action=5 || action=6 || action=9) instance_destroy()
        if (action=8) {settings("musdamp",!settings("musdamp"))}
    }
}

if (global.key_released[key_pause]) {if (active) instance_destroy() active=1}

if (flash) flash-=1
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
global.pause=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d3d_set_projection_ortho(0,0,800,608,0)

draw_sprite(screen_sprite,0,0,0)

var f;f=global.focus*!(flash mod 10 >= 5)

if (settings("border")) {
    mincolor1=$e55500
} else {
    mincolor1=window_get_caption_color()
}
if (color_get_luminance(mincolor1)>128) mincolor2=0
else mincolor2=$ffffff

if (win7) {
    draw_sprite(sprite_index,5+!f,x,y)
    draw_set_font(fWin7)
    if (!f) draw_set_color($989898)
    else draw_set_color(0)
    draw_text(x+7,y+6,"Application paused")
} else if (win10) {
    draw_sprite(sprite_index,3,x,y)
    draw_sprite_ext(sprite_index,2,x,y,1,1,0,merge_color($ffffff,global.window_color,f),1)
    draw_sprite_ext(sprite_index,4,x,y,1,1,0,merge_color($9c9c9c,mincolor2,f),1)
    draw_set_font(fWin10)
    if (f) draw_set_color(mincolor2)
    else draw_set_color($c0c0c0)
    draw_text(x+4,y+4,"Application paused")
} else draw_sprite(sprite_index,!f,x,y)

draw_set_font(fSans)
draw_set_color(0)

draw_text_lang(x+10,y+40,lang("options1")+" "+string(settings("volmus"))+"%")
draw_text_lang(x+10,y+70,lang("options2")+" "+string(settings("volsfx"))+"%")

draw_sprite(sprXPSlider,0,x+100,y+40)
draw_sprite(sprXPSlider,1,x+100+settings("volmus"),y+40)
if (sel=0) draw_selection(x+100,y+40,110,20)

draw_sprite(sprXPSlider,0,x+100,y+70)
draw_sprite(sprXPSlider,1,x+100+settings("volsfx"),y+70)
if (sel=1) draw_selection(x+100,y+70,110,20)

draw_text_lang(x+30,y+100,lang("options3"))
draw_text_lang(x+130,y+100,lang("options4"))
draw_text_lang(x+30,y+130,lang("options17"))
draw_text_lang(x+130,y+130,lang("options23"))
draw_sprite(sprXPCheckbox,settings("full")*3+(button==2)*(1+down)+(focus==2)+(sel==2 && button!=2)*down*2,x+10,y+100)
draw_sprite(sprXPCheckbox,settings("vsync")*3+(button==3)*(1+down)+(focus==3)+(sel==3 && button!=3)*down*2,x+110,y+100)
draw_sprite(sprXPCheckbox,settings("border")*3+(button==4)*(1+down)+(focus==4)+(sel==4 && button!=4)*down*2,x+10,y+130)
draw_sprite(sprXPCheckbox,settings("musdamp")*3+(button==8)*(1+down)+(focus==8)+(sel==8 && button!=8)*down*2,x+110,y+130)
if (sel=2) draw_selection(x+10,y+100,100,20)
if (sel=3) draw_selection(x+110,y+100,100,20)
if (sel=4) draw_selection(x+10,y+130,100,20)
if (sel=8) draw_selection(x+110,y+130,100,20)

draw_sprite(sprXPButton,(button==5)*(1+down)+(focus==5)+(sel==5 && button!=5)*down*2,x+10,y+166)
if (sel=5) draw_selection(x+15,y+171,55,15)

draw_sprite(sprXPButtoooon,(button==9)*(1+down)+(focus==9)+(sel==9 && button!=9)*down*2,x+80,y+166)
if (sel=9) draw_selection(x+85,y+171,120,15)

draw_set_halign_lang(1)
draw_text_lang(x+43+(button==5 || sel==5)*down,y+170+(button==5 || sel==5)*down,"OK")
draw_text_lang(x+145+(button==9 || sel==9)*down,y+170+(button==9 || sel==9)*down,lang("bttb"))
draw_set_halign_lang(0)

if (win7) {
    if (button==6 || focus==6) {
        draw_sprite(sprite_index,7+(button==6)*down,x,y)
    }
} else if (win10) {
    if (button==6 || focus==6) {
        rect(x+220-46,y+1,45,24,$2311e8,1)
        draw_sprite(sprite_index,4,x,y)
    }
} else draw_sprite(sprWindow,8+15*!global.focus+(button==6)*(1+down)+(focus==6),x+188,y)

draw_set_color($ffffff)
