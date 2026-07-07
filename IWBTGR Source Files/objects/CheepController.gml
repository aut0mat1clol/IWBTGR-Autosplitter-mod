#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.px>8128) {
    with (RoadCheep) instance_destroy()
    instance_destroy()
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var n;

n=instance_number(RoadCheep)*2.5

with (RoadCheep) alarm[0]=irandom_range(1,n)
