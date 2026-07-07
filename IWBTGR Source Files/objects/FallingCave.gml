#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active || timer > 0) {
    if (timer == 0 && !silent) play_sound("break")
    if (timer < 20) {
        if (timer mod 2 < 1) {
            y=ystart-1
        } else {
            y=ystart
        }
    } else if (timer == 20) {
        x=xstart
        y=ystart
        vspeed=mmf_speed(60)
    }
    timer+=1
}
