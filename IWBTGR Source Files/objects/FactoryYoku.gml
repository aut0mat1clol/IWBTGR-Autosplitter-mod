#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
if (id!=rFactoryOutskirts_002D80B8) image_index=6
img_spd=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index+=img_spd
if (image_index>=image_number) {
    // done disappearing
    image_index=image_number-1
    img_spd=0
}
if (image_index<0) {
    // done appearing
    image_index=0
    with (id-1) if object_index==other.object_index {
        img_spd=-other.img_spd
    }
    img_spd=0
}
