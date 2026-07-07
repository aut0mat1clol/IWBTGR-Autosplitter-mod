#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=3
image_speed=0
image_index=2
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index!=2) {
    if (floor(image_index)>=6 && image_index<7) image_speed=mmf_animspeed(10)
    if (floor(image_index)>=7 && image_index<9) image_speed=mmf_animspeed(20)
    if (floor(image_index)>=9) image_speed=0
    timer+=1
    if (timer==50) {
        with (instance_create(x,bbox_bottom+1,DracTele)) {
            max_width=32*3
            holder=other.id
            //visible=false
        }
    }
    if (timer==68) {
        DracTele.visible=true
        sprite_index=sprDraculasTrueForm
        image_xscale=4
        image_yscale=4
        x-=2
        y+=51
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(20)
