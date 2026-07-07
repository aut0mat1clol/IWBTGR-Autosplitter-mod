#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=-mmf_speed(3)
speedmod=0
timer=0
hp=50
image_xscale=3
image_yscale=3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1
if (timer>=10) {
    timer-=10
    speedmod+=1
    hspeed=hspeed*1.1-mmf_speed(speedmod/15)
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=min(0,myspeed+mmf_speed(5*other.damage))
hp=hp-other.damage
with (other) instance_destroy()
if (hp<=0) {
    with (instance_create(x+66,y+32*3,BowserExplosion)) {
        image_xscale=11
        image_yscale=11
    }
    play_sound("paintboom")
    instance_destroy()
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,x,y+10*image_yscale,0.5,0.5,global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}
