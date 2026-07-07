#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=15
image_yscale=15
move_towards_point(global.px-3,global.py-42,mmf_speed(40))
hits=0
nonstick=true
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.object_index=block) {
    move_towards_point(global.px,global.py,speed)
    play_sound("click")
    counter+=1
    if (counter>=10) instance_destroy()
}
