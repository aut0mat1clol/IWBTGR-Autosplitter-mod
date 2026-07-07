#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=7
tex=background_get_texture(bgHigginsPainting)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && !go) {
    go=1
    play_sound("break")
    play_sound("metal2")
}

if (go) {
    a+=0.2
    angle+=a
    x=xstart-64*(angle/90)
    image_xscale=7+4*(angle/90)
    depth=0
    if (angle>40) depth=-1
    if (angle>=80) visible=0
    if (angle>180) instance_destroy()
    image_yscale=max(1,264-lengthdir_x(264,angle))/32
    if (place_meeting(x,y,player)) killPlayer(Higger)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inside_view()) {
    d3d_set_depth(0)
    d3d_set_projection_ext(5200,912,-800,5200,912,0,0,-1,0,-2*point_direction(0,0,800,304),800/608,8,2048)
    d3d_transform_add_rotation_x(-angle)
    d3d_transform_add_translation(xstart+0.5,y+264.5,0)
    d3d_draw_floor(0,-264,0,224,0,0,tex,-1,1)
    d3d_transform_set_identity()
    d3d_transform_add_translation(0,0,-global.offh)
    d3d_set_projection_ortho(view_xview[0],view_yview[0],800,global.resh,0)
}
