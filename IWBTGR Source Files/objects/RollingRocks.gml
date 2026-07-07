#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dir=1
vspeed=mmf_speed(30)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed==0) {
    if (place_free(x,y+32)) {
        x=floor(x/32)*32+16
        hspeed=0
        vspeed=mmf_speed(30)
    }
} else {
    if (!place_free(x,y+vspeed)) {
        y=floor(y/32)*32+16
        vspeed=0
        if ((place_meeting(x+16,y,spikeUp) && !position_meeting(x-32,y,block)) || position_meeting(x+32,y,block)) {
            hspeed=mmf_speed(-15)
        } else {
            hspeed=mmf_speed(15)
        }
    }
}

if (hspeed!=0) dir=sign(hspeed)

image_angle-=45*mmf_animspeed(50)*dir
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_circle_color(floor(x),floor(y),16,0,0,0)
draw_sprite_ext(sprite_index,image_index,floor(x)+lengthdir_x(0.5,image_angle)+lengthdir_x(0.5,image_angle-90),floor(y)+lengthdir_y(0.5,image_angle)+lengthdir_y(0.5,image_angle-90),1,1,image_angle,$ffffff,1)
