#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_start(pMoonFall,1,0,1)
image_xscale=1.1*3
image_yscale=1.1*3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=20

xp=x
yp=y
#define Collision_blockTrapDestructible
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (path_index!=-1) {
    play_sound("break")
    other.hspeed=x-xprevious
    other.vspeed=y-yprevious
    with (other) instance_destroy()
}
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_end()
hspeed=x-xp
vspeed=y-yp
gravity=0.4
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_circle_color(floor(x),floor(y),115,0,0,0)
draw_circle_color(floor(x),floor(y),110,$ffffff,$ffffff,0)
draw_set_blend_mode(bm_subtract)
draw_sprite_ext(sprite_index,image_index,floor(x)+lengthdir_x(-0.5,image_angle)+lengthdir_x(-0.5,image_angle-90),floor(y)+lengthdir_y(-0.5,image_angle)+lengthdir_y(-0.5,image_angle-90),3,3,image_angle,$ffffff,1)
draw_set_blend_mode_ext(10,1)
draw_circle_color(floor(x),floor(y),110,$ffffff,$ffffff,0)
draw_set_blend_mode(0)
