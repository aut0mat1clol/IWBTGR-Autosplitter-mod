#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_xscale=3
image_yscale=3
gravity=0.25
trajectorycalc(global.px,global.py)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_create(x,y,blood)

if (image_index==0) {
    image_angle-=2.5
    if (y>=543) {
        speed=0
        image_angle=0
        image_index=1
        image_speed=0.5
        gravity=0
        move_outside_solid(90,30)
        play_sound("shatter")
    }
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index==0) {
    killPlayer(DracGlass)
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat (5) instance_create(x,y,DracGlassShard)
instance_destroy()
