#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer+=1

if (timer=100) if (savedata("orb_tyson")) EntranceStatue2.go=1
if (timer=200) if (savedata("orb_mother")) EntranceStatue4.go=1
if (timer=300) if (savedata("orb_bowser")) EntranceStatue3.go=1
if (timer=400) if (savedata("orb_birdo")) EntranceStatue5.go=1
if (timer=500) if (savedata("orb_dracula")) EntranceStatue1.go=1
if (timer=600) if (savedata("orb_kraidgief")) EntranceStatue6.go=1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_blend_mode(bm_max)
with (partEntrance) draw_self()
draw_set_blend_mode(0)
