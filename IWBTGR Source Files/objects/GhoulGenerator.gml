#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=175
hspeed=mmf_speed(choose(5,-5))
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inside_active()) instance_create(x+16,y+32-32,Ghoul)
alarm[0]=175
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inside_active()) x-=hspeed
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=abs(hspeed)*sign(x-other.x)
