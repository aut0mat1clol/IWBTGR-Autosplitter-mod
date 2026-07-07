#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile=tile_add(bgBroccoli,0,0,111,175,x,y,1003)
hspeed=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile_set_position(tile,x,y)
if (x<-111) x=800+irandom(25)*32
