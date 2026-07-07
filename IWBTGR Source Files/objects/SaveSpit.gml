#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gravity=0.4

if (instance_exists(player)) move_towards_gravity(player.x,player.y,gravity)
else hspeed=4

xp=x
yp=y
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_angle=direction

if (collision_line(xp,yp,x,y,player,1,0)) killPlayer()
xp=x
yp=y
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!place_free(x,y)) instance_destroy()
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
