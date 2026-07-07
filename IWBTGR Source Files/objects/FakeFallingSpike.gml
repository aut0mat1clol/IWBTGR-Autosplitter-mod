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
    if (timer mod 4 < 2) {
        x=xstart-1
        y=ystart-1
    } else {
        x=xstart+1
        y=ystart+1
    }
    timer+=1
}
