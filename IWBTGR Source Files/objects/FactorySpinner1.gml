#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && !go) {
    go=1
    play_sound("metal2short")
}

if (go) {
    image_angle=min(90,(image_angle*1.1+5))
    if (image_angle>45) y=ystart-1
}
