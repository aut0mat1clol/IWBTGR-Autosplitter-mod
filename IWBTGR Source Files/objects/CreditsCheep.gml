#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=-2
image_yscale=2
hspeed=mmf_speed(10)
image_speed=mmf_animspeed(50)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if ((hspeed>0 && x-xstart>176) || (hspeed<0 && xstart-x>16)) {
    hspeed=-hspeed
    image_xscale=-image_xscale
    x+=16*sign(hspeed)
}
