#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
hp=4

if (global.diff>2) instance_destroy()

boshy=0
if (global.char==4) {
    x+=8
    y+=8
    sprite_index=sprBoshySave
    boshy=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    if (boshy) {
        motion_add(point_direction(x,y,global.px-8,global.py-8),0.1)
        speed=min(speed,4)
    } else direction=point_direction(x,y,global.px-16,global.py-16)
    if (place_meeting(x,y,player)) killPlayer(id)
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!active) {
    active=1
    speed=mmf_speed(20)
    sprite_index=sprSaveEvilWake
    if (boshy) {
        sprite_index=sprBoshyEvilSave
        play_sound("94_youretooslow")
        direction=point_direction(x,y,global.px-8,global.py-8)
    }
    image_speed=mmf_animspeed(60)
}

if (!boshy) play_sound("kraidgiefroarfast")

hp-=other.damage
if (hp<=0) {
    if (global.char==4) instance_create(xstart+8,ystart+8,saveBoshy)
    else instance_create(xstart,ystart,saveVeryHard)
    if (global.char=2) play_sound("vichit")
    else play_sound("splatter")
    instance_destroy()
}

with (other) instance_destroy()
