#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(50)
alarm[0]=60
nonstick=true
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
move_towards_point(global.px,global.py,mmf_speed(30))
visible=true
alarm[1]=40
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=0
alarm[0]=60
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!visible && eye) {
    x=eye.x
    y=eye.y
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!visible) exit
with (other) instance_destroy()
play_sound("shatter")
x=eye.x
y=eye.y
speed=0
visible=false
alarm[0]=160
alarm[1]=-1
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
