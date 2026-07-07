#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y,player)) killPlayer(Hammer)
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x,other.y-129,block)
i.sprite_index=sprHammer
i.visible=1
instance_destroy()
