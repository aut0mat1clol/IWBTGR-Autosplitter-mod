#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
alarm[0]=50*1.8
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=50*1.8

if (inside_view() && !go && instance_exists(player)) {
    sx=x+16+lengthdir_x(8,aim*45)
    sy=y+10+lengthdir_y(8,aim*45)

    if (aim==45 || aim==135) sy+=2
    if (aim==90) sy+=4

    i=instance_create(sx,sy,HoverShot) i.speed=mmf_speed(30) i.direction=mmf_direction(aimraw)
    i=instance_create(sx,sy,HoverShot) i.speed=mmf_speed(50) i.direction=mmf_direction(aimraw)
    i=instance_create(sx,sy,HoverShot) i.speed=mmf_speed(70) i.direction=mmf_direction(aimraw)
    i=instance_create(sx,sy,HoverShot) i.speed=mmf_speed(85) i.direction=mmf_direction(aimraw)
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (go) {
    y=min(ystart+637,y+mmf_speed(14))
    if (y==ystart+637) go=0
}

if (!dead) {
    if (inside_view()) {
        aimraw=mmf_direction_to(point_direction(x,y,global.px,global.py))
        aim=round(mmf_direction(aimraw)/45) mod 8
        frame=(frame+mmf_animspeed(50)) mod 2
        image_index=aim*2+frame
    } else {
        image_index=0 // something that doesn't poke too high
    }
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
    sprite_index=sprTurretDie
    image_speed=mmf_animspeed(30)
    image_index=0
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dead) instance_destroy()
