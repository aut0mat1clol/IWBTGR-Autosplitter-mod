#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active || timer > 0) {
    if (timer==0) play_sound("break")

    if (timer>=20/mmf_animspeed(50)) vspeed=mmf_speed(50)

    if (timer mod 4 == 0) y-=1
    if (timer mod 4 == 2) y+=1

    timer+=1
}
