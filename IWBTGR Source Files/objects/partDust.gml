#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("noparticles")) instance_destroy()
image_speed=1/8
direction=75
speed=1
friction=-0.05
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed*=99/100

x+=choose(-1,0,0,1)
y+=choose(-1,0,0,1)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
