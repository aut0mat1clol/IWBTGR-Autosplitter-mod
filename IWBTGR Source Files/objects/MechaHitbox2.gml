#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=32
image_yscale=32

hp=15
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
        MechaBirdo.phase=3
        MechaBirdo.image_speed=mmf_animspeed(15)
        MechaBirdo.blow=100
        MechaBirdo.alarm[2]=2*50
        play_sound("metal2short")
        play_sound("shatter")
        instance_create(0,-999,MechaHitbox3)
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
