#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=2
timer=0
go=0

current=1
laser[1]=10
laser[2]=140
laser[3]=200
laser[4]=210
laser[5]=350
laser[6]=400
laser[7]=590
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    timer+=1

    if (timer>=laser[current]) {
        with (QuickLaser) if (c=other.current) {
            active=1
        }
        if (inst) FMODInstanceStop(inst)
        inst=play_sound("quicklaser")
        current+=1
    }
    if (current=8) instance_destroy()
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=1
