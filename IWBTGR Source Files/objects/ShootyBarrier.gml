#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index+=0.2*other.damage
if (image_index>=image_number) {
    //visible=0
    play_sound("shatter")
    instance_destroy()
}
