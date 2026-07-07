#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hitbox=instance_create(x,y,block)
hitbox.sprite_index=sprite_index
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y-1,player)) active=1
if (active) {
    if (timer < 20) {
        if (!(timer mod 2)) {
            x=xstart-1
        } else {
            x=xstart
        }
    } else if (timer == 20) {
        x=xstart
        with (hitbox) instance_destroy()
        play_sound("break")
        vspeed=mmf_speed(50)
    }
    timer+=1
}
