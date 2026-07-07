#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=3
image_speed=0
with (instance_create(x,y,DracTele)) {
    holder=other.id
}
enter=false
alarm[0]=100
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (instance_create(399,y,DracTele)) {
    holder=other.id
}
play_sound("dra_desp")
alarm[1]=220
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_music("")
play_sound("pound")
sprite_index=sprDraculasTrueForm
image_xscale=4
image_yscale=4
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("song109")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (alarm[0]>0 && image_index>0) {
    image_index-=mmf_animspeed(20)
    if (image_index<=0) image_index=0
}
if (alarm[1]>0) {
    repeat (3) instance_create(random_range(x-32,x+32),random_range(y-32-8,y+32-8),DracSplosion)
}
if (hspeed!=0) {
    if (image_index+image_speed>=image_number) image_index=1
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprDraculasTrueForm && hspeed==0) {
    image_xscale=abs(image_xscale)*sign(other.hspeed)
    sprite_index=sprWaddleDeath
    image_speed=0.5
    image_index=0
    with (other) instance_destroy()
    play_sound("song127")
    alarm[2]=30
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=image_number-1
image_speed=0
if (sprite_index==sprWaddleDeath) {
    instance_create(384,512,OrbDracula)
    instance_destroy()
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!enter) {
    enter=true
    x=-200
} else {
    x=399
    image_speed=mmf_animspeed(20)
    image_xscale=abs(image_xscale)
    if (global.px<x) image_xscale=-image_xscale
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    if (sprite_index==sprDraculasTrueForm) draw_sprite_ext(sprBoshyEzBossBow,0,x+5*image_xscale,y-14*image_yscale,0.2,0.2,global.boshybowangle*sign(image_xscale),$ffffff,1)
    if (sprite_index==sprDracula) draw_sprite_ext(sprBoshyEzBossBow,0,x-7*image_xscale,y-77*image_yscale,0.2,0.2,-global.boshybowangle*sign(image_xscale),$ffffff,1)
    texture_set_interpolation(0)
}
