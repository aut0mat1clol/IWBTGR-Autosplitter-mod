#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
stretch=0
a=instance_create(x,y,blockKill)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && stretch < 31) {
    if (stretch==0) {
        stretch=1
        y+=1
    }
    stretch+=2
    y+=2
}
a.y=y-stretch
a.image_yscale=stretch/32
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_sprite_ext(sprSpikeStretch,1,x+32,y+1,-1,-(stretch+1)/32,0,c_white,1)
