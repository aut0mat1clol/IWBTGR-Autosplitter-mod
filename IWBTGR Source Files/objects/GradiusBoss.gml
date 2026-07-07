#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
sprite_index=sprTurret
x+=16
image_index=8

aim=4

hp=10
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprTurretDie) exit

if (active) {
    direction+=mmf_direction(1)
    aim=round(direction/45) mod 8

    sx=x+16+lengthdir_x(16,aim*45)
    sy=y+10+lengthdir_y(16,aim*45)

    i=instance_create(sx,sy,GradiusFruit)
    i.direction=direction
}
frame=(frame+mmf_animspeed(50)) mod 2
image_index=aim*2+frame
#define Collision_GradiusMarker
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=1
#define Collision_VicBullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hp<=0) exit
with (other) instance_destroy()
hp-=1
play_sound("hit")
if (hp<=0) {
    play_sound("vichit")
    with (VicViper) event_user(1)
    sprite_index=sprTurretDie
    image_speed=mmf_animspeed(30)
    image_index=0
    speed=0
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprTurretDie) instance_destroy()
