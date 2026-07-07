#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
saveTimer=-1

draw_set_font(fComic10)

if (global.jp) {
    global.tcalc=1
    draw_text_lang(0,0,str)
    w=global.twidth+6
    h=global.theight+10
} else {
    w=string_width(str)+6
    h=string_height(str)+6
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
saveTimer=max(0,saveTimer-1)
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) instance_destroy()
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!saveTimer) {
    saveTimer=50
    image_index=!image_index
    play_sound("switch")
    alarm[0]=50*5
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if (image_index) {
    rect(x+16-w/2,y+32,w,h,0,1)
    draw_set_font(fComic10)
    draw_set_halign_lang(1)
    draw_set_valign_lang(1)
    draw_text_lang(floor(x+16),floor(y+32+h/2)-2*global.jp,str)
    draw_set_halign_lang(0)
    draw_set_valign_lang(0)
}
