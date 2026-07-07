#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(50)
nonstick=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (RyuButton.image_index)
    if (choose(0,1))
        instance_create(irandom_range(bbox_left,bbox_right),y+32,partWind)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprTurbineOff) {
    image_speed=0
    image_index=image_number-1
} else {
    image_index+=2
}
