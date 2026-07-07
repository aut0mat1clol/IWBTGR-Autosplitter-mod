#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=10
alarm[1]=30

hspeed=player.image_xscale*-2
vspeed=-2

image_speed=0
dead=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,Gastly)
image_index=1

play_sound("Pokeball_open")
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("64_Gastly_cry_2")
dead=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dead) {
    image_alpha-=0.05
    if (image_alpha<0) instance_destroy()
} else image_angle+=30
