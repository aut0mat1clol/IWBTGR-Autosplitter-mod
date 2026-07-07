#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (x==1952) vspeed=-1
else vspeed=3

coll=instance_create(x,y,movingPlatform)
coll.image_xscale=2.875
coll.visible=0
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
coll.x=x
coll.y=y
coll.vspeed=max(0,vspeed)
coll.yspeed=min(0,vspeed)
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y>1500) y=1240
else y=1792
