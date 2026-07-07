#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex2=sprite_get_texture(sprite_index,2)
tex3=sprite_get_texture(sprite_index,3)

if (room=rMechaBirdoBoss) {
    tex3=sprite_get_texture(sprite_index,1)
}

time=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_repeat(1)

time+=1
if (room=rMechaBirdoBoss) time+=3

xx=x-0.5
yy=y-0.5

draw_primitive_begin_texture(pr_trianglestrip,tex3)
    u=floor((time/3) mod 32)/32
    draw_vertex_texture(xx,yy+0,u,0)
    draw_vertex_texture(xx+800,yy+0,u+25,0)
    draw_vertex_texture(xx,yy+64,u,1)
    draw_vertex_texture(xx+800,yy+64,u+25,1)
draw_primitive_end()

draw_primitive_begin_texture(pr_trianglestrip,tex2)
    u=floor(time/2)/32
    draw_vertex_texture(xx,yy+24,u,0)
    draw_vertex_texture(xx+800,yy+24,u+25,0)
    draw_vertex_texture(xx,yy+88,u,1)
    draw_vertex_texture(xx+800,yy+88,u+25,1)
draw_primitive_end()
