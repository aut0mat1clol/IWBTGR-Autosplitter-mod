#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=18
image_yscale=18
vspeed=12.5
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bbox_top>0 && (instance_place(x,y+vspeed,block)).object_index==block) {
    move_contact_solid(270,vspeed)
    vspeed=0
    play_sound("groundhit")
}
#define Collision_tetrisBlock
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) instance_destroy()
play_sound("break")
