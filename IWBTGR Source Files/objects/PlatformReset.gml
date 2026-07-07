#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (cooldown) cooldown-=1
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) instance_destroy()
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!cooldown) {
    play_sound("switch")
    image_index=!image_index
    cooldown=5

    if (image_index=0) {
        with (movingPlatform) if (inside_view()) {y=ystart yspeed=0}
    } else {
        with (movingPlatform) if (inside_view()) {yspeed=-0.25}
    }
}
