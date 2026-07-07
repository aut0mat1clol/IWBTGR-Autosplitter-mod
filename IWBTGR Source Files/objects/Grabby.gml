#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=false
image_speed=0
nonstick=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index+image_speed>=image_number || image_index+image_speed<0) {
    image_speed=-image_speed
}
if (active && image_speed==0) {
    image_speed=mmf_animspeed(30)
    visible=true
}
