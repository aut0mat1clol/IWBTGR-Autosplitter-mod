#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
a=instance_create(-1000,0,blockKill)
a.sprite_index=spr_1x2
a.image_angle=315
a.image_yscale=16
a.image_xscale=640
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=inside_view()

if (active) timer+=1

if (timer>100-40*rotato) {
    timer=0
    if (instance_exists(Snifit) && !lase) {
        if (!inside_view()) exit
        play_sound("marioshoot")
        i=instance_create(x,y,SnifitBullet)
        i.image_angle=image_angle
        i.speed=mmf_speed(20+20*rotato)
        i.direction=image_angle
        i.aggressive=rotato
        i.image_speed=rotato*0.5
    }
}

if (lase && instance_exists(Snifit)) {
    image_angle=315
    instance_activate_object(a)
    a.x=x
    a.y=y

    if (j<80) {
        j+=1
        if (j<40) play_sound("teleport")
    } else j=0
} else if (rotato) {
    if (instance_exists(player) && instance_exists(Snifit))
        image_angle=point_direction(x,y,global.px,global.py)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (lase && instance_exists(Snifit)) {
    dx=x
    dy=y
    k=!k
    if (k) {
        draw_sprite(sprSnifitLaser,0,dx,dy)
        repeat (10) {
            dx+=32
            dy+=32
            draw_sprite(sprSnifitLaser,1,dx,dy)
        }
    }
}
