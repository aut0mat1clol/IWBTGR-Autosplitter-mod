#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.15
image_xscale=2
image_yscale=2
y-=1000
nonstick=1
with (instance_create(x,544,DracTele)) holder=other.id
event_perform(ev_alarm,0)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_create(random_range(bbox_left+4,bbox_right-4),y-4-random(4),EctoParticle)) {
    if (x>=other.x) sprite_index=sprEctoParticle2
    vspeed+=other.vspeed
}
alarm[0]=3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
move_towards_point(global.px,global.py,mmf_speed(8))
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("thud")
x+=40*sign(other.hspeed)
with (other) instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=xstart
y=ystart
