#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && vspeed==0) {
    i=instance_create(x,592,musicChanger)
    i.song=""
    play_sound("19347_martian_chorused_bounces_06")
    vspeed=6
}

if (vspeed) {
    with (blockTrapDestructible) if (y<other.y+64) {
        play_sound("break")
        hspeed=sign(x-other.x-16)*4
        vspeed=1
        instance_destroy()
    }
}
