#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("break")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) go=1

if (go=1) {
    image_angle=max(-90,image_angle-3.6)
    if (image_angle=-90) {go=2}
}

if (go=2) {count+=1 if (count>25) go=3}

if (go=3) {angle-=10 if (angle=-40) angle=0 hspeed=mmf_speed(14)}
#define Collision_deliciousFruit
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) {
    if (!locked) {
        play_sound("19347_martian_chorused_bounces_06")
        locked=1
        direction=point_direction(x,y,global.px,global.py)
        speed=mmf_speed(60)
    }
}
#define Collision_blockTrapDestructible
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go=3 || (image_angle>-20 && image_angle<0)) {
    alarm[0]=2
    other.hspeed=2
    with (other) {
        with (instance_place(x,y-1,spikeUp)) if (dest) {
            (instance_create(x,y,DestroyedSpike)).hspeed=2
            instance_destroy()
        }
        instance_destroy()
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (go) draw_sprite_ext(sprWheel,0,x-8,y,1,1,angle,$ffffff,1)
