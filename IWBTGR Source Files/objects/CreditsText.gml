#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
scale=max(scale,2)

draw_set_font(fSans)

sprite_index=spr2x2

image_xscale=string_width(str)*scale/2
image_yscale=string_height(str)*scale/2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=inside_view()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fSans)

draw_set_halign_lang(1)
draw_set_valign_lang(1)
draw_text_transformed_color(x-1,y-1,str,scale,scale,0,0,0,0,0,1)
draw_text_transformed_color(x-1,y+1,str,scale,scale,0,0,0,0,0,1)
draw_text_transformed_color(x+1,y-1,str,scale,scale,0,0,0,0,0,1)
draw_text_transformed_color(x+1,y+1,str,scale,scale,0,0,0,0,0,1)
draw_text_transformed(x,y,str,scale,scale,0)
draw_set_halign_lang(0)
draw_set_valign_lang(0)
