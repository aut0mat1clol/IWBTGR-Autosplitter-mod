#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_xscale=5.5
image_yscale=5.5
image_index=1
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index==0 && timer<=40) {
    timer+=1
    if (timer mod 4 == 0) y+=1
    if (timer mod 4 == 2) y-=1
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
play_sound("kraidgiefroar")
