#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=mmf_speed(50)
direction=mmf_direction(2)
image_speed=mmf_animspeed(50)
if (global.char==1) {
    sprite_index=sprDotKid
} else if (global.char==2) {
    sprite_index=sprVic
    image_speed=0
} else if (global.char==3) {
    sprite_index=sprOwataJump
    image_speed=0
    owater=1
} else if (global.char==4) {
    sprite_index=sprBoshyFall
    image_speed=0.2
    boshy=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed>0) {
    direction-=mmf_direction(1)/7
} else {
    direction=-90
}

if (y<608) image_angle+=20
else if ((image_angle mod 360>25))
    image_angle+=20
else image_angle=0

if (global.char==2) {
    image_index=2+2*sin(timer)+5*(timer mod 1 < 0.5)
    timer+=0.25
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
view_yview[0]=floor(median(0,y-304,4000-608))
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    play_sound("hit")
    play_music("")
}
visible=0
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
