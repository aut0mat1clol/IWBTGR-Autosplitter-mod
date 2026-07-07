#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visspd=1
alarm[0]=1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(random_range(bbox_left+4,bbox_right-4),y-random(4),MedusaFlame)
alarm[0]=3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=(visible+visspd) mod 1
visspd-=0.05
if (visspd<0.3) instance_destroy()
