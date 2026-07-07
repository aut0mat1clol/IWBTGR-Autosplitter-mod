#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
frame=image_number-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frame-=mmf_animspeed(50)

image_index=frame

if (frame<0) {
    instance_destroy()
    visible=0
}
