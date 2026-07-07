#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x1=x
x2=x+background_get_width(bgFlooglePainting)
x3=x+background_get_width(bgFlooglePainting)
x4=x
y1=y
y2=y
y3=y+background_get_height(bgFlooglePainting)
y4=y+background_get_height(bgFlooglePainting)
tex=background_get_texture(bgFlooglePainting)
image_xscale=background_get_width(bgFlooglePainting)/32
image_yscale=background_get_height(bgFlooglePainting)/32
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
switch irandom(3) {
case 0: {
    if (irandom(1)) x1-=1 else y1-=1
} break
case 1: {
    if (irandom(1)) x2+=1 else y2-=1
} break
case 2: {
    if (irandom(1)) x3+=1 else y3+=1
} break
case 3: {
    if (irandom(1)) x4-=1 else y4+=1
} break
}
with (other) instance_destroy()
play_sound("hit")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_primitive_begin_texture(pr_trianglefan,tex)
draw_vertex_texture(x1,y1,0,0)
draw_vertex_texture(x2,y2,1,0)
draw_vertex_texture(x3,y3,1,1)
draw_vertex_texture(x4,y4,0,1)
draw_primitive_end()
