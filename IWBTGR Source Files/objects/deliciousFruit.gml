#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(20)
delay=2
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//cherries take one extra frame to activate so we emulate that
//by moving it back...
if (speed) {
    if (delay=1) {
        x-=hspeed
        y-=vspeed
    }
    delay-=1
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (room!=rCredits) instance_destroy()
