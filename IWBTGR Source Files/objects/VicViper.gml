#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=3
image_speed=0
image_index=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    if (win) {
        xprevious=x
        yprevious=y
        x=approach(x,xstart,2)
        y=approach(y,ystart,2)
        if (p) {
            p.hspeed=x-xprevious
            p.vspeed=0
            p.yspeed=y-yprevious
        }

        fac=approach(fac,0,1/8)

        if (x!=xprevious || y!=yprevious)
            anim=(anim+1/4) mod 2
        else anim=0
    } else {
        x+=global.input_h*4
        y+=global.input_v*4

        fac=approach(fac,global.input_v*-2,1/8)

        anim=(anim+1/4) mod 2

        player.x=x
        player.y=y

        global.px=x
        global.py=y

        if (vicautofire) vicautofire-=1

        if (global.key_pressed[key_shoot] || (global.key[key_shoot] && (!vicautofire || !global.autofireF))) {
            if (instance_number(VicBullet)<3) {
                instance_create(x+64,y-2,VicBullet)
                vicautofire=16
            }
        }
    }
}

image_index=2+fac+5*(anim>1)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    player.frozen=1
    player.visible=0
    GradiusBugz.hspeed=-mmf_speed(50)
    GradiusDrones.hspeed=-mmf_speed(50)
    GradiusBoss.hspeed=-mmf_speed(40)
    play_music("gradius")
    active=1
    with (OwataPlatform) instance_destroy()
}
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.solid) event_user(0)
#define Collision_spikeUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_bloodEmitter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    instance_create(x,y,player)
    player.frozen=1
    player.visible=0
    GradiusBugz.hspeed=-mmf_speed(50)
    GradiusDrones.hspeed=-mmf_speed(50)
    GradiusBoss.hspeed=-mmf_speed(40)
    play_music("gradius")
    active=1
}
#define Collision_GradiusBugz
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_GradiusDrones
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_GradiusBoss
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_GradiusDroneBullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Collision_GradiusFruit
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Die
if (!global.god) {
    i=instance_create(x,y,VicDeader)
    play_music("")
    play_sound("vicdie")
    killPlayer(VicViper)
    y=-999
    active=0
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Victory
with (GradiusFruit) instance_destroy()
with (GradiusBugz) instance_destroy()
with (GradiusDrones) instance_destroy()
with (blockTrapDestructible) if (inside_view()) instance_destroy()

if (!active) {
    x=xstart
    y=ystart
    active=1
    visible=0
    p=-1

} else {
    p=instance_create(x-32,y-4,movingPlatform)
    p.image_xscale=2.5
    p.visible=0
}

win=1

if (!instance_exists(player) && settings("gameover")) {
    global.invincible=1
    instance_create(x,y,player)
}
player.y=y-24
player.frozen=0
player.visible=1

play_music(room_song())
