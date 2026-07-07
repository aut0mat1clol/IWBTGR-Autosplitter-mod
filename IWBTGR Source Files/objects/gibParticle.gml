#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room=rCredits) depth=-1013
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=abs(gravity)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=(hspeed)*-5
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.solid) exit

move_bounce_solid(1)
hspeed=median(-6,hspeed,6)
speed=max(0,speed/2-0.5)
#define Collision_playerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.solid) exit

move_bounce_solid(1)
hspeed=median(-6,hspeed,6)
speed=max(0,speed/2-0.5)
#define Collision_RyuWind
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=-abs(gravity)
alarm[0]=2
