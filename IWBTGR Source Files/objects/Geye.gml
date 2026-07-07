#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
damage=0
vuln=false
reverse=false
look_at_player=true
shot_counter=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///shoot in circle woa!!!
with (instance_create(x,y-4,GuyShot)) {
    speed=mmf_speed(100)
    direction=other.direction
}
play_sound("fire2")
alarm[0]=3
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///speen!!!
direction+=mmf_direction(1)
event_perform(ev_alarm,0)
alarm[1]=25
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (reverse) {
    image_index-=mmf_animspeed(50)
    if (image_index<0) {
        image_index=0
        reverse=false
    }
}
if (look_at_player) direction=point_direction(xstart,ystart,global.px,global.py)
if (sprite_index==sprGeyeNuts && image_speed==0 && image_index==0) {
    var dir;
    dir=round(direction/45)
    switch (dir) {
    case 0: case 1: case 7: case 8: x=xstart+20 break
    case 2: case 6: x=xstart break
    case 3: case 4: case 5: x=xstart-20 break
    }
    switch (dir) {
    case 1: case 2: case 3: y=ystart-20 break
    case 0: case 4: case 8: y=ystart break
    case 5: case 6: case 7: y=ystart+20 break
    }
} else {
    x=xstart
    y=ystart
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vuln && sprite_index!=sprGeyeSplat) {
    with (other) instance_destroy()
    play_sound("thud")
    if (sprite_index!=sprGeyePain) {
        sprite_index=sprGeyePain
        image_index=5
        damage=0
        image_speed=1/100
    }
    if (image_index>=1) image_index-=1
    damage+=other.damage
    if (damage>10 && image_index<1) {
        play_sound("splatter")
        sprite_index=sprGeyeSplat
        image_index=0
        image_speed=mmf_speed(50)
        vuln=false
        damage=0
        var both_dead;
        both_dead=false
        with (Geye) {
            if (id!=other.id && !vuln) both_dead=true
        }
        if (both_dead) {
            if (GuyHead.phase==0) {
                GuyHead.phase=1
                GuyHead.timer=1501
                // TODO???
            } else if (GuyHead.phase==1) {
                GuyHead.phase=2
                GuyHead.timer=3500
            } else if (GuyHead.phase==2) {
                GuyHead.phase=3
                GuyHead.timer=4500
                play_music("")
                with (GuyGlassShot) instance_destroy()
                with (GuyShot) instance_destroy()
                with (GuyTooth) instance_destroy()
                with (GuyPersistentFirePillar) instance_destroy()
            }
        }
    }
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprGeyePain) {
    sprite_index=sprGeyeNuts
    image_speed=0
    image_index=0
}
if (sprite_index==sprGeyeSplat) {
    image_index=image_number-1
    image_speed=0
}
