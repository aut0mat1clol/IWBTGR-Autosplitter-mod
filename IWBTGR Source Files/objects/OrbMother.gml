#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (savedata("orb_mother")) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    play_important("motherorb (2)")
    global.save_on_room_change=1
    global.orb_on_room_change="orb_mother"
    instance_destroy()
}
