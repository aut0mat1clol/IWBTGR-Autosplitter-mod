#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(40)
alarm[0]=50
alarm[1]=5
spd=0
dir=1
hspeed=mmf_speed(30)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd=0
dir=-dir
alarm[0]=50
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spd+=1
alarm[1]=5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y+=spd*dir
if (dir<0) sprite_index=sprMedusaUp
else sprite_index=sprMedusa
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char=2) play_sound("vichit")
else play_sound("song162")
with (instance_create(x,y,MedusaDead)) {
    image_xscale=abs(image_xscale)*sign(other.image_xscale)
}
instance_destroy()
#define Collision_MedusaModifier
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.px<x) {
    hspeed=mmf_speed(-15)
    x-=80
} else instance_destroy()
