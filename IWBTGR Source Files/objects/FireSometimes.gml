#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("noparticles")) visible=0
sprite_index=sprFireMarker
image_speed=0
nonstick=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) image_speed=mmf_animspeed(30)
