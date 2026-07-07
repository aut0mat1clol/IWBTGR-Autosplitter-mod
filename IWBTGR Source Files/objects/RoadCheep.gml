#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=2
image_yscale=2

image_speed=mmf_animspeed(50)
direction=mmf_direction(12)
speed=mmf_speed(60)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
go=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    timer+=1
    if (timer>5) {
        direction+=mmf_direction(1)
        timer=0
    }
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.vic) killPlayer(object_index)
other.hspeed=-8
other.vspeed=-8
if (!other.fished) play_sound("pound")
other.fished=20
other.carted=0
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=270
play_sound("thud")
