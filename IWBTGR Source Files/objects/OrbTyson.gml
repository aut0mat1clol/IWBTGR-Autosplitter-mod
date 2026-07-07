#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

defeat_bossrush("tyson")

if (savedata("orb_tyson")) instance_destroy()
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    savedata("orb_tyson",1)
    play_important("tysonorb")
    visible=0
    alarm[0]=50*4.9
    with (BossTeleporter) if (type="tyson") image_index=1
    if (global.diff!=3) {
        saveGame()
        world.autosave=200
    }
}
