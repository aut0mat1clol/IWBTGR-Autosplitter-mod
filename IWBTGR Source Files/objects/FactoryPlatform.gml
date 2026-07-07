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

if (place_meeting(x,y-2,player) && player.onPlatform && !active) {
    if (up) yspeed=-2
    else {vspeed=2 player.y+=2 mem=1}
    active=1
}

if (active && (y>view_yview[0]+608 || y<view_yview[0]-32))
    instance_destroy()

event_inherited()
