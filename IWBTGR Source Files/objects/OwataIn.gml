#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
y-=16*41
vspeed=16
alarm[0]=42
play_sound("mmin")
player.visible=0
player.cutscene=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=0
image_index=0
alarm[1]=8
play_sound("mmland")
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
player.visible=1
player.cutscene=0
