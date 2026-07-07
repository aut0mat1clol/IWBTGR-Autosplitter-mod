#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=irandom_range(-1,4)
vspeed=2
gravity=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c+=1

if (c=2) {image_xscale=-1 image_yscale=1}
if (c=4) {image_xscale=1 image_yscale=-1}
if (c=6) {image_xscale=1 image_yscale=1}
if (c=8) {image_xscale=-1 image_yscale=-1 c=0}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
