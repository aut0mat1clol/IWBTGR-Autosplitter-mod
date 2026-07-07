#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///fix_views()
fix_views()
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///first_save()
first_save()
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///play_music(room_song())
play_music(room_song())
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///joy_detect()
joy_detect()
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=settings("winscale")

window_set_region_scale(s,1)
window_center()

if (settings("border") && global.win_ver>5) {
    global.rw=(800+6)*s
    global.rh=(608+29+3)*s
} else {
    global.rw=(800)*s
    global.rh=(608)*s
}


window_set_region_scale(0,1)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///system_update()
system_update()

if (global.char==4) {
    if (mouse_in_window() && !settings("full") && instance_exists(player) && window_has_focus()) {
        if (!settings("border") || window_mouse_get_y()>29) {
            mousetimer+=1
            if (mousex!=window_mouse_get_x() || mousey!=window_mouse_get_y()) mousetimer=-30
            mousex=window_mouse_get_x()
            mousey=window_mouse_get_y()
            if (mousetimer) {
                mousex=approach(mousex,player.x-view_xview,1)
                mousey=approach(mousey,player.y-view_yview+29*settings("border"),1)
                window_mouse_set(mousex,mousey)
            }
            if (point_distance(mouse_x,mouse_y,player.x,player.y+29*settings("border"))<24) killPlayer()
        }
    }

    boshybowtimer+=6
    global.boshybowangle=-45+8*dsin(boshybowtimer)

    if (keyboard_check(vk_pagedown)) {
        musicspeedchanger=max(0,musicspeedchanger-1/200)
        if (musicspeedchanger==0) musicspeedchanger=1
    }
    if (keyboard_check(vk_pageup)) {
        musicspeedchanger=min(2,musicspeedchanger+1/200)
    }
    if (keyboard_check(vk_home)) {
        musicspeedchanger=1
    }

    FMODInstanceSetPitch(ds_map_find_value(global.sndmap,"inst"),musicspeedchanger)

    if (keyboard_check_pressed(ord("1"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=1
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("2"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=2
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("3"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=3
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("4"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=4
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("5"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=5
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("6"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=6
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("7"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=7
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("8"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=8
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("9"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=9
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(ord("0"))) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=10
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(vk_minus)) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=11
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(vk_equals)) {
        if (global.boshysong) global.boshysong=0 else global.boshysong=12
        play_music(global.realsong)
        with (musicChanger) event_step()
    }
    if (keyboard_check_pressed(vk_f9)) {
        with (player) {
            global.gastly=!global.gastly
            if (global.gastly) instance_create(player.x,player.y,PokeyBall)
            else Gastly.die=1
        }
    }
} else global.boshysong=0
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///I Wanna Play Online

if (global.gotoroomnextframe) room_goto(global.gotoroomnextframe)

//activate almonds
if (room==rGuy1 && view_xview[0]==0 && view_yview[0]==0 && instance_exists(player)) {
    if (memkey!=keyboard_key && keyboard_key) {
        memkey=keyboard_key
        if (code=0) {if (keyboard_key=world.keyboard[key_up]) code=1 else code=0}
        else if (code=1) {if (keyboard_key=world.keyboard[key_up]) code=2 else code=0}
        else if (code=2) {if (keyboard_key=world.keyboard[key_down]) code=3 else code=0}
        else if (code=3) {if (keyboard_key=world.keyboard[key_down]) code=4 else code=0}
        else if (code=4) {if (keyboard_key=world.keyboard[key_left]) code=5 else code=0}
        else if (code=5) {if (keyboard_key=world.keyboard[key_right]) code=6 else code=0}
        else if (code=6) {if (keyboard_key=world.keyboard[key_left]) code=7 else code=0}
        else if (code=7) {if (keyboard_key=world.keyboard[key_right]) code=8 else code=0}
        else if (code=8) {if (keyboard_key=world.keyboard[key_shoot]) code=9 else code=0}
        else if (code=9) {if (keyboard_key=world.keyboard[key_jump]) {
            code=0
            unlocks("1",1)
            unlocks("2",1)
            i=instance_create(0,0,ErrorTrap)
            i.mode2=1
            i.str="___________________________________________
ERROR in
action number 1
of Konmai Code Event
for object player:

Extra content Unlocked
      ^
at position 8: Incorrect capitalisation."
        } else code=0}
    } else if (!keyboard_key) memkey=0
} else {code=0 memkey=0}
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
game_start()

musicspeedchanger=1
boshybowtimer=0
global.boshybowangle=-45
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///room_start()
room_start()

mousetimer=0
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///room_end()
room_end()
#define Other_30
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///close_button()
close_button()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///HUD

//debug draw
if (global.gamemaker) {
    if (global.hitboxes) {
        draw_sprite_ext(player.mask_index,0,player.x,player.y,player.image_xscale,1,0,$ffffff,0.5)
        with (MechaHitbox) draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
        with (MechaHitbox2) draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
        with (MechaHitbox3) draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
        with (DragonFace) draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
        with (DraculasFace) draw_self()
        with (TysonFist) draw_self()
    }

    if (global.seetriggers) {
        draw_sprite_ext(player.mask_index,0,player.x,player.y,player.image_xscale,1,0,$ffffff,0.5)
    }

    if (global.seetriggers) {
        draw_set_color($ff00ff)
        with (all) draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,1)
        draw_set_color($ffffff)
    }
}

//boss rush timer
if (global.bossrush==2 && !global.pause) {
    draw_set_font(fSans)
    str="Time: "+time_str_tick(global.time,global.tick)+"#Deaths: "+string(global.death)
    draw_set_color(0)
    draw_text_transformed(view_xview[0]+32-1,view_yview[0]+32,str,2,2,0)
    draw_text_transformed(view_xview[0]+32+1,view_yview[0]+32,str,2,2,0)
    draw_text_transformed(view_xview[0]+32,view_yview[0]+32-1,str,2,2,0)
    draw_text_transformed(view_xview[0]+32,view_yview[0]+32+1,str,2,2,0)
    draw_set_color($ffffff)
    draw_text_transformed(view_xview[0]+32,view_yview[0]+32,str,2,2,0)
}

//skip & autosave subtitles
var skip; skip=0
with (Tyson) if (intro && running && timer<2040) skip=1
with (ClownCar) if (intro && (phase==0 || (phase==1 && timer>2300 && timer<2925) || (phase==2 && timer>5300 && timer<5975))) skip=1
with (DraculaIntro) if (timer<1900) skip=1
with (Kraidgief) if (!frozen && intro && timer>=50) skip=1
with (GuyFirst) if (intro) skip=1
with (EndingController) if (timer<185*50 && timer>25) skip=1

str=""
if (skip) str=lang("skipboss")
if (autosave) {str=lang("autosave") autosave-=1}
if (str!="") {
    if (!strshown) {strshown=1 stralpha=6}
    stralpha=max(0,stralpha-1/50)
    draw_set_font(fComic10)
    draw_set_halign_lang(2)
    draw_set_color(0)
    draw_set_alpha(stralpha)
    draw_text_lang(view_xview[0]+780-1,view_yview[0]+10,str)
    draw_text_lang(view_xview[0]+780+1,view_yview[0]+10,str)
    draw_text_lang(view_xview[0]+780,view_yview[0]+10-1,str)
    draw_text_lang(view_xview[0]+780,view_yview[0]+10+1,str)
    draw_set_color($ffffff)
    draw_set_alpha(min(1,stralpha*3))
    draw_text_lang(view_xview[0]+780,view_yview[0]+10,str)
    draw_set_alpha(1)
    draw_set_halign_lang(0)
} else strshown=0
