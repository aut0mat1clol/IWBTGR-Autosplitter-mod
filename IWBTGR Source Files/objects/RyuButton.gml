#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=1
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
event_user(1)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
Turbine.sprite_index=sprTurbineOff
Turbine.image_speed=mmf_animspeed(20)
with (RyuWind) instance_change(RyuTrigger,1)
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!cooldown) {
    cooldown=5
    play_sound("switch")
    image_index=!image_index

    if (image_index=0) {
        event_user(0)
    } else {
        Turbine.sprite_index=sprTurbine
        Turbine.image_speed=mmf_animspeed(50)
        RyuWind.sprite_index=sprBlockNise
        with (RyuTrigger) instance_change(RyuWind,1)
    }
    Turbine.image_index=0
}
