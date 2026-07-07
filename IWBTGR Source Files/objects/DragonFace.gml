#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=130
image_yscale=108
image_blend=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (Dragon.shooting && other.vspeed==0) {
    play_sound("hit")
    with (other) instance_destroy()
    Dragon.hp+=other.damage
    visible=1
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    draw_set_blend_mode_ext(10,1)
    rect(bbox_left,bbox_top,130,108,$ffffff,0)
    draw_set_blend_mode(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=
*/
