#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=45
image_yscale=44

hp=5
wait=1
alarm[0]=50
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
wait=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (damage) {
    hp-=damage
    damage=0
    play_sound("hit")
    if (hp<=0) {
        MechaBirdo.dead=1
        MechaBirdo.alarm[6]=100
        play_sound("paintboom")
        play_sound("metal2")
        instance_destroy()
    } else MechaBirdo.flash=1
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
damage=other.damage
with (other) instance_destroy()
