#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_start(pMedusaMaker,mmf_speed(100),3,0)
alarm[0]=100
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=100
if (view_yview[0]<y) {
    i=instance_create(x+16,y+16,MedusaHead)
    i.hspeed=dir*mmf_speed(30)
    i.image_xscale=dir
}
