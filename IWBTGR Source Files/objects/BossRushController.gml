#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
s=string(global.char)
if (global.char==0) s=""
str="Best: "+time_str_tick(settings("bossrush_time"+s),settings("bossrush_tick"+s))+"#Deaths: "+string(settings("bossrush_deaths"+s))

if (
    savedata("orb_tyson") &&
    savedata("orb_mother") &&
    savedata("orb_bowser") &&
    savedata("orb_birdo") &&
    savedata("orb_dracula") &&
    savedata("orb_kraidgief") &&
    savedata("orb_dragon") &&
    savedata("orb_guy")
) {
    play_music("")
    play_sound("rushend")
    if (global.time+global.tick/50<settings("bossrush_time"+s)+settings("bossrush_tick"+s)/50) {
        settings("bossrush_deaths"+s,global.death)
        settings("bossrush_time"+s,global.time)
        settings("bossrush_tick"+s,global.tick)
        str="Best: "+time_str_tick(settings("bossrush_time"+s),settings("bossrush_tick"+s))+"#Deaths: "+string(settings("bossrush_deaths"+s))
        str+="##New Record!"
    } else {
        str+="##Not Fast enough!#Press F2 to try again!"
    }
    global.bossrush=3
} else play_music("bossrush")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (player.bbox_bottom>288 && global.bossrush=1) global.bossrush=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fSans)

draw_set_color(0)
draw_text_transformed(x-1,y,str,2,2,0)
draw_text_transformed(x+1,y,str,2,2,0)
draw_text_transformed(x,y-1,str,2,2,0)
draw_text_transformed(x,y+1,str,2,2,0)
draw_set_color($ffffff)
draw_text_transformed(x,y,str,2,2,0)
