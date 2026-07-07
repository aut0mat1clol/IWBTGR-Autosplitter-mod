#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_xscale=3
image_yscale=3
nonstick=true

enter=true
alarm[0]=100
timer=0
hp=39

face=instance_create(x,y-235,DraculasFace)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (timer==100) {
    (instance_create(choose(112,208,304,400,496,592,688),y,DracTele)).holder=id
    play_sound("dra_hoha")
}
if (timer==206) {
    image_speed=mmf_animspeed(20)
}
if (floor(image_index)==6 && floor(image_index-image_speed)<6) {
    choice=irandom(99)
    action_x=x-29*sign(image_xscale)
    action_y=y-115
    dir=sign(image_xscale)
    if (choice<30) {
        with (instance_create(x,y-10,DracHorizApple)) hspeed=mmf_speed(30)*other.dir
        with (instance_create(x,y-42,DracHorizApple)) hspeed=mmf_speed(30)*other.dir
        with (instance_create(x,y-110,DracHorizApple)) hspeed=mmf_speed(40)*other.dir
        with (instance_create(x,y-142,DracHorizApple)) hspeed=mmf_speed(40)*other.dir
        with (instance_create(x,y-200,DracHorizApple)) hspeed=mmf_speed(50)*other.dir
        with (instance_create(x,y-232,DracHorizApple)) hspeed=mmf_speed(50)*other.dir
        play_sound("dra_haha")
    } else if (choice<50) {
        instance_create(x,y-100,DracMoon)
        play_sound("dra_trup")
    } else if (choice<70) {
        var xx;
        for (xx=112;xx<=688;xx+=96) {
            instance_create(xx,-6,DracFireball)
        }
        play_sound("dra_laug")
    } else if (choice<80) {
        instance_create(action_x,action_y,DracDeathSpiral)
        play_sound("dra_laug")
    } else if (choice<90) {
        instance_create(action_x,action_y,DracHomingApple)
        play_sound("dra_laug")
    } else {
        with (instance_create(action_x,action_y,DracOrbiter)) {dir=other.dir ver=1}
        with (instance_create(action_x,action_y,DracOrbiter)) {dir=other.dir ver=-1}
        play_sound("dra_laug")
    }
}
if (timer==300 && !instance_exists(DracDeathSpiral)) {
    timer=500
}
if (timer>=500 && image_index>0) {
    image_index-=mmf_animspeed(30)
    if (image_index<0) image_index=0
}
if (timer==523) {
    enter=false
    timer=-1
    (instance_create(x,y,DracTele)).holder=id
}
timer+=1
face.x=x
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (timer>150 && enter) killPlayer(id)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=image_number-1
image_speed=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (enter) {
    x=DracTele.x
    if (global.px<x) image_xscale=-abs(image_xscale)
    else image_xscale=abs(image_xscale)
} else {
    x=-200
    enter=true
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
    draw_sprite_ext(sprBoshyEzBossBow,0,x-7*image_xscale,y-77*image_yscale,0.2,0.2,-global.boshybowangle*sign(image_xscale),$ffffff,1)
    texture_set_interpolation(0)
}
