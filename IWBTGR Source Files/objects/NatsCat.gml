#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (rDev_000CF9BA) str=":("
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=(damage)/25


if (damage>25) {
    instance_create(x,y-32,CUTE_KITTY_BOOM)
    play_sound("snd_boom")
    instance_destroy()
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("meow")
with (other) instance_destroy()

damage+=other.damage
#define Collision_Fire
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inside_view()) damage+=0.1
#define Collision_CUTE_KITTY_BOOM
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("meow")

damage=101;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprite_index,0,x,y,1+f,1+f,0,merge_color($ffffff,$ff,f),1)
