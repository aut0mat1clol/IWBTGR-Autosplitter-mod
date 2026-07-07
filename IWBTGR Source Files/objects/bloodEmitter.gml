#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bleeding=1
alarm[0]=20

if (global.char==0) {
    i=instance_create(x,y-15,gibParticle)
    if (player.stoned) i.sprite_index=sprGibsHeadStoned
    else i.sprite_index=sprGibsHead

    i=instance_create(x,y-10,gibParticle)
    if (player.stoned) i.sprite_index=sprGibsBodyStoned
    else  i.sprite_index=sprGibsBody

    i=instance_create(x,y-10,gibParticle)
    if (player.stoned) i.sprite_index=sprGibsArmStoned
    else  i.sprite_index=sprGibsArm

    i=instance_create(x,y-10,gibParticle)
    if (player.stoned) i.sprite_index=sprGibsArmStoned
    else i.sprite_index=sprGibsArm

    i=instance_create(x,y,gibParticle)
    if (player.stoned) i.sprite_index=sprGibsFootStoned
    else i.sprite_index=sprGibsFoot

    i=instance_create(x,y,gibParticle)
    if (player.stoned) i.sprite_index=sprGibsFootStoned
    else i.sprite_index=sprGibsFoot
}

if (global.diff==0) {
    i=instance_create(x,y,gibParticle)
    i.sprite_index=sprBow
}

with (gibParticle) {
    image_speed=0
    if (sprite_index!=sprBow)
        image_index=irandom(image_number-1)
    gravity=0.1+random(0.2)
    direction=irandom(35)*10
    speed=random(2)
    hspeed+=player.hspeed
    vspeed+=player.vspeed/2-1
}

if (player.stoned) instance_destroy()

gravity=player.gravity
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bleeding=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (bleeding) repeat(40) {
    i=instance_create(x,y,blood)
    i.direction=irandom(35)*10
    i.speed=random(6)
}

if (settings("reduceblood")) instance_destroy()
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=0
gravity=0
#define Collision_playerKiller
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=0
gravity=0
