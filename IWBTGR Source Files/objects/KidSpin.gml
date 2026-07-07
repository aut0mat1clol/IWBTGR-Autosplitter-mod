#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char==1) {
    sprite_index=sprDotKid
} else if (global.char==2) {
    sprite_index=sprVic
} else if (global.char==3) {
    sprite_index=sprOwataJump
} else if (global.char==4) {
    sprite_index=sprBoshyJump
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle+=10

move_towards_point(380,962,20)

if (point_distance(x,y,380,962)<20) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprOwataJump) draw_sprite_ext(sprOwataJump2,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,get_room_darkness())
draw_self()
