#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
locked=true
piledriver=false
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (piledriver) {
    view_xview[0]=clamp(Kraidgief.x+103-400,0,room_width-800)
    view_yview[0]=clamp(Kraidgief.y+400-304,0,281)
} else if (locked) {
    view_xview[0]=0
    view_yview[0]=281
} else {
    view_xview[0]=clamp(global.px-400,0,room_width-800)
    view_yview[0]=clamp(global.py-304,0,281)
}
view_yview[0]+=voffset
voffset=0
