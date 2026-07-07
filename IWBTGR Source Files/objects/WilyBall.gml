#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=mmf_speed(60)
image_xscale=3
image_yscale=3
image_speed=1/(8/60*50)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=-mmf_speed(15)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed!=0 && y>410-16+24*3) {
    y=410-16+24*3
    cameraHard.voffset=4
    vspeed=0
    play_sound("break")
    alarm[1]=46
}

image_angle=round(image_index)*45

if (!inside_view()) {
    instance_destroy()
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.hspeed!=0) {
    other.vspeed=-abs(other.hspeed)
    other.hspeed=0
    other.valid=1
    play_sound("click")
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x,y,3,3,0,$ffffff,1)
