#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=700
alarm[1]=900
alarm[2]=1400

if (global.char==0) {
    if (settings("bowlag")) {
        sprite_index=sprPlayerClassicRun
        image_speed=mmf_animspeed(70,80)
    } else {
        image_speed=0.5
    }
} else if (global.char==1) {
    sprite_index=sprDotKid
    y+=8
} else if (global.char==2) {
    sprite_index=sprVic
    image_speed=0
    image_index=2
} else if (global.char==3) {
    sprite_index=sprOwataWalk
    image_speed=0.25
    owater=1
} else if (global.char==4) {
    sprite_index=sprBoshyWalk
    image_speed=0.2
    boshy=1
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=mmf_speed(10)
visible=1
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=0
if (global.char==0) sprite_index=sprPlayerIdle
if (global.char!=2) image_speed=mmf_animspeed(20)
if (global.char==3) {
    sprite_index=sprOwataIdle
    image_speed=0
    image_index=1
}
if (global.char==4) {
    sprite_index=sprBoshyIdle
    image_speed=0.1
}

EndingGun1.state=3
EndingGun1.visible=1

play_sound("endtingle")
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
room_goto(rCredits)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char==2) {
    image_index=2+5*(timer mod 4 < 2)
    timer+=1
}
if (global.char==3) {
    image_index=image_index mod 2
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owater) {
    if (sprite_index=sprOwataIdle || sprite_index=sprOwataStoned) spr=sprOwataIdle2
    if (sprite_index=sprOwataWalk) spr=sprOwataWalk2
    if (sprite_index=sprOwataJump) spr=sprOwataJump2
    draw_sprite_ext(spr,floor(image_index),floor(x),floor(y),image_xscale,image_yscale,image_angle,image_blend,get_room_darkness())
}
draw_sprite_ext(sprite_index,floor(image_index),floor(x),floor(y),1,1,image_angle,$ffffff,1)
