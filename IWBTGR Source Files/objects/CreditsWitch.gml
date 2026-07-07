#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_speed(50)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprWitchStoned) image_angle+=22.5
#define Collision_CreditsMedusa
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed!=0) {
    sprite_index=sprWitchStoned
    hspeed=0
    vspeed=mmf_speed(50)
    play_sound("pound")
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=mmf_speed(5)
