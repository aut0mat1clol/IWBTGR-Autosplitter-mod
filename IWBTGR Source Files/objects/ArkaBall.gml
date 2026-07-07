#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(20)

dampmul=1
dampsub=0
dampfrc=0
radius=12
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!inside_view()) {
    x-=hspeed
    y-=vspeed
}
if (place_meeting(x,y,ArkaPlatform)) {
    if (!oops) {
        oops=1
        play_sound("hit")
        direction=point_direction(ArkaPlatform.x,ArkaPlatform.y+32,x,y)
    }
} else oops=0

with (ArkaBrick) coll=place_meeting(x,y,other.id)
with (ArkaBrickShort) coll=place_meeting(x,y,other.id)

with (ArkaBrick) if (coll) with (other) {
    if (abs(y-other.cy)<=16) {//x wall
        if (x=median(other.cx-32-radius,x,other.cx+32+radius)) {xc=other.cx+32*sign(x-other.cx) yc=y event_user(0)}
    } else if (abs(x-other.cx)<=32) {//y wall
        if (y=median(other.cy-16-radius,y,other.cy+16+radius)) {xc=x yc=other.cy+16*sign(y-other.cy) event_user(0)}
    }
}

with (ArkaBrickShort) if (coll) with (other) {
    if (abs(y-other.cy)<=16) {//x wall
        if (x=median(other.cx-16-radius,x,other.cx+16+radius)) {xc=other.cx+16*sign(x-other.cx) yc=y event_user(0)}
    } else if (abs(x-other.cx)<=16) {//y wall
        if (y=median(other.cy-16-radius,y,other.cy+16+radius)) {xc=x yc=other.cy+16*sign(y-other.cy) event_user(0)}
    }
}

with (ArkaBrick) if (coll) with (other) {
    if (abs(y-other.cy)>16 && abs(x-other.cx)>32) {//corner hit
        if (x<other.cx) xc=other.cx-32 else xc=other.cx+32
        if (y<other.cy) yc=other.cy-16 else yc=other.cy+16
        event_user(0)
    }
}

with (ArkaBrickShort) if (coll) with (other) {
    if (abs(y-other.cy)>16 && abs(x-other.cx)>16) {//corner hit
        if (x<other.cx) xc=other.cx-16 else xc=other.cx+16
        if (y<other.cy) yc=other.cy-16 else yc=other.cy+16
        event_user(0)
    }
}
#define Collision_BounceDown
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed<0) play_sound("hit")
vspeed=abs(vspeed)
#define Collision_BounceRight
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed<0) play_sound("hit")
hspeed=abs(hspeed)
if (direction mod 90<5 || direction mod 90>85) direction+=choose(-5,5)
#define Collision_BounceUp
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vspeed>0) play_sound("hit")
vspeed=-abs(vspeed)
#define Collision_BounceLeft
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed>0) play_sound("hit")
hspeed=-abs(hspeed)
if (direction mod 90<5 || direction mod 90>85) direction+=choose(-5,5)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var d;

if (point_distance(xc,yc,x,y)<radius) {
    d=point_direction(xc,yc,x,y)

    //check if the ball is actually moving towards the surface normal
    if (abs(((((direction - d+180) mod 360) + 540) mod 360) - 180)<90) {
        //expulse
        x=xc+lengthdir_x(radius,d)
        y=yc+lengthdir_y(radius,d)

        //reflect
        xc=max(0,lengthdir_x(speed,180-direction+d)*dampmul-dampsub)
        yc=lengthdir_y(speed,180-direction+d)
        yc=max(0,abs(yc)-dampfrc)*sign(yc)
        speed=point_distance(0,0,xc,yc)
        direction=point_direction(0,0,xc,yc)+d

        //rotsp=mean(rotsp,radtodeg(-yc/radius))

        //destroy blocks n' shiet
        with (other) instance_destroy()
        play_sound("break")
        play_sound("hit")

        if (other.object_index=ArkaBrick) speed+=mmf_speed(1)
        if (other.object_index=ArkaBrickShort) speed-=mmf_speed(2)
    }
}
