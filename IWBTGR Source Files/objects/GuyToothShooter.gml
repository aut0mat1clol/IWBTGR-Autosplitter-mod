#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=mmf_speed(40)
#define Collision_GuyTooth
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) {
    image_index=image_number-1
    image_speed=0
    move_towards_point(global.px,global.py,mmf_speed(80))
    image_angle=direction-90
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (x>0) instance_destroy()
