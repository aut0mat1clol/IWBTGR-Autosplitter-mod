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
if (active) {
    visible=1
    image_speed=mmf_animspeed(20)
}

if (image_index>=5 && !thrown) {
    thrown=1
    i=instance_create(x+31,y+44,deliciousFruit)
    i.vspeed=mmf_speed(30)
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
