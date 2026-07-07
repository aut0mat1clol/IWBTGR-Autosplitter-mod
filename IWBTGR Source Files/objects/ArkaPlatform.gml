#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=settings("paddle")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=(global.px>1728 && global.px<2336 && global.py>200)

if (active && ArkaBall.speed=0) {
    ArkaBall.speed=mmf_speed(30)
    ArkaBall.direction=45
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) x=median(1776,global.px,2288)
