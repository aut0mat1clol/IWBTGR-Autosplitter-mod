#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(20)
speed=1
direction=270
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
mask_index=spr2x2
image_xscale=16
image_yscale=16
image_angle=0

xn=x+lengthdir_x(9,direction)+lengthdir_x(9,direction+90)
yn=y+lengthdir_y(9,direction)+lengthdir_y(9,direction+90)
if (place_free(xn,yn)) {
    direction+=90
    x=xn
    y=yn
}

if (!place_free(x+hspeed,y+vspeed)) {
    direction-=90
}

mask_index=-1
image_angle=direction+90
image_xscale=1
image_yscale=1
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("Sound Effect (4)")
i=instance_create(x,y,block)
i.visible=1
i.sprite_index=sprCrawlerFrozen
i.image_index=image_index
i.image_speed=0
i.image_angle=image_angle
instance_destroy()
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
