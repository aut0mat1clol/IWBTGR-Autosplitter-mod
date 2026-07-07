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
if (image_index+image_speed<0) {
    image_speed=0
    image_index=0
}

if (active && !dead) timer=75

if (timer) {
    timer-=1
    if (!timer) {
        if (inside_view()) {
            image_speed=mmf_animspeed(30)
            timer=75
        }
    }
}

if (shoot) {
    shoot-=1
    play_sound("fire2")
    i=instance_create(x,y,HoverShot) i.speed=mmf_speed(30) i.direction=aimraw
    i=instance_create(x,y,HoverShot) i.speed=mmf_speed(50) i.direction=aimraw
    i=instance_create(x,y,HoverShot) i.speed=mmf_speed(70) i.direction=aimraw
    i=instance_create(x,y,HoverShot) i.speed=mmf_speed(85) i.direction=aimraw
} else if (!dead && image_speed > 0 && floor(image_index)==10) {
    aimraw=point_direction(x,y,global.px,global.py-5)
    shoot=3
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    dead=1
    alarm[0]=-1
    go=0
    if (global.char=2) play_sound("vichit")
    else play_sound("splatter")
    play_sound("shatter")
    sprite_index=sprSniperDead
    image_index=0
    image_speed=mmf_animspeed(30)
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_speed>0) {
    if (!dead) {
        image_speed=-abs(image_speed)
    } else {
        image_speed=0
    }
    image_index=image_number-1
}
