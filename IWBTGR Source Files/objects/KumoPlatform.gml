#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.1

coll=instance_create(x,y,movingPlatform)
coll.visible=0
coll.image_xscale=3
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) vspeed=-sign(y-ystart)

coll.x=x+7
coll.y=y+7
coll.hspeed=hspeed
coll.vspeed=max(0,vspeed)
coll.yspeed=min(0,vspeed)
#define Collision_KumoStopper
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=0
