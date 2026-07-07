#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
off=0
repeat (8) instance_create(-111,369,FilesTree)
repeat (6) instance_create(-112,0,FilesKumo)

event_user(0)

frame=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
off=(off+1) mod 32
tile_layer_shift(1002,-1,0)

if (!off) tile_layer_shift(1002,32,0)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///Set up header text
var left_df, right_df;
left_df=rFiles_001F9764
right_df=rFiles_00319B52
strimj=lang("file0")
chars=0
if (unlocks("2") && !settings("newcharseen")) {
    strimj=lang("file20")
    chars=1
}
left_df.x=left_df.xstart
right_df.x=right_df.xstart
if (global.language!=0) {
    if (!chars) {
        left_df.x+=30
        right_df.x-=30
    } else {
        left_df.x-=65
        right_df.x+=65
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//translate
var char_move;

draw_set_font(fComic13)
if (frame mod 8 > 4) draw_set_color($ffff)
var f;f=!!global.language
if (!chars) {
    draw_text_lang(245+8*f,34+3*f,strimj)
} else {
    draw_text_lang(245-65*f,34+3*f,strimj)
}
draw_set_color($ffffff)

if (chars) {
    frame+=1
    char_move=65*f
    draw_sprite(sprDotKid,0,448+char_move,32+28)
    draw_sprite(sprVic,(frame mod 8<4)*5+2,480-12+char_move,32+23)
    draw_sprite(sprOwataIdle2,0,512+char_move-8,32+23)
    draw_sprite(sprBoshyIdle,frame/5,530+char_move,32+23)
}
