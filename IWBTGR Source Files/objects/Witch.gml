#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=-999
image_speed=mmf_animspeed(50)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var yes;

if (spin) image_angle-=20

if (active) {
    valid=1
    if (!going) {
        yes=1
        with (WitchShadow) if (place_meeting(x,y,blockNise)) yes=0
        if (yes) {
            with (WitchShadow) instance_destroy()
            going=1
            hspeed=mmf_speed(50)
            y=ystart
        }
    }
}
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
spin=1
hspeed=0
vspeed=mmf_speed(60)
