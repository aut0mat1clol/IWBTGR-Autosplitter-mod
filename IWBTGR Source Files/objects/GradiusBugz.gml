#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(50)
sprite_index=sprDumbBugz
y+=16
image_xscale=-1
#define Collision_GradiusMarker
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) direction=point_direction(x,y,global.px,global.py)
active=1
#define Collision_VicBullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) instance_destroy()
play_sound("vichit")
(instance_create(x,y,DeadBugz)).image_xscale=image_xscale
instance_destroy()
