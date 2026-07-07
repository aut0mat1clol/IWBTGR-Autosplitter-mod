#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprQuickLaser
nonstick=1
active=0
stop=0
f=0

size=-delay
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    f+=mmf_animspeed(50)
    if (f>1) {
        f=f mod 1
        image_yscale*=-1
    }

    size=min(length*32,size+mmf_speed(100))

    image_xscale=max(1,size)
    if (size>1) visible=1
}
