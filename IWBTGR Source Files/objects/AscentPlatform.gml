#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!activated) {
    if (instance_place(x,y-2,player).onPlatform) {
        activated=true
        vspeed=-1
    }
}

event_inherited()
