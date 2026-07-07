#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
a=instance_create(x,y+32,blockKill)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (on && instance_exists(player)) {
    y=median(y,player.y,y-4)
    if (y<yprevious && !lock) play_sound("metal2short")
    a.y=y+32
    a.image_yscale=(ystart-y)/32
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,0,x,y)
if (y<ystart) draw_sprite_stretched(sprite_index,1,x,y+31,32,ystart-y+1)
