#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.25
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=45/mmf_animspeed(50)

move_towards_point(global.px,global.py,mmf_speed(60))
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char!=2) {
    if (global.char==3) {
        if (!(count mod 20)) play_sound("mmdamage")
    } else {
        play_sound("splatter")
        instance_create(global.px,global.py,blood)
    }
}

count+=1
if (count>=50) {
    if (global.char=2) play_sound("vichit")
    killPlayer(Playstation)
    instance_destroy()
}
