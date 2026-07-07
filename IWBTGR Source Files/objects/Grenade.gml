#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
nonstick=1
vspeed=mmf_speed(60)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=22.5
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.object_index=block) {
    play_sound("shatter")
    var xx;
    for (xx=112;xx<=688;xx+=64) {
        with (instance_create(xx,578,WilyFirePillar)) {up=20 down=75}
    }
    instance_destroy()
}
