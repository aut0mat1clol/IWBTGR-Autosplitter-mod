#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=2
image_yscale=2
image_speed=mmf_animspeed(90)
nonstick=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && state=0) {
    visible=1
    path_start(pRyu,mmf_speed(90),0,1)
    state=1
    play_sound("hurrikick")
}

if (state=2) {
    if (y>ystart) {
        state=3
        y=ystart
        path_start(pRyu,mmf_speed(50),3,1)
    }
}
#define Collision_FactoryCeiling
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=4) {
    state=5
    other.vspeed=vspeed
    other.solid=0
    play_sound("break")
}
#define Collision_RyuWind
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=3) {
    path_end()
    speed=0
    gravity=-0.5
    state=4
}
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=1) {
    state=2
    vspeed=mmf_speed(50)
}
