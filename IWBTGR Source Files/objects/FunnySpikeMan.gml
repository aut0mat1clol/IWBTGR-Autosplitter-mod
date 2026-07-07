#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
in_range=false
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (in_range) {
    if (sprite_index == sprFunnySpikeMan) {
        image_speed=mmf_animspeed(50)
        if (image_index+image_speed >= image_number) {
            sprite_index=sprFunnySpikeManWalkin
            image_index=0
            image_speed=mmf_animspeed(50)
        }
    } else {
        if (global.px < x) {
            image_xscale=-1
            x-=4
        } else if (global.px > x) {
            image_xscale=1
            x+=4
        }
    }
    in_range=false
} else if (sprite_index == sprFunnySpikeManWalkin) {
    sprite_index=sprFunnySpikeMan
    image_speed=-mmf_animspeed(50)
    image_index=image_number-1
} else if (image_index == 0) {
    image_speed=0
} else if (sprite_index == sprFunnySpikeMan) {
    image_speed=-mmf_animspeed(50)
}
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///collide
