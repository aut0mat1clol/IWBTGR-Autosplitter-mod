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

if (abs(memy-camy)>32 || force) {
    force=0
    memy=camy
    activation_update()
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (player.x>800) {
    view_xview[0]=800
    view_yview[0]=2432
} else {
    if (force) {
        with (player) {
            other.camy=median(0,y-304,room_height-608)+voffset
        }
    } else {
        with (player) {
            other.camy=median(0,(other.camy*19+y-304)/20,room_height-608)
        }
    }

    view_xview[0]=0
    view_yview[0]=camy
}

with (gameOver) event_user(0)
