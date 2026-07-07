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
nonstick=1
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
if (bbox_top>0 && instance_place(x+hspeed,y+vspeed,block).solid) {
    with (instance_create(x,544,WilyFirePillar)) {up=20 down=75}
    with (instance_create(x-64,544,WilyFirePillar)) {up=40 down=80}
    with (instance_create(x-128,544,WilyFirePillar)) {up=60 down=90}
    with (instance_create(x+64,544,WilyFirePillar)) {up=40 down=80}
    with (instance_create(x+128,544,WilyFirePillar)) {up=60 down=90}
    instance_destroy()
}
