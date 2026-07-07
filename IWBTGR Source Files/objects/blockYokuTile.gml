#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
lock=0
tile=tile_layer_find(1000,x,y)
if (tile=-1) {
    show_error("empty yoku at "+string(x)+","+string(y),0)
    visible=1
    lock=1
} else {
    tile_set_visible(tile,0)
    tile_set_depth(tile,-100)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!lock) {
    if (distance_to_object(player)<2) {
        lock=1
        play_sound("megamanappear")
        tile_set_visible(tile,1)
    }
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=other
invert=0
*/
