#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale*=10
image_yscale=10
alarm[0]=150
blocking=false
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y==ystart) y-=1
if (y==ystart-1) y+=2
alarm[0]=1
if (y==ystart+1) {
    y=ystart
    alarm[0]=148
}
if (GuyHead.phase==2) {
    y=ystart
    alarm[0]=-1
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (blocking) {
    other.direction=random(360)
    play_sound("click")
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=-90*sign(image_xscale)
y=ystart+10-(image_xscale<0)
x=xstart+51*sign(image_xscale)-(image_xscale<0)
blocking=true
