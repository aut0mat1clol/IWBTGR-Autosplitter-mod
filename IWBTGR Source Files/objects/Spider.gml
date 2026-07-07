#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=2
image_yscale=3

flip=5
alarm[0]=5

image_angle=270

if (global.char!=4) instance_destroy()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=10
flip=-flip
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (player.x>2272 && hspeed=0) {
    hspeed=-24
    play_sound("148_aaaaaaaaaaaah_newandlouder")
}

image_angle+=flip
