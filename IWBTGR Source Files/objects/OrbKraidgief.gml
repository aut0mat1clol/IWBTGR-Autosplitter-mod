#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()
if (savedata("orb_kraidgief")) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    savedata("orb_kraidgief",1)
    play_important("zanbeat")
    visible=0
    if (global.diff!=3) {
        saveGame()
        world.autosave=200
    }
}
