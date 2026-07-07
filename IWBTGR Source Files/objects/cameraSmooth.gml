#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
force=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (force) {
        with (player) {
            other.camx=median(0,floor(x/800)*800,room_width-800)+voffset
            other.camy=median(0,floor(y/608)*608,room_height-608)+voffset
        }
        force=0
} else if (room=rDev) {
    with (player) {
        other.camx=median(0,(other.camx*19+x-400)/20,room_width-800)
        other.camy*=1-1/20
    }
} else {
    with (player) {
        other.camx=median(0,(other.camx*19+x-400)/20,room_width-800)
        other.camy=median(0,(other.camy*19+y-304)/20,room_height-608)
    }
}

view_xview[0]=camx
view_yview[0]=camy

view_yview[0]+=voffset
voffset=0

with (gameOver) event_user(0)
