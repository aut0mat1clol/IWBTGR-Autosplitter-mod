#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
spd=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active || timer > 0) {
    if (timer < 10) {
        if (timer mod 2 < 1) {
            x=xstart-1
            y=ystart-1
        } else {
            x=xstart+1
            y=ystart+1
        }
    } else if (timer == 10) {
        x=xstart
        y=ystart
        vspeed=spd
    }
    timer+=1
}
