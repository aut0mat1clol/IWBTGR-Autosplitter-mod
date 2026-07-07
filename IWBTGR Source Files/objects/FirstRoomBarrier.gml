#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprGuySpikeTrapBarrier
image_speed=0
alarm[2]=3 // allow save speedstrat
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[1]=10*25-ceil(image_number/image_speed)-1
image_speed=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=-50/100
alarm[2]=-image_index/image_speed
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=0
image_speed=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (alarm[2] < 0) { // allow save speedstrat
    image_speed=50/100
    play_sound("click")
    alarm[0]=ceil(image_number/image_speed)-1
}
