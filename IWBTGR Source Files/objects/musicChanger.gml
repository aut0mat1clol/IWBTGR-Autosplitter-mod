#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inside_view()) {
    if (!active) play_music(song)
    active=1
} else {
    if (active) play_music(room_song())
    active=0
}
