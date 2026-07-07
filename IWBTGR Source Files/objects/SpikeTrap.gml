#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
kill=instance_create(x,y,blockKill)
kill.image_xscale=2
kill.image_yscale=0.5

coll=instance_create(x,y,movingPlatform)
coll.image_xscale=2
coll.visible=0

i=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=-1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>860) {vspeed=0 y=860 alarm[0]=250}
if (y<ystart) {vspeed=0 y=ystart}

coll.y=y+1
kill.y=y+8
