#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=10
image_yscale=10
image_speed=0

hp=30
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
if (damage) {
    image_index=1
    hp-=damage
    damage=0
    play_sound("hit")
    if (hp<=0) {
        MechaBirdo.phase=2
        MechaBirdo.image_speed=mmf_animspeed(15)
        MechaBirdo.alarm[1]=3*50
        play_sound("break")
        instance_create(0,-999,MechaHitbox2)
        instance_destroy()
    }
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
damage=other.damage
with (other) instance_destroy()
