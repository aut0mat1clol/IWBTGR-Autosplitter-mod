#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("alarm")
alarm[0]=ceil(1.11*50)
count=9
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (count) {
    play_sound("alarm")
    alarm[0]=ceil(1.11*50)
    if (count=3 && instance_exists(player)) {
        play_music("ikaruga")
        visible=0
    }
}
count-=1

if (count==0) instance_destroy()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_subtract)
rect(0,bbox_top-10,800,bbox_bottom-bbox_top+20,$ffff00,0)
draw_set_blend_mode_ext(10,11)
rect(0,bbox_top-10,800,bbox_bottom-bbox_top+20,$ff,1)
draw_set_blend_mode(0)
draw_self()
