#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=-2
image_yscale=2
image_speed=mmf_speed(100)

state=0
vspeed=-mmf_speed(45)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=50
direction=point_direction(x,y,global.px,global.py)
if (hspeed!=0) image_xscale=sign(hspeed)*2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=0) {
    if (y<154) {
        state=1
        alarm[0]=50
    }
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char=2) play_sound("vichit")
else play_sound("splatter")
with (other) if (damage=1) instance_destroy()
instance_destroy()
