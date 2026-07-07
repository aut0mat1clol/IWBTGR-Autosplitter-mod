#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!settings("clearowata")) instance_destroy()

image_xscale=-1
image_speed=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprOwataIdle2,0,floor(x),floor(y),image_xscale,image_yscale,image_angle,image_blend,1)
