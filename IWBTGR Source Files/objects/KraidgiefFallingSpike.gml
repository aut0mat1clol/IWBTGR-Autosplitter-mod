#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
spd=mmf_speed(20)
image_index=image_number-1
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active || timer > 0) {
    if (timer < 50) {
        if (timer mod 2 < 1) {
            x=xstart-1
            y=ystart-1
        } else {
            x=xstart+1
            y=ystart+1
        }
    } else if (timer == 50) {
        x=xstart
        y=ystart
        vspeed=spd
    }
    timer+=1
}
if (bbox_bottom>798) {
    y=ystart
    vspeed=0
    timer=0
    active=false
    image_index=0
    image_speed=mmf_animspeed(50)
}
event_inherited()
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=image_number-1
