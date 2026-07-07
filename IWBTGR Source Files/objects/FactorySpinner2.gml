#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (place_meeting(x,y-2,player) && !go) {
    go=1
    play_sound("metal2short")
}

if (go) {
    image_angle=max(-90,(image_angle*1.1-5))
    if (image_angle<-45) x=xstart-1
}
