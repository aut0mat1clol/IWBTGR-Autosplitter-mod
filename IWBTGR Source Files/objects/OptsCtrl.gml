#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)

image_speed=0.5

load_dips()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var dip_setting, dip_count;

if (visible && !instance_exists(bullet)) {
    global.dw=display_get_width()
    global.dh=display_get_height()
    if (1600+100>global.dw || 1216+100>global.dh) {
        grayout2x=1
    } else grayout2x=0

    if (extra) {
        if (global.input_v!=0) {
            dip_count=ds_list_size(dips)/4
            if (!lockv) ext=modulo(ext+global.input_v,0,dip_count)
            if (ext-1<=dip_scroll_pos) dip_scroll_pos=ext-1
            if (ext-dip_scroll_size+2>=dip_scroll_pos) dip_scroll_pos=ext-dip_scroll_size+2
            dip_scroll_pos=median(0,dip_scroll_pos,ds_list_size(dips)/4-dip_scroll_size)
            lockv=1
        } else {
            lockv=0
        }
        if (global.key_pressed[key_shoot]) {
            event_user(2)
            play_sound("click")
        }
        if (global.key_pressed[key_jump]) {
            play_sound("click")
            dip_setting=ds_list_find_value(dips,ext*4)
            settings(dip_setting,!settings(dip_setting))
        }
    } else if (setcontrols) {
        if (setcontrols=1 && global.key_released[key_jump]) {
            setcontrols=2
            current=0
            if (setcontrol!=-1) {
                joyname=joy_get(setcontrol,3,0)
                joy_snap(setcontrol)
                wait=""
            } else wait=0
        }
        if (setcontrols=2) {
            if (setcontrol==-1) {
                //keyboard remap
                inputname="Keyboard"
                if (wait) {
                    if (keyboard_key!=wait) wait=0
                } else if (keyboard_key) {
                    valid=1
                    for (i=0;i<current;i+=1) if (world.keyboard[i]==keyboard_key) valid=0
                    if (valid) {
                        world.keyboard[current]=keyboard_key
                        current+=1
                        wait=keyboard_key
                    }
                }
                if (current=10) {
                    settings("keyup"   ,world.keyboard[key_up])
                    settings("keydown" ,world.keyboard[key_down])
                    settings("keyleft" ,world.keyboard[key_left])
                    settings("keyright",world.keyboard[key_right])
                    settings("keyjump" ,world.keyboard[key_jump])
                    settings("keyshoot",world.keyboard[key_shoot])
                    settings("keyreset",world.keyboard[key_reset])
                    settings("keypause",world.keyboard[key_pause])
                    settings("keyskip" ,world.keyboard[key_skip])
                    settings("keyback" ,world.keyboard[key_back])
                    save_settings()
                    setcontrols=0
                    sel=0
                }
            } else {
                //joystick remap
                inputname=joyname
                joystick_key=joy_compare(setcontrol)
                if (wait!="") {
                    if (joystick_key!=wait) wait=""
                } else if (joystick_key!="") {
                    valid=1
                    for (i=0;i<current;i+=1) if (joystick[i]==joystick_key) valid=0
                    if (valid) {
                        joystick[current]=joystick_key
                        current+=1
                        wait=joystick_key
                    }
                }
                if (keyboard_check_pressed(vk_space)) {
                    joystick[current]=""
                    current+=1
                }
                if (current=10) {
                    map=""
                    for (i=0;i<10;i+=1) map+=joystick[i]+"|"
                    joymaps(joyname,map)
                    save_settings()
                    setcontrols=0
                    sel=0
                    world.joyset=""
                }
            }
        }
    } else if (!sel) {
        if (global.key_pressed[key_shoot]) {
            with (FilesCursor) if (visible) {
                if (char=2) {
                    instance_create(x,y,bullet)
                    play_sound("vicshoot")
                } else if (char=3) {
                    instance_create(x,y-4,bullet)
                    play_sound("fire3")
                    owatershot=20
                } else {
                    instance_create(x,y-2,bullet)
                    play_sound("fire2")
                }
            }
        }

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

        if (h==1 && opt<6) {opt+=6 play_sound("click")}
        else if (h==1 && opt>=6) {opt-=6 play_sound("click")}
        if (h==-1 && opt>=6) {opt-=6 play_sound("click")}
        else if (h==-1 && opt<6) {opt+=6 play_sound("click")}

        if (v==1 && opt!=5 && opt!=11) {opt+=1 play_sound("click")}
        else if (v==1 && (opt==5 || opt==11)) {opt-=5 play_sound("click")}
        if (v==-1 && opt!=0 && opt!=6) {opt-=1 play_sound("click")}
        else if (v==-1 && (opt==0 || opt==6)) {opt+=5 play_sound("click")}

        if (global.key_pressed[key_jump]) {
            if (!(opt==1 && grayout2x)) sel=1
            play_sound("click")
        }
    } else {
        if (global.key_released[key_shoot] || global.key_pressed[key_jump]) {
            sel=0
            play_sound("click")
        }

        if (global.input_h!=0) {
            counter+=1
        } else {
            counter=0
        }

        switch (opt) {
            case 0: {sel=0 toggle_fullscreen()}break
            case 1: {sel=0 if (!grayout2x) {settings("winscale",!(settings("winscale")-1)+1) update_fullscreen()}}break
            case 2: {settings("border",!settings("border")) border_joke() update_border() sel=0 if (!settings("full")) reset_renderer()}break
            case 3: {settings("vsync",!settings("vsync")) sel=0}break
            case 4: {sel=0 if (ask1<5) ask1+=1 else {clear_items() ask1=0}}break
            case 5: {sel=0 if (ask2<5) ask2+=1 else {clear_all() load_dips() ask2=0}}break

            case 6: {if (counter==1 || counter>10) settings("volmus",median(0,settings("volmus")+global.input_h,100)) music_updatevolume()}break
            case 7: {if (counter==1 || counter>10) settings("volsfx",median(0,settings("volsfx")+global.input_h,100)) music_updatevolume()}break
            case 8: {settings("resmus",!settings("resmus")) sel=0 }break
            case 9: {settings("musdamp",!settings("musdamp")) sel=0}break
            case 10: {event_user(3)}break
            case 11: {setcontrols=1 setcontrol=global.current_input}break
        }
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
ds_list_destroy(dips)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile_layer_hide(-100)
tile_layer_hide(-200)
visible=0
cleared1=0
cleared2=0
ask1=0
ask2=0
extra=0

save_settings()
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile_layer_show(-100)
visible=1
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile_layer_hide(-200)
extra=0
sel=0
#define Other_13
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile_layer_show(-200)
extra=1
ext=0
dip_scroll_pos=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//shut up im lazy

draw_set_font(fComic12)
draw_text_lang(x+6,y+4,lang("options0"))

draw_set_font(fComic10)
if (opt=0) draw_sprite(sprite_index,image_index,x-64-24+15*sel,y+64+4)
draw_text_lang(x-64+6,y+64+4,lang("options3")+": "+string_repeat("Off",!settings("full"))+string_repeat("On",settings("full")))

if (grayout2x) draw_set_color($808080)
if (opt=1) draw_sprite(sprite_index,image_index,x-64-24+15*sel,y+96+4)
draw_text_lang(x-64+6,y+96+4,lang("options24")+": "+string(round(settings("winscale")*100))+"%")
draw_set_color($ffffff)

if (opt=2) draw_sprite(sprite_index,image_index,x-64-24+15*sel,y+128+4)
draw_text_lang(x-64+6,y+128+4,lang("options17")+": "+string_repeat("Off",!settings("border"))+string_repeat("On",settings("border")))

if (opt=3) draw_sprite(sprite_index,image_index,x-64-24+15*sel,y+160+4)
draw_text_lang(x-64+6,y+160+4,lang("options4")+": "+string_repeat("Off",!settings("vsync"))+string_repeat("On",settings("vsync")))

if (opt=4) draw_sprite(sprite_index,image_index,x-64-24+15*sel,y+192+4)
if (ask1>0) draw_text_lang(x-64+6,y+192+4,lang("options18")+"... "+string(6-ask1))
else if (cleared1) draw_text_lang(x-64+6,y+192+4,lang("options19"))
else draw_text_lang(x-64+6,y+192+4,lang("options18"))

if (opt=5) draw_sprite(sprite_index,image_index,x-64-24+15*sel,y+224+4)
if (global.jp) newlineisrequiredhere="#" else newlineisrequiredhere=" "
if (ask2>0) draw_text_lang(x-64+6,y+224+4,lang("options20")+"..."+newlineisrequiredhere+string(6-ask2))
else if (cleared2) draw_text_lang(x-64+6,y+224+4,lang("options21"))
else draw_text_lang(x-64+6,y+224+4,lang("options20"))

if (opt=6) draw_sprite(sprite_index,image_index,x+96-24+15*sel,y+64+4)
draw_text_lang(x+96+6,y+64+4,lang("options1")+": "+string(settings("volmus"))+"%")

if (opt=7) draw_sprite(sprite_index,image_index,x+96-24+15*sel,y+96+4)
draw_text_lang(x+96+6,y+96+4,lang("options2")+": "+string(settings("volsfx"))+"%")

if (opt=8) draw_sprite(sprite_index,image_index,x+96-24+15*sel,y+128+4)
if (settings("resmus")) draw_text_lang(x+96+6,y+128+4,lang("options25"))
else draw_text_lang(x+96+6,y+128+4,lang("options26"))

if (opt=9) draw_sprite(sprite_index,image_index,x+96-24+15*sel,y+160+4)
if (settings("musdamp")) draw_text_lang(x+96+6,y+160+4,lang("options27"))
else draw_text_lang(x+96+6,y+160+4,lang("options28"))

if (opt=10 && !extra) draw_sprite(sprite_index,image_index,x+96-24+15*sel,y+192+4)
draw_text_lang(x+96+6,y+192+4,lang("options22"))

if (opt=11) draw_sprite(sprite_index,image_index,x+96-24+15*sel,y+224+4)
if (setcontrols=2) {
    draw_text_ext(x+96+6,y+224+4,"Setting up:#"+inputname,-1,154)
    if (global.jp) pressbutnotinjapanese="" else pressbutnotinjapanese=lang("options29")
    draw_text_lang(x-96+6,y+256+4,pressbutnotinjapanese+" "+lang(butname(current))+"...")
} else {
    draw_text_lang(x+96+6,y+224+4,lang("options15"))
    if (global.current_input=-1) draw_text(x-96+6,y+256+4,"Keyboard")
    else {
        joyname=joy_get(global.current_input,3)
        joy_unpack(joyname)
        draw_text(x-96+6,y+256+4,joyname)
    }
}
if (global.current_input=-1) {
    draw_text(x-96+6,y+320+4,keyname(world.keyboard[key_jump]))
    draw_text(x-96+6,y+288+4,keyname(world.keyboard[key_skip]))

    draw_text(x-32+6,y+288+4,keyname(world.keyboard[key_reset]))
    draw_text(x-32+6,y+320+4,keyname(world.keyboard[key_shoot]))
} else {
    draw_text(x-96+6,y+320+4,joymap[key_jump])
    draw_text(x-96+6,y+288+4,joymap[key_skip])

    draw_text(x-32+6,y+288+4,joymap[key_reset])
    draw_text(x-32+6,y+320+4,joymap[key_shoot])
}
if (!extra) {
    if (global.current_input=-1) {
        draw_text(x+32+6,y+288+4,keyname(world.keyboard[key_back]))
        draw_text(x+32+6,y+320+4,keyname(world.keyboard[key_left]))

        draw_text(x+96+6,y+288+4,keyname(world.keyboard[key_up]))
        draw_text(x+96+6,y+320+4,keyname(world.keyboard[key_down]))

        draw_text(x+160+6,y+288+4,keyname(world.keyboard[key_pause]))
        draw_text(x+160+6,y+320+4,keyname(world.keyboard[key_right]))
    } else {
        draw_text(x+32+6,y+288+4,joymap[key_back])
        draw_text(x+32+6,y+320+4,joymap[key_left])

        draw_text(x+96+6,y+288+4,joymap[key_up])
        draw_text(x+96+6,y+320+4,joymap[key_down])

        draw_text(x+160+6,y+288+4,joymap[key_pause])
        draw_text(x+160+6,y+320+4,joymap[key_right])
    }
}

if (extra) {
    draw_sprite(sprite_index,0,x+96-24+15,y+192+4)
    draw_set_font(fComic12)
    draw_text_lang(608+6,128+4,lang("options22"))
    draw_set_font(fComic10)
    draw_sprite(sprite_index,image_index,604-32+15*sel,192+4+(ext-dip_scroll_pos)*32-16)
    for (i=0;i<min(numdips-dip_scroll_pos,dip_scroll_size);i+=1) {
        if settings(ds_list_find_value(dips,(i+dip_scroll_pos)*4)) {
            draw_text_lang(608+6,192+4+i*32-16,ds_list_find_value(dips,(i+dip_scroll_pos)*4+2))
        } else {
            draw_text_lang(608+6,192+4+i*32-16,ds_list_find_value(dips,(i+dip_scroll_pos)*4+1))
        }
        if (dip_scroll_pos>0) draw_sprite_ext(sprite_index,0,656,176,1,1,90,$ffffff,1)
        if (dip_scroll_pos+dip_scroll_size<numdips) draw_sprite_ext(sprite_index,0,656,464,1,1,270,$ffffff,1)
    }
    draw_text_lang(388,384,ds_list_find_value(dips,ext*4+3))
}
