#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && !go) {
    go=1
    player.cutscene=true
    player.h=0
    play_sound("earthquaketest (2)")
    play_music("")
    depth=-10
}

if (go) {
    if (scale < 9) {
        scale+=0.2
        image_xscale=scale
        image_yscale=scale
        if (scale >= 9) {
            scale=9
            play_sound("break")
            Dragon.active=1
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=floor(xstart+view_xview[0]*(1-0.03))
