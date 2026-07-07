#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(90)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
move_towards_point(global.px,global.py,mmf_speed(50))
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
(instance_create(x,y,DeadBugz)).image_xscale=image_xscale
if (global.char=2) play_sound("vichit")
else play_sound("splatter")
instance_destroy()
