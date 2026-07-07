#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a=instance_create(x+96,y,platform)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) go=1

if (go) f=min(1,f+mmf_animspeed(30)/6)

f2=sqr(f)

a.x=lerp(x+96,x+8,f2)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dx=x+96
g=ceil(max(1,88*f2))
t=384
h=t/g

repeat (g) {
    h=min(h,t)
    t-=h
    draw_sprite_part(sprite_index,0,0,t,32,h,dx,y+t)
    dx-=1
}
