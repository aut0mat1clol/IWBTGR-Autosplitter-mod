#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char==4) {
    sprite_index=sprBoshyGameover
    image_xscale=1.5
    image_yscale=1.5
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
texture_set_interpolation(1)
draw_self()
texture_set_interpolation(0)

draw_set_font(fNes)
draw_set_halign_lang(1)
draw_text(400,32,"-The Game Over Room-##This is the safest room in the game.#Only 'Q' can kill you.")
draw_set_halign_lang(0)
