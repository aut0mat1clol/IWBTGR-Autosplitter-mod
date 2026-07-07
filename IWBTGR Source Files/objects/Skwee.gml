#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0
die=0
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    image_speed=mmf_animspeed(20)
    speed=mmf_speed(40)
    if (x>global.px) direction=mmf_direction(22)
    else direction=mmf_direction(26)
}
if (die) {
    c+=1
    if (c==30) {
        sprite_index=sprSkreeDie
        image_index=0
        image_speed=mmf_animspeed(30)
    }
}
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!die) {
    speed=0
    active=0
    die=1
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprSkree) {
    play_sound("Sound Effect (4)")
    i=instance_create(x,y,block)
    i.visible=1
    i.sprite_index=sprSkreeFreeze
    i.image_index=image_index
    i.image_speed=0
    instance_destroy()
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprSkreeDie) {
    visible=0
    instance_destroy()
}
