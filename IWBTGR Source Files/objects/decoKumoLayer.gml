#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tex0=sprite_get_texture(sprite_index,0)
tex1=sprite_get_texture(sprite_index,1)

time=0

instance_create(x,y,decoKumoLayer2)
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

draw_primitive_begin_texture(pr_trianglestrip,tex1)
    u=floor(time*2/3)/32
    draw_vertex_texture(xx,yy+50,u,0)
    draw_vertex_texture(xx+800,yy+50,u+25,0)
    draw_vertex_texture(xx,yy+114,u,1)
    draw_vertex_texture(xx+800,yy+114,u+25,1)
draw_primitive_end()

//mike's room doesn't have this layer
if (!noFirst) {
    draw_primitive_begin_texture(pr_trianglestrip,tex0)
        u=floor(time+16)/32
        draw_vertex_texture(xx,yy+17,u,0)
        draw_vertex_texture(xx+800,yy+17,u+25,0)
        draw_vertex_texture(xx,yy+81,u,1)
        draw_vertex_texture(xx+800,yy+81,u+25,1)

        u=floor(time)/32
        draw_vertex_texture(xx,yy,u,0)
        draw_vertex_texture(xx+800,yy,u+25,0)
        draw_vertex_texture(xx,yy+64,u,1)
        draw_vertex_texture(xx+800,yy+64,u+25,1)
    draw_primitive_end()
}
