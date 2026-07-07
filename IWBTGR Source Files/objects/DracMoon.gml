#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=142/228*3
image_yscale=image_xscale

hspeed=mmf_speed(20)
if (global.px<x) hspeed=-hspeed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=22.5
repeat (3) instance_create(random_range(x-32,x+32),random_range(y-32,y+32),DracSplosion)
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_circle_color(floor(x),floor(y),72,0,0,0)
draw_circle_color(floor(x),floor(y),68,$ffffff,$ffffff,0)
draw_set_blend_mode(bm_subtract)
draw_sprite_ext(sprite_index,image_index,floor(x)+lengthdir_x(-0.5,image_angle)+lengthdir_x(-0.5,image_angle-90),floor(y)+lengthdir_y(-0.5,image_angle)+lengthdir_y(-0.5,image_angle-90),image_xscale,image_yscale,image_angle,$ffffff,1)
draw_set_blend_mode_ext(10,1)
draw_circle_color(floor(x),floor(y),68,$ffffff,$ffffff,0)
draw_set_blend_mode(0)
