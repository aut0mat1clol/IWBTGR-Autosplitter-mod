#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

alarm[0]=100

k=16
countto3=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
countto3+=1
if (countto3==3) {
    y+=k
    k=max(0,abs(k)-3)*-sign(k)
    countto3=0
}
