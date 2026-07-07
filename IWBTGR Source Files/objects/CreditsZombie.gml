#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=3
image_speed=mmf_animspeed(50)
timer=0
image_xscale=1
hspeed=-mmf_speed(5)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index<3) image_index+=3
timer+=1
if (timer==20) {
    hspeed=-hspeed
    image_xscale=-image_xscale
    timer=0
}
