#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (view_xview[0]<15000) {
    dx=view_xview[0]-((view_xview[0]*0.8) mod 32)
    repeat (26) {
        draw_background(bgCartParallax4,dx,608-96)
        dx+=32
    }
}
