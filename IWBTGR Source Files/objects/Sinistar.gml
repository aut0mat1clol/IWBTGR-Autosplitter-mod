#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=3
image_speed=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("run_cowd")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (win) {
    gravity=-0.2
} else if (active) {
    move_towards_point(global.px,global.py,spd)
    spd+=0.02
    if (!instance_exists(player)) {
        play_sound("aargh")
        win=1
    }
} else if (inside_view()) {
    if (!instance_exists(ArkaBrick) && instance_exists(player)) {
        active=1
        depth=-1
        alarm[0]=110
        play_sound("beware_i")
        image_speed=0.2
    }
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    killPlayer(Sinistar)
    play_sound("aargh")
    win=1
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    play_sound("hit")
    x+=sign(x-other.x)*32
    with (other) instance_destroy()
}
#define Collision_VicViper
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && other.active) {
    with (other) event_user(0)
    play_sound("aargh")
    win=1
}
