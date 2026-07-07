#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x-=1
grav=25
direction=mmf_direction(29)
speed=mmf_pinballspeed(20)
image_xscale=3
image_yscale=3
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=abs(image_xscale)*sign(hspeed)
if (image_xscale=0) image_xscale=-3

if (timer<200) image_speed=mmf_animspeed(20,50)

if (timer==150) {
    sprite_index=sprBowserBombFlashing
} else if (timer==200) {
    image_speed=mmf_animspeed(40)
} else if (timer==250) {
    image_speed=mmf_animspeed(100)
} else if (timer==300) {
    instance_create(x,y,BowserExplosion)
    instance_destroy()
    play_sound("marioshoot")
}
timer=timer+1
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y,block)) {
    move_outside_solid(direction+180,speed)
    grav=50
    speed=mmf_pinballspeed(50)
    if (place_meeting(x,y+vspeed,block)) {
        vspeed=-vspeed
    } else {
        hspeed=-hspeed
        direction-=4
        x-=sign(image_xscale)
    }
}

vspeed+=grav/100
speed=min(speed,mmf_speed(100))
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
move_towards_point(ClownCar.x,ClownCar.y-28*3,mmf_pinballspeed(50))
move_outside_solid(90,32)
grav=5
