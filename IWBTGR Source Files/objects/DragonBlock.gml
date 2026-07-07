#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

event_user(0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!place_meeting(x,y,blockTrapDestructible)) {
    tile_add(tileMaster,0,352,32,32,x,y,1000)
    instance_create(x,y,blockTrapDestructible)
}
