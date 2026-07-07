#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=20
alarm[1]=2

event_user(0)

if (global.char==4) {
    sprite_index=sprBoshyGameover
    alarm[2]=20
    image_alpha=0
    scale=1.2
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!global.silent_gameover) {
    if (room=rGuyBoss || settings("resmus")) play_music("")
    else pause_music()
    if (global.char==4) inst=play_sound("loludied")
    else inst=play_sound("28")
}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[2]=21

if (scale==1.2) scale=1.5
else scale=1.2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char==4) {
    if (visible) image_alpha=min(1,image_alpha+1/10)
    image_xscale=lerp(image_xscale,scale,0.1)
    image_yscale=lerp(image_yscale,scale,0.1)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inst) FMODInstanceStop(inst)
global.silent_gameover=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=view_xview[0]+400
y=view_yview[0]+304
if (room==rCredits) depth=-1015
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_sprite_ext(sprite_index,image_index,view_xview[0]+400,view_yview[0]+global.resh/2,image_xscale,image_yscale,0,$ffffff,image_alpha)
texture_set_interpolation(0)
