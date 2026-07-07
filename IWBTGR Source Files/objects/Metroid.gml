#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=30/200
hit=0
play_sound("metroid_noise")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hit) {
    if (!instance_exists(player) && !ate) {
        hspeed=0
        vspeed=mmf_speed(-10)
    } else {
        counter+=1
        if (counter<100) {
            speed=mmf_speed(50)
            direction=point_direction(x,y,global.px,global.py)
        }
        if (counter=100) {
            ate=1
            with (player) if (visible) {
                instance_create(x,y,PlayerMetroided)
                visible=0
                frozen=1
            }
            play_sound("metroid_noise")
            hspeed=0
            vspeed=mmf_speed(-10)
        }
        if (counter=160) {
            speed=0
            PlayerMetroided.image_speed=mmf_animspeed(20)
        }
    }
} else {
    if (instance_exists(player)) {
        speed=mmf_speed(100)
        direction=point_direction(x,y,global.px,global.py)
    } else {
        hspeed=0
        vspeed=mmf_speed(-10)
    }
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!hit) {
    play_sound("splatter")
    hit=1
}
