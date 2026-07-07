#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mem) player.y+=2
mem=0

if (place_meeting(x,y-2,player) && player.onPlatform && vspeed=0) {
    vspeed=2
    player.y+=2
    mem=1
}

event_inherited()
