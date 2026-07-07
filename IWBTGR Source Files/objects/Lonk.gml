#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
fc=0
ac=0

image_speed=0
hspeed=1.2625
image_xscale=5
image_yscale=5

p=instance_create(x,y,movingPlatform)
p.hspeed=hspeed
p.image_xscale=(15*5)/32
p.image_yscale=4
p.visible=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (x>658) hspeed=-abs(hspeed)
if (x<140) hspeed=abs(hspeed)

p.hspeed=hspeed
p.x=x-37

fc+=1
if (fc=5) {
    fc=0
    image_index=!image_index
}

image_xscale=5*sign(hspeed)

event_inherited()

if (go && ac=0) {
    //IM   T R I G G E R E D
    go=0
    ac=12
    play_sound("LOZ_Sword (2)")
}

if (ac>0) {
    with (instance_place(x,y,player)) killPlayer(other.id)
    sprite_index=sprLonk2
    if (ac>=4 && ac<=8) image_index=1
    else image_index=0
    ac-=1
} else sprite_index=sprLonk1
