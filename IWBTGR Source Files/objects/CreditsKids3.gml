#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

if (global.char==1) {
    sprite_index=sprKidsDots
    image_speed=0
    image_index=2
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char!=1) sprite_index=sprKids3J
if (global.char==4) {sprite_index=later image_speed=0.2}
vspeed=-random_range(-3,-4)
gravity=0.4
