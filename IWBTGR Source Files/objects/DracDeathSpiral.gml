#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
direction=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (timer>=100) {
    if ((timer mod 5) == 0 || (timer mod 5) == 2) {
        direction+=mmf_direction(2)
        with (instance_create(x,y,DracSpiralApple)) {
            direction=other.direction
            speed=mmf_speed(30)
        }
    }
}
if (timer==300) {
    with (DracSpiralApple) instance_destroy()
    instance_destroy()
}

timer+=1
repeat (3) instance_create(random_range(x-32,x+32),random_range(y-32,y+32),DracSplosion)
with (instance_find(DracSpiralApple,irandom(instance_number(DracSpiralApple)-1))) {
    repeat (3) instance_create(random_range(x-16,x+16),random_range(y-16,y+16),DracSplosion)
}
