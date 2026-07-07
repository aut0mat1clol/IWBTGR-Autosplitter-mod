#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=18.75
image_yscale=17.4
hspeed=-35
global.silent_gameover=1
lock=0
play_music("")
inst=play_sound("mariopaint")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (x<player.x && !lock) {
    lock=1
    killPlayer(id)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODInstanceStop(inst)
