#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(20)
image_xscale=10
image_yscale=10
nonstick=1

alarm[0]=100

instance_create(x,y,DragonDevilismBlackShit)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
hspeed=mmf_speed(50)*sign(goto)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index<1 && image_speed<0) instance_destroy()

image_xscale=10*sign(goto)

if ((goto>0 && x>xstart+goto) || (goto<0 && x<xstart+goto)) {
    speed=0
    x=xstart+goto
    instance_create(x,y,DragonDevilismBlackShit)
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=2
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=image_number-1
image_speed=mmf_animspeed(-10)
