#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
nonstick=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (floor(image_index+image_speed)==6 && floor(image_index)<6) {
    play_sound("break")
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_speed == 0 && image_index == 0) {
    image_speed=mmf_animspeed(20)
} else if (floor(image_index) == 6) {
    killPlayer()
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=image_number-1
image_speed=0
