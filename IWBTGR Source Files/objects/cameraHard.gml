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

if (memx!=camx || memy!=camy || force) {
    force=0
    memx=camx
    memy=camy
    activation_update()
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (player) {
    other.camx=median(0,floor(x/800)*800,room_width-800)+other.hoffset
}

if (room==rMetroid && camx>=2400 && settings("smoothmetroid")) with (player) {
    if (y-304>other.camy+96) other.camy=y-304-96
    if (y-304<other.camy-96) other.camy=y-304+96
    other.camy=median(0,other.camy,room_height-608)+other.voffset
} else with (player) {
    other.camy=median(0,floor(y/608)*608,room_height-608)+other.voffset
}

hoffset=0
voffset=0

view_xview[0]=camx
view_yview[0]=camy

with (MommyThinker) if (escape && timer mod 12.5<1) view_yview[0]+=3

with (gameOver) event_user(0)
