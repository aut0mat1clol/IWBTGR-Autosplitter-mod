#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
hitted=0
yoff=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!hitted && place_meeting(x,y-1,player)) {
    hitted=true
    FallingCeilingSpike.active=true
    play_sound("click")
}
if (hitted) {
    if (timer==0 || timer==2) yoff+=1
    if (timer==4 || timer==6) yoff-=1
    timer=timer+1
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x,y-1+yoff)
