#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) vspeed=mmf_speed(200)

shake=-shake+sign(shake)

cameraSmooth.voffset=shake
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
shake=16
vspeed=0
y=other.y
if (!sound) {sound=1 play_sound("thwomp")}
