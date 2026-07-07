#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (savedata("orb_birdo")) {
    player.x=32
    player.y=624
    room_goto(rFactoryOutskirts)
}

image_xscale=10
image_yscale=10
image_speed=0

phase=1
dir=1
eggspeed=1

instance_create(x,y,MechaHitbox)
instance_create(635,465,MechaEgg)

alarm[0]=240
alarm[1]=2
alarm[2]=2
alarm[3]=2
alarm[4]=2
alarm[5]=2

x=1068
y=931

//in guy, mecha birdo starts walking when the moon hits the floor for ????? reason,
//so we simulate that by advancing her movement state a few frames.
repeat (128) {
    y+=dir*phase
    if (y<739) dir=1
    if (y>963) dir=-1
    x=max(620,x-0.4)
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=7*50
if (phase==1) image_speed=mmf_animspeed(15)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[1]=3*50
if (phase==2) image_speed=mmf_animspeed(15)
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[2]=2*50
if (phase==3 && !dead) image_speed=mmf_animspeed(15)
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[3]=4*50
if (phase==2) {
    if (image_speed==0) {
        instance_create(x-50,y-570,BirdoLaza)
        instance_create(x+10,y-546,BirdoLaza)
        play_sound("fire")
    }
}
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[4]=11*50
if (phase==1 && x==620) {
    instance_create(784,362,FlyGuy)
    instance_create(784,422,FlyGuy)
    instance_create(784,486,FlyGuy)
}
#define Alarm_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[5]=8*50
if (phase==3 && !dead) {
    instance_create(784,362,FlyGuy)
    instance_create(784,422,FlyGuy)
    instance_create(784,486,FlyGuy)
    instance_create(784,537,FlyGuy)
}
#define Alarm_6
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("paintboom")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
x=max(620,x-0.4)

if (blow || dead) instance_create(x+100+irandom_range(-120,120),y-600+irandom_range(-120,120),MagicExplosion)
if (dead || (phase!=1 && image_index<1)) repeat (3) instance_create(x+100+irandom_range(-20,20),y-640+irandom_range(-20,20),MagicSmoke)

blow-=1

if (dead) {
    with (MechaEgg) hspeed=0
    with (EggHitbox) hspeed=0
    with (EggPlatform) hspeed=0

    image_index=0
    image_speed=0

    y+=2
    if (y>1507) {
        if (global.bossrush) defeat_bossrush("birdo")
        else {
            with (player) instance_destroy()
            room_goto(rFactoryOutskirts)
        }
    }
} else {
    with (MechaEgg) hspeed=-other.eggspeed
    with (EggHitbox) hspeed=-other.eggspeed
    with (EggPlatform) hspeed=-other.eggspeed

    if (phase==2) {sprite_index=sprBirdo2 eggspeed=3}
    if (phase==3) {sprite_index=sprBirdo3}

    if (image_speed==0) {
        y+=dir*phase
        if (y<739) dir=1
        if (y>963) dir=-1
    }

    with (MechaHitbox) {
        if (other.image_index<1) {
            x=other.x
            y=other.y
        } else {
            y=-9999
        }
    }
    with (MechaHitbox2) {
        if (other.image_index<1) {
            x=other.x+19
            y=other.y-575
        } else {
            y=-9999
        }
    }
    with (MechaHitbox3) {
        if (other.image_index<1) {
            y=-9999
        } else {
            x=other.x
            y=other.y-570
        }
    }
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
play_sound("marioshoot")
instance_create(round(x-235),round(y-447),MechaEgg)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (flash && phase=2) draw_sprite_ext(sprMechaEyeFlash,image_index,x,y,image_xscale,image_yscale,0,$ffffff,1)
if (flash && phase=3) draw_sprite_ext(sprMechaMouthFlash,image_index,x,y,image_xscale,image_yscale,0,$ffffff,1)

flash=0

with (MechaHitbox) draw_self()

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    if (image_index>=1) draw_sprite_ext(sprBoshyEzBossBow,0,x+180,y-580,0.75,0.75,global.boshybowangle-45,$ffffff,1)
    else draw_sprite_ext(sprBoshyEzBossBow,0,x+130,y-630,0.75,0.75,global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}
