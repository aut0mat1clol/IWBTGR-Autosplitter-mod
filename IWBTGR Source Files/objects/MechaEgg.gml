#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=-MechaBirdo.eggspeed

p=instance_create(x+68,y-92+29,EggPlatform)
p.hspeed=hspeed
p=instance_create(x+68,y+76-92+29,EggPlatform)
p.hspeed=hspeed
p=instance_create(x+68,y+125-92+29,EggPlatform)
p.hspeed=hspeed

if (MechaBirdo.phase==3) {
    p=instance_create(x,y,EggHitbox)
    p.hspeed=hspeed
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bbox_right<0) instance_destroy()
