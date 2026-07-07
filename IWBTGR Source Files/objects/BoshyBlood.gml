#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=random(15)
gravity=0.4
direction=random(360)
image_angle=direction
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!place_free(x+hspeed,y+vspeed)) {
    move_contact_solid(direction,speed)
    speed=0
    gravity=0
    image_angle=0
}
