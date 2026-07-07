#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
black=0
blue=$ff0000

memx=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///update tile parallax

/*
    -100 = black trees
    10000 = green trees and signs
    10010 = green hills
    10020 = blue hills and moon
    10030 = white hills and stars
*/

offx=view_xview[0]-memx

off[0]+=offx*(1-7)
off[1]+=offx*(1-0.8)
off[2]+=offx*(1-0.7)
off[3]+=offx*(1-0.5)
off[4]+=offx*(1-0.1)

if (abs(off[0])>1) {tile_layer_shift( -100,off[0]-frac(off[0]),0) off[0]=frac(off[0])}
if (abs(off[1])>1) {tile_layer_shift(10000,off[1]-frac(off[1]),0) off[1]=frac(off[1])}
if (abs(off[2])>1) {tile_layer_shift(10010,off[2]-frac(off[2]),0) off[2]=frac(off[2])}
if (abs(off[3])>1) {tile_layer_shift(10020,off[3]-frac(off[3]),0) off[3]=frac(off[3])}
if (abs(off[4])>1) {tile_layer_shift(10030,off[4]-frac(off[4]),0) off[4]=frac(off[4])}

memx=view_xview[0]
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_rectangle_color(view_xview[0],384,view_xview[0]+800-1,608-1,black,black,blue,blue,0)

memvx=view_xview[0]
