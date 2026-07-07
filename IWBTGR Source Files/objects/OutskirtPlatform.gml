#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mem) player.y+=2
mem=0

if (place_meeting(x,y-2,player) && player.onPlatform && vspeed=0) {
    vspeed=2*((!up*2)-1)
    activated=true
    if (!up) {player.y+=2 mem=1}
}

if (activated) {
    if (!place_free(x,y) && !flash) flash=25
}
if (flash) {
    flash-=1
    visible=flash mod 4
    if (!flash) instance_destroy()
}

event_inherited()
