#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) go=1

if (go) {
    timer+=1
    depth=0
    if (timer=1) y-=1
    if (timer=3) hspeed=mmf_speed(100)
    if (!inside_view()) instance_destroy()
}
