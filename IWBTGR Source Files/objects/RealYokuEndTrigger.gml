#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (RealYoku) {
    silent=1
    event_user(0)
    alarm[1]=-1
}
play_sound("megamanappear")
with (RealYokuController) instance_destroy()
instance_destroy()
