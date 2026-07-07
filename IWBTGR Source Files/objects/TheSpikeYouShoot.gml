#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active=1) {
    f=min(1,f+1/21)
    x=lerp(xstart,2496,f)
    y=lerp(ystart,2367,f)
    image_angle=lerp(0,-360-90,f)
    if (f=1) {
        active=2
        ;(instance_create(x,y,platform)).visible=0
        image_angle=270
    }
} else if (!active) {
    if (timer mod 2 < 1) {
        y=ystart-1
    } else {
        y=ystart+1
    }
    timer+=1
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) killPlayer(id)
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    active=1
    RealYokuController.alarm[0]=100
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,image_index,x+16+lengthdir_x(16,image_angle+180)+lengthdir_x(16,image_angle+90),y+16+lengthdir_y(16,image_angle+180)+lengthdir_y(16,image_angle+90),1,1,image_angle,$ffffff,1)
