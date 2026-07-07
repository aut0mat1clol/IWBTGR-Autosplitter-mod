#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(70,80)
speed=-mmf_speed(1)

if (global.char==1) {
    sprite_index=sprKidsDots
    image_speed=0
    image_index=0
    y+=20
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed>0) if (place_meeting(x,y+vspeed,block)) {y-=vspeed vspeed=-vspeed}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char!=1) sprite_index=sprKids1J
if (global.char==4) {sprite_index=later image_speed=0.2}

vspeed=-random_range(-3,-4)
gravity=0.4
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,floor(image_index),floor(x),floor(y),image_xscale,1,0,$ffffff,1)

if (global.char==1) {
    if (image_index==0) col=$64ecf8
    if (image_index==1) col=$2c2c2c
    if (image_index==2) col=$250080
    if (image_index==3) col=$0158a4
    draw_circle_color(floor(x),floor(y),48,0,col,1)
}
