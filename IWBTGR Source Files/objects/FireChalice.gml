#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(100)
nonstick=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.px>800) {
    if (!settings("noparticles")) {
        with (FireGlow) visible=1
        with (Fire) visible=1
        with (FireSometimes) visible=1
        with (FireShort) visible=1
        with (FireOnce) visible=1
    }
    instance_destroy()
}
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!settings("noparticles")) {
    with (FireGlow) visible=1
    with (Fire) visible=1
    with (FireSometimes) visible=1
    with (FireShort) visible=1
    with (FireOnce) visible=1
}

if (inside_view() && !crash) {play_sound("shatter") crash=1}
