#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (savedata("orb_birdo")) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    savedata("orb_birdo",1)
    play_important("birdoorb")
    visible=0
    alarm[0]=50*4.1
    if (global.diff!=3) {
        saveGame()
        world.autosave=200
    }
}
