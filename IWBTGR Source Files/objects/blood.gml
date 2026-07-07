#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=irandom(image_number-1)
image_speed=0
image_angle=random(360)

gravity=0.1+random(0.2)

if (room=rCredits) depth=-1013
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=abs(gravity)
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (attach) {
    if (!instance_exists(attach)) {
        attach=noone
        gravity=0.1+random(0.2)
    } else {
        x=attach.x+lengthdir_x(offd,offa+attach.image_angle-offoa)
        y=attach.y+lengthdir_y(offd,offa+attach.image_angle-offoa)
        recheck-=1
        if (!recheck) {
            recheck=50
            image_xscale=2
            image_yscale=2
            if (!instance_place(x,y,attach)) {
                attach=noone
                gravity=0.1+random(0.2)
            }
            image_xscale=1
            image_yscale=1
        }
    }
} else if irandom(1) {
    attach=instance_place(x+hspeed,y+vspeed,block)
    if (!attach) attach=instance_place(x+hspeed,y+vspeed,playerKiller)
    if (!attach) attach=instance_place(x+hspeed,y+vspeed,TheSpikeYouShoot)
    if (attach) {
        if (attach.nonstick) attach=noone
        else if (!attach.visible && !attach.solid) attach=noone
        else {
            recheck=irandom(50)
            if (speed) {
                move_contact_solid(direction,speed)
                if (!attach.solid) {
                    x+=(hspeed/speed)*4
                    y+=(vspeed/speed)*4
                } else {
                    x+=(hspeed/speed)*2
                    y+=(vspeed/speed)*2
                }
            }
            speed=0 gravity=0
            offa=point_direction(attach.x,attach.y,x,y)
            offd=point_distance(attach.x,attach.y,x,y)
            offoa=attach.image_angle
            if (attach.visible) depth=attach.depth-0.1
        }
    }
}
#define Collision_RyuWind
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!attach) {
    gravity=-abs(gravity)
    alarm[0]=2
}
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
