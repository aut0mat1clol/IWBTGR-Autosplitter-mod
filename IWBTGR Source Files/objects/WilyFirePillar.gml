#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
image_speed=0
image_xscale=2
image_yscale=2
nonstick=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1
if (floor(image_index) == 0 || floor(image_index) == image_number-1) {
    if (timer mod 10 == 0) {
        image_xscale=abs(image_xscale)
    } else if (timer mod 10 == 5) {
        image_xscale=-image_xscale
    }
}
if (timer == up) {
    image_speed=mmf_animspeed(20)
}
if (timer == down) {
    image_speed=-mmf_animspeed(20)
}
if (timer > down && image_index < 1) {
    instance_destroy()
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=image_number-1
image_speed=0
