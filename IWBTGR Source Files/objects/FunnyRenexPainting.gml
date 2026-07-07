#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
w=100
hw=w/2
r=45
image_xscale=6
image_yscale=6

s=surface_create(w,w)

surface_set_target(s)

draw_clear_alpha(0,0)

for (u=0;u<w;u+=1) for (v=0;v<w;v+=1) {
    g=(3-min(3,abs(point_distance(hw,hw,u,v)-r)))/4
    if (g>0)
        draw_point_color(u,v,make_color_rgb(0,sqrt(g)*255,0))
}

bg=background_create_from_surface(s,0,0,w,w,0,0)

surface_free(s)

texshine=background_get_texture(bgTexBallSpec)

alpha=6

surf=-1
hurt=0

ys=current_year-1991-(current_month<11)-(current_day<18)*(current_month==11)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
d=90-point_direction(0,0,point_distance(x,y,player.x,player.y),400)
a=direction_to_object(player)

surf=surface_engage(surf,300,300)
d3d_set_projection_ortho(0,0,150,150,0)
draw_clear_alpha(0,0)

texture_set_interpolation(1)
draw_circle_color(75,75,70,0,0,0)

d3d_transform_add_rotation_y(-70)
d3d_transform_add_rotation_z(135)
d3d_transform_add_translation(75,75,0)

draw_set_blend_mode(bm_add)
d3d_set_culling(1)
draw_set_color($ffffff)
d3d_draw_ellipsoid(-70,-70,-70,70,70,70,texshine,1,127/128,32)
draw_set_color($ff0000)
d3d_draw_ellipsoid(-70,-70,-70,70,70,70,texshine,1,-127/128,32)
draw_set_color($ffffff)
d3d_set_culling(0)

d3d_transform_set_translation(0,0,r)
d3d_transform_add_rotation_y(-d)
d3d_transform_add_rotation_z(a)
d3d_transform_add_translation(75,75,0)

draw_background(bg,-hw,-hw)
draw_set_blend_mode(0)
d3d_transform_set_identity()
surface_disengage()
texture_set_interpolation(0)
with (world) screen_prepare()

if (damage>=ys && !fade) {
    play_sound("bigexp")
    instance_create(x,y,bigexp)
    fade=1
    (rDev_001BD6A1).str="i'm dead!"
    (rDev_001BD6A1).w=70
}

if (fade) {
    alpha=max(0,alpha-0.05)
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!fade) {
    with (other) instance_destroy()
    play_sound("hit")

    damage+=other.damage

    hit=1
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
background_delete(bg)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
rect(x-100,ystart-100,200,200,0,alpha)

if (!fade) {
    if (hit) {
        draw_set_blend_mode_ext(10,1)
        rect(x-100,ystart-100,200,200,$ffffff,1)
        draw_set_blend_mode(0)
    }
    if (surface_exists(surf)) {
        texture_set_interpolation(1)
        draw_surface_stretched(surf,x-75,y-75,150,150)
        texture_set_interpolation(0)
    }
    if (hit) {
        draw_set_blend_mode_ext(10,1)
        rect(x-100,ystart-100,200,200,$ffffff,1)
        draw_set_blend_mode(0)
        hit=0
    }
}
