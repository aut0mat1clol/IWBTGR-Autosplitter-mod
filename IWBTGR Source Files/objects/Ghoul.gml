#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
timer=0
hp=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (up) {
    if (image_index >= 4 && image_speed != 0 && timer < 600) {
        image_speed=0
        timer=irandom(50)
        hspeed=mmf_speed(16)*sign(image_xscale)
        hp=4
    }
    if (image_speed == 0 && timer < 600) {
        with (instance_place(x,y,player)) killPlayer(other.id)
        switch (timer mod 6) {
            case 0: image_index=4 break
            case 2: image_index=5 break
        }
        timer+=1
    }
    if (timer >= 600 || !inside_active()) {
        timer=600
        hspeed=0
        image_speed=0
        image_index-=mmf_animspeed(20)
    }
    if (floor(image_index) < 0) instance_destroy()
} else {
    timer+=1
    if (!(timer mod 4)) image_xscale*=-1
    if (timer>=31) {
        up=1
        timer=0
        image_speed=mmf_animspeed(20)
    }
}
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=-hspeed
if (hspeed!=0) image_xscale=abs(image_xscale)*sign(hspeed)
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hp>0) {
    hp-=other.damage
    with (other) instance_destroy()
    play_sound("thud")
    if (hp<=0) {
        timer=601
    }
}
