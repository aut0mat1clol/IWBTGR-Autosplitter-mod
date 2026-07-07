#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=0.5

image_speed=0.25
image_xscale=player.image_xscale

if (!place_free(x,y)) {
    move_outside_solid(90+90*player.image_xscale,16)
    if (!place_free(x,y)) move_outside_solid(90-90*player.image_xscale,32)
}

alarm[0]=200
flash=0
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
for (i=0;i<8;i+=1) {
    o=instance_create(x,y,OwataBlood)
    o.speed=4
    o.direction=i*45
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
flash=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (flash) {
    flash+=1
    visible=(flash mod 4<2)
    if (flash>50) instance_destroy()
}

event_inherited()
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.solid) instance_destroy()
#define Other_0
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
draw_sprite_ext(sprOwataPlatform2,floor(image_index),x,y,image_xscale,image_yscale,image_angle,image_blend,get_room_darkness())
draw_self()
