#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y-128,blockTrapDestructible) instance_create(x+32,y-128,blockTrapDestructible)
instance_create(x,y-96,blockTrapDestructible) instance_create(x+32,y-96,blockTrapDestructible)
instance_create(x,y-64,blockTrapDestructible) instance_create(x+32,y-64,blockTrapDestructible)
instance_create(x,y-32,blockTrapDestructible) instance_create(x+32,y-32,blockTrapDestructible)
instance_create(x,y,blockTrapDestructible) instance_create(x+32,y,blockTrapDestructible)

y+=32
image_xscale=2
image_yscale=-5
#define Collision_Cart
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (blockTrapDestructible) if (place_meeting(x,y,other.id)) {
    speed=12
    direction=point_direction(other.x,other.y,x+128,y)
    instance_destroy()
}
play_sound("break")
instance_destroy()
