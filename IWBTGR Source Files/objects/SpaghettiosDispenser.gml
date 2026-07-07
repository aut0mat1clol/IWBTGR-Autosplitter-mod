#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
c=110
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    if (instance_exists(player)) c+=1
    if (c==220) {
        instance_create(x,y,Spaghettio)
        c=0
    }
} else if (inside_view()) active=1
