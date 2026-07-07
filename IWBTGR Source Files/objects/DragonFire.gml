#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nonstick=1

image_speed=mmf_animspeed(50)
speed=mmf_speed(60)
direction=point_direction(x,y,global.px,global.py-16)
image_xscale=3*sign(hspeed)
image_yscale=3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inside_view()) instance_destroy()
