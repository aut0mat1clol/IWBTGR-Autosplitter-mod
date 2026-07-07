#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
activated=false
timer=0
xoffset=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!activated) {
    if (instance_place(x,y-1,player).onPlatform) {
        activated=true
    }
}

if (mem) player.y+=3
mem=0

if (activated) {
    if (timer < 4) {
        if (timer mod 2 < 1) {
            xoffset=1
        } else {
            xoffset=0
        }
    } else {
        xoffset=0
        if (timer==4 && instance_place(x,y-1,player).onPlatform) {
            player.y+=3
            mem=1
        }
        vspeed=3
    }
    timer+=1
}
event_inherited()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,x+xoffset,y)
