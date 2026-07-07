#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=mmf_speed(60)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed!=0) image_angle+=22.5
else image_angle=90

if (active) {
    x=global.px+10
    y=global.py-20
    if (player.vic) player.y=min(player.y+2,560)
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=0
image_angle=90
if (!player.cutscene) {
    inst=play_sound("mariowin")
}
player.cutscene=true
player.h=0
player.image_xscale=1
x=player.x+10
y=player.y-13
GuyHead.active=true

active=1
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=0
image_angle=90
