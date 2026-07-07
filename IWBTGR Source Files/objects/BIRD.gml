#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
image_speed=mmf_animspeed(50)
image_xscale=1.5
image_yscale=1.5
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
move_towards_point(global.px,global.py,mmf_speed(60))
alarm[0]=10
if (hspeed>0) image_xscale=abs(image_xscale)
else if (hspeed<0) image_xscale=-abs(image_xscale)
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char=2) play_sound("vichit")
else play_sound("birddeath")
instance_create(x,y,NinjaExplosion)
instance_destroy()
