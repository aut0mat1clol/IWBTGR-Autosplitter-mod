#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(50)
sprite_index=sprTurret
y+=8
x+=16
image_index=8
dead=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprTurretDie) exit
if (image_index>=10) image_index-=2
#define Collision_GradiusMarker
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprTurretDie) exit
if (!retreat) {
    retreat=1
    hspeed=mmf_speed(30)
    ;(instance_create(x-16,y-3,GradiusDroneBullet)).direction=135
    ;(instance_create(x-16,y-3,GradiusDroneBullet)).direction=180
    ;(instance_create(x-16,y-3,GradiusDroneBullet)).direction=225
}
#define Collision_VicBullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    dead=1
    with (other) instance_destroy()
    play_sound("vichit")
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
