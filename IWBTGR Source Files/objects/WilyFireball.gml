#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
vspeed=mmf_speed(20)
image_xscale=2
image_yscale=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=timer+1
if (timer>=2) {
    image_xscale=-image_xscale
    timer=0
}
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!other.solid) exit
with (instance_create(x,other.y,WilyFirePillar)) {up=20 down=75}
with (instance_create(x-64,other.y,WilyFirePillar)) {up=40 down=80}
with (instance_create(x-128,other.y,WilyFirePillar)) {up=60 down=90}
with (instance_create(x+64,other.y,WilyFirePillar)) {up=40 down=80}
with (instance_create(x+128,other.y,WilyFirePillar)) {up=60 down=90}
instance_destroy()
