#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

defeat_bossrush("bowser")
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    savedata("orb_bowser",1)
    play_important("bowserorb")
    visible=0
    alarm[0]=50*7.5
    if (global.diff!=3) {
        saveGame()
        world.autosave=200
    }
}
