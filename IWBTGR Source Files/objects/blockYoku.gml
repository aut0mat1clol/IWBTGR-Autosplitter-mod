#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!visible) {
    if (distance_to_object(player)<2) {
        play_sound("megamanappear")
        visible=1
    }
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
