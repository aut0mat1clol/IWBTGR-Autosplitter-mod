#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=-3
image_yscale=3
image_speed=mmf_animspeed(20)
direction=mmf_direction(17)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=mmf_speed(20)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dx=floor(x)
dy=floor(y)

draw_sprite_ext(sprDragonMouth,0,dx,dy+3*(floor(frame)-1),image_xscale,image_yscale,0,$ffffff,1)
draw_sprite_ext(sprDragon,floor(image_index),dx,dy,image_xscale,image_yscale,0,$ffffff,1)
