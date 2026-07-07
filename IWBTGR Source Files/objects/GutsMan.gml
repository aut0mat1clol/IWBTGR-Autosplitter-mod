#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
moveTimer=0
namePos=0
pause_music()
play_music("")
inst=play_sound("megamanstart")
alarm[0]=150
image_speed=0

active=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=1
player.frozen=true
x=global.px
vspeed=mmf_speed(300)
alarm[1]=70
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
startX=x
startY=y
moveTimer=50
alarm[2]=40
image_speed=mmf_animspeed(20)
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
namePos=1
alarm[3]=320-260
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("megascore")
alarm[4]=50
#define Alarm_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
gameOver.visible=true
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (moveTimer>0) {
    x=lerp(3434,startX,moveTimer/50)
    y=lerp(2084,startY,moveTimer/50)
    moveTimer-=1
}
if (namePos>=1) {
    namePos+=mmf_animspeed(30)
}

if (!active && !instance_exists(player)) instance_destroy()
#define Collision_platform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
y=yprevious
while (!place_meeting(x,y+1,platform))
    y+=1
global.silent_gameover=true
killPlayer()
gameOver.alarm[0]=-1
vspeed=0
sprite_index=sprGutsStand
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
stop_sound(inst)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (namePos >= 1) {
    draw_set_font(fNes)
    draw_text(3500,2088,string_copy("GUTSMAN",1,floor(namePos)))
    if (namePos >= 8) {
        draw_text(3500,2120,string_copy("CLEAR POINTS",1,floor(namePos-7)))
        if (namePos >= 19) {
            var s;
            switch (floor(namePos)) {
            case 19: case 22: s=50000 break
            case 20: case 23: s=10000 break
            case 21: case 24: s=80000 break
            default: s=100000 break
            }
            draw_set_color(c_black)
            draw_text(3502,2154,s)
            draw_set_color(c_white)
            draw_text(3500,2152,s)
        }
    }
}
