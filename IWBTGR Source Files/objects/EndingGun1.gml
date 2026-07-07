#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=mmf_speed(60)
direction=mmf_direction(3)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=0) {
    if (hspeed>0) {
        direction-=mmf_direction(1)/7
    } else {
        direction=-90
    }

    image_angle+=20

    if (y>1664) state=1
}

if (state=1) {
    image_angle=mean(image_angle,90)

    direction=point_direction(x,y,EndingKid1.x+16,EndingKid1.y-16)

    if (point_distance(x,y,EndingKid1.x+16,EndingKid1.y-16)<10) {
        state=2
        speed=0
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=2) {
    x=EndingKid1.x+16
    y=floor(EndingKid1.y-16)
    image_angle=90
}

if (state=3) {
    x=EndingKid2.x+16
    y=floor(EndingKid2.y-16)
}
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=0
