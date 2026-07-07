#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
moving=true

nonstick=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (moving) {
    if (floor(image_index)==0) {
        image_index+=mmf_animspeed(15)
        if (floor(image_index)>0) image_index-=1
    } else if (floor(image_index)==1) {
        image_index+=mmf_animspeed(50)
        if (floor(image_index)>1) image_index-=1
    } else {
        image_index+=mmf_animspeed(10)
        if (floor(image_index)>=10) image_index=0
    }
}

if (floor(image_index)<2) {
    y=ystart-(frac(image_index)>=0.5)
} else {
    y=ystart
}
