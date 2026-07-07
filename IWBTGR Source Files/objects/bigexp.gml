#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex=sprite_get_texture(sprite_index,0)
v=10
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
v+=1 if (v>90) {draw_set_alpha(1-((v-90)/50)) if ((v-90)/50>1) instance_destroy()}
d3d_transform_add_scaling(2,2,2)
d3d_transform_add_rotation_z(v*1.5)
d3d_transform_add_rotation_x(90)
d3d_transform_add_translation(x,y,0)
draw_set_color($ffff)
draw_set_blend_mode(bm_add)
texture_set_interpolation(1)
d3d_draw_ellipsoid(-60*sin(v*pi/1160),-60*sin(v*pi/1160),60*sin(v*pi/1160),60*sin(v*pi/1160),60*sin(v*pi/1160),-60*sin(v*pi/1160),tex,2,1,8)
draw_set_color($160ff)
d3d_draw_ellipsoid(-160*sin(v*pi/1160),-160*sin(v*pi/1160),160*sin(v*pi/1160),160*sin(v*pi/1160),160*sin(v*pi/1160),-160*sin(v*pi/1160),tex,3,1.5,12)
draw_set_color(255)
d3d_draw_ellipsoid(-300*sin(v*pi/1160),-300*sin(v*pi/1160),300*sin(v*pi/1160),300*sin(v*pi/1160),300*sin(v*pi/1160),-300*sin(v*pi/1160),tex,4,2,16)
d3d_transform_set_identity()
texture_set_interpolation(0)
draw_set_blend_mode(0)
draw_set_color($ffffff)
draw_set_alpha(1)
