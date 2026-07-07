#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index=0) {
    if (other.vic) killPlayer(object_index)
    play_sound("tysonhitted")
    other.vspeed=-30
    if (other.boshy) other.vspeed=-36
    other.djump=1
    image_speed=mmf_animspeed(60)
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=image_number-1
