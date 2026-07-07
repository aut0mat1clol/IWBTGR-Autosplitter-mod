#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
activated=false
timer=0
xoffset=0
p=instance_create(x,y+2,blockNotMerge)
p.image_yscale=30/32
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mem) player.y+=2
mem=0

if (!activated) {
    if (instance_place(x,y-2,player).onPlatform) {
        activated=true
        player.y+=2
        mem=1
        with (p) instance_destroy()
        play_sound("break")
    }
}
if (activated) {
    vspeed=2
    if (!place_free(x,y) && !flash) flash=25
}
if (flash) {
    flash-=1
    visible=flash mod 4
    if (!flash) instance_destroy()
}


event_inherited()
