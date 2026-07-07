#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mode=0
go=0
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    timer+=1
    mode=min(6,ceil(timer/4))
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mode=0) {
    //subtract
    draw_set_blend_mode(bm_subtract)
    draw_sprite(sprite_index,0,x,y)
    draw_set_blend_mode(0)
}

if (mode=1) {
    //inverted
    draw_set_blend_mode_ext(10,1)
    rect(bbox_left,bbox_top,bbox_right-bbox_left,bbox_bottom-bbox_top,$ffffff,1)
    draw_set_blend_mode(0)
    draw_sprite(sprite_index,0,x,y)
    draw_set_blend_mode_ext(10,1)
    rect(bbox_left,bbox_top,bbox_right-bbox_left,bbox_bottom-bbox_top,$ffffff,1)
    draw_set_blend_mode(0)
}

if (mode=2) {
    //this is supposed to be xor but we can't have that
    //so here's an empyrically found approximation
    draw_set_blend_mode_ext(10,11)
    //(we use 3d mode to alpha test the transparency)
    d3d_start()
    draw_sprite(sprite_index,0,x,y)
    d3d_end()
    draw_set_blend_mode(0)
}

if (mode=3) {
    //monochrome
    draw_sprite(sprite_index,1,x,y)
}

if (mode=4) {
    //add
    draw_set_blend_mode(bm_add)
    draw_sprite(sprite_index,0,x,y)
    draw_set_blend_mode(0)
}

if (mode=5) {
    //subtract again
    draw_set_blend_mode(bm_subtract)
    draw_sprite(sprite_index,0,x,y)
    draw_set_blend_mode(0)
}

if (mode=6) {
    //monochrome again
    draw_sprite(sprite_index,1,x,y)
}
