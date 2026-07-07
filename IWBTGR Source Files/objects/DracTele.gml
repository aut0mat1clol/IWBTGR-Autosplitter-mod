#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
max_width=150
width=7
wide_speed=0
alph_spd=0
inv=false
alarm[0]=8
holder=noone
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
wide_speed=(max_width-width)/10
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alph_spd=-2/255
if (holder.object_index!=DractoPlasm) play_sound("teleport")
with (holder) event_user(0)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
width+=wide_speed
if (wide_speed!=0 && width>=max_width) {
    width=max_width
    wide_speed=0
    alarm[1]=5
}
image_alpha+=alph_spd
if (image_alpha<=205/255 && !inv) {
    inv=true
    image_alpha=245/255
}
if (image_alpha<=155/255) {instance_destroy()}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
top=y-543
bot=y
if (inv) {
    in_col=$4d4d4d
    out_col=$12
} else {
    in_col=$b2b2b2
    out_col=c_white
}
for (i=-1; i<=1; i+=2) {
    draw_primitive_begin(pr_trianglestrip)
    draw_vertex_color(x,top,in_col,image_alpha)
    draw_vertex_color(x,bot,in_col,image_alpha)
    draw_vertex_color(x+width*0.11*i,top,in_col,image_alpha)
    draw_vertex_color(x+width*0.11*i,bot,in_col,image_alpha)
    draw_vertex_color(x+width*0.45*i,top,out_col,image_alpha)
    draw_vertex_color(x+width*0.45*i,bot,out_col,image_alpha)
    draw_vertex_color(x+width*0.5*i,top,out_col,image_alpha)
    draw_vertex_color(x+width*0.5*i,bot,out_col,image_alpha)
    draw_primitive_end()
}
