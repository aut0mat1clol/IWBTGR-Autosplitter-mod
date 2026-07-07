#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("noparticles")) instance_destroy()
vspeed=-random_range(4,12)
gravity=random_range(0,-0.5)
alarm[0]=irandom_range(10,40)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
