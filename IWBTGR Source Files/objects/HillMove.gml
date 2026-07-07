#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && image_index==0) {
    image_speed=mmf_animspeed(20)
    vspeed=-mmf_speed(15)
    play_sound("break")
}
if (y+vspeed<=ystart-32) {
    y=ystart-32
    vspeed=0
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=image_number-1
