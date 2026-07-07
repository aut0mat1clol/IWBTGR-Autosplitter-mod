#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=800/256
image_yscale=608/240

image_speed=0
v=unlocks("c")
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.bossrush) {
    FMODSoundPlay(ZeldaOldMan.snd,0)
    unlocks("c",min(99,unlocks("c")+1))
    v+=1
    x=-400
} else killPlayer(object_index)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (v) {
    rect(104*image_xscale,24*image_yscale,8*image_xscale,8*image_yscale,0,1)
    rect(104*image_xscale,(24+240)*image_yscale,8*image_xscale,8*image_yscale,0,1)
    draw_text_transformed(104*image_xscale,24*image_yscale,v,image_xscale/2,image_yscale/2,0)
    draw_text_transformed(104*image_xscale,(24+240)*image_yscale,v,image_xscale/2,image_yscale/2,0)
}
