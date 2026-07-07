#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y=ystart) if (place_meeting(x,y,player) || place_meeting(x,y+32,player)) gravity=1

if (gravity) {
    if (y+vspeed>ystart+32) {
        y=ystart+32
        gravity=0
        vspeed=0
        play_sound("break")
        if (place_meeting(x,y,player)) killPlayer(PaintingTrap)
    }
}
