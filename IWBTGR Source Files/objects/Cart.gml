#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=0
frame=0

p=instance_create(x,y+4,movingPlatform)
p.image_xscale=106/32
p.visible=0

hspeed=4
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=0) {
    frame+=mmf_animspeed(50)
    if (frame>=2) frame=0
    if (place_meeting(x,y,DumpMoment)) {
        state=1
        frame=2
    }
    p.sprite_index=sprDynamicPlatform01
}
if (state=1) {
    frame+=mmf_animspeed(10)
    if (frame>=7) frame=5
    if (!place_meeting(x,y,DumpMoment)) {
        state=2
        frame=5
    }
    if (frame>4) p.sprite_index=-1
}
if (state=2) {
    frame+=mmf_animspeed(-50)
    if (frame<2) {
        frame=0
        state=0
    }
}

if (player.vspeed<0) {
    if (place_meeting(x,y,player) && p.sprite_index!=-1 && player.walljumpboost==0) player.carted=1
    p.sprite_index=-1
}

p.x=x
if (hspeed>5) {
    with (player) if (!vic) if (place_meeting(x,y+2,other.id)) {
        x=max(x-3,other.x+34)
        y=other.y-9+8*dot
        image_xscale=1
        speed=0
        djump=0
    }
}
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    dead=1
    event_user(0)
    play_sound("metal2short")
    with (player) if (vic) {
        cutscene=1
        h=5
        y=min(y,440)
    } else {
        x=other.x+16
        y=other.y-20
        walljumpboost=-1
        walljumpdir=1
        hspeed=15
        vspeed=-10-physics*2
        djump=1
    }
}
#define Collision_CartSpeedup
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed+=1
with (other) instance_destroy()
#define Collision_BulletTrigger
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) instance_destroy()
play_sound("marioshoot")
with (RoadBulletBill) hspeed=-mmf_speed(10)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dead=1
(instance_create(22368,0,block)).image_yscale=19
speed=0
x=22539
state=3
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,floor(frame),x,y)
