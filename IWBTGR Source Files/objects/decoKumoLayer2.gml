#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex2=sprite_get_texture(sprite_index,2)
tex3=sprite_get_texture(sprite_index,3)

time=0
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_repeat(1)

time+=!instance_exists(ErrorTrap)

if (room=rMechaBirdoBoss) time+=3

xx=x-0.5
yy=y-0.5

draw_primitive_begin_texture(pr_trianglestrip,tex3)
    u=floor((time/3) mod 32)/32
    draw_vertex_texture(xx,yy+102,u,0)
    draw_vertex_texture(xx+800,yy+102,u+25,0)
    draw_vertex_texture(xx,yy+166,u,1)
    draw_vertex_texture(xx+800,yy+166,u+25,1)
draw_primitive_end()

draw_primitive_begin_texture(pr_trianglestrip,tex2)
    u=floor(time/2)/32
    draw_vertex_texture(xx,yy+67,u,0)
    draw_vertex_texture(xx+800,yy+67,u+25,0)
    draw_vertex_texture(xx,yy+131,u,1)
    draw_vertex_texture(xx+800,yy+131,u+25,1)
draw_primitive_end()
