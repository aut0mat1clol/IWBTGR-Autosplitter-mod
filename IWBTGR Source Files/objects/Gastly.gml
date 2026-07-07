#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=0

fire=0
fired=0
canfire=1

image_speed=1/8
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
canfire=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(player)) instance_destroy()
else {
    if (die) {
        image_alpha-=0.05
        if (image_alpha<0) instance_destroy()
    } else image_alpha=0.7+0.3*dsin(f/3)

    xgo=player.x-player.image_xscale*16
    ygo=player.y-8

    if (fire) {
        fire=0
        if (canfire) {
            fired=1
            canfire=0
            alarm[0]=1.2*50
            i=instance_create(x,y,GastlyBullet)
            i.hspeed=player.image_xscale*20
        }
    }

    x=lerp(x,xgo,0.1)
    y=lerp(y,ygo,0.1)

    if (x<player.x) image_yscale=1
    else image_yscale=-1

    f+=15

    image_angle=point_direction(x,y,player.x,player.y-8)+10*dsin(f)

    if (fired>0) {
        fired-=1/20
        image_xscale=1+fired*0.5
        image_yscale=sign(image_yscale)*image_xscale
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if (fired>0) {
    draw_set_blend_mode(bm_add)
    image_alpha=fired
    draw_self()
    draw_set_blend_mode(0)
}
