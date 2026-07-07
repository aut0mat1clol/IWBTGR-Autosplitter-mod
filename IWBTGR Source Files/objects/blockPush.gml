#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
push_speed=1
fall_speed=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y+31<player.y-12 && vspeed!=0) solid=0
else solid=1

if (place_meeting(x-player.hspeed,y,player) && place_free(x+sign(player.hspeed)*push_speed,y)) {
    hspeed=sign(player.hspeed)*push_speed
} else {
    hspeed=0
}

if (place_meeting(x,y+1,block)) {
    vspeed=0
} else {
    vspeed=fall_speed
}

if(vspeed!=0){
    if (place_meeting(x,y+vspeed,player)) {
        with (player) killPlayer(id)
    }
}
