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
    if (timer < 4) {
        if (timer mod 2 < 1) {
            x=xstart-1
            y=ystart-1
        } else {
            x=xstart+1
            y=ystart+1
        }
    } else if (timer == 4) {
        x=xstart
        y=ystart
        vspeed=10
    }
    timer+=1
}
