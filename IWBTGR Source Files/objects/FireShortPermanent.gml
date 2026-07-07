#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("noparticles")) visible=0
sprite_index=sprFireMarker
image_index=6
image_speed=mmf_animspeed(50)
nonstick=1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index>=8) image_index-=2
