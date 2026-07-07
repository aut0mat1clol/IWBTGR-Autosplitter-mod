#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(CreditsChalice)) {
    with (Fire) visible=1
    play_sound("shatter")
    FireGlow.visible=1
    instance_destroy()
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) instance_destroy()
play_sound("hit")
visible=1
with (CreditsChalice) vspeed=mmf_speed(50)
#define Other_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///https://www.youtube.com/watch?v=dQw4w9WgXcQ
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode_ext(10,1)
rect(x,y,image_xscale*32,image_yscale*32,$ffffff,0)
draw_set_blend_mode(0)
visible=0
