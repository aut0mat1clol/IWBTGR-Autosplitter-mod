#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
visible=0
if (global.char=2 && !settings("vicseen")) {image_index=0 visible=1}
if (global.char=3 && !settings("owataseen")) {image_index=1 visible=1}
if (global.char=4) {image_index=2 visible=1}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    if (global.char=2 && settings("vicseen")) {image_alpha-=0.05}
    if (global.char=3 && settings("owataseen")) {image_alpha-=0.05}
    if (image_alpha<0) instance_destroy()
}
