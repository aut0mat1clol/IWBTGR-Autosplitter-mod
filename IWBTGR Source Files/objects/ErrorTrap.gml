#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("full")) window_set_cursor(cr_default)

if (!settings("classicerror")) {
    image_xscale=0.95
    image_yscale=0.95
    image_alpha=0
} else image_index=1

if (global.char==4) image_index=2

image_speed=0

alpha=0
pause_music()
if (global.haswinsound && image_index==0) play_sound("windows error")
else play_sound("Windows XP Critical Stop")

player.frozen=1
mems=player.sprite_index
memf=player.image_index
memx=player.x
memy=player.y
membx=player.bowx
memby=player.bowy
if (player.charnge>=25) FMODInstanceSetPause(player.inst,1)

mode2=(room=rKraidgiefBoss)

x=view_xview[0]+192+209
y=view_yview[0]+160+132

memxv=view_xview[0]

alarm[0]=100
alarm[1]=165

with (Kraidgief) {speed=0 frozen=1}
with (KraidgiefDebris) {speed=0 gravity=0 memc=c}
with (KraidgiefDebrisSpawner) instance_destroy()
with (KraidgiefFallingSpike) {speed=0 active=0}
with (KGFireSide) image_speed=0
with (KGFireDown) image_speed=0
with (bullet) speed=0
with (decoStar) image_speed=0
with (Blanka) {image_speed=0 xspeed=0}
with (OwataPlatform) vspeed=0

if (mode2) str="___________________________________________
ERROR in
action number 1
of Key Press Event for K-key Key
for object Kraidgief:

Error in code at line 2:
   hp /= debug;
         ^
at position 8: Division by 0."
else str="___________________________________________
ERROR in
action number 1
of Collision Event with object player
for object trigger:

Error in code at line 15:
   (obj).active = true;
   ^
at position 2: Cannot assign to the variable"
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("full")) window_set_cursor(cr_none)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!mode2) {
    player.frozen=0
    player.speed=0
    if (player.charnge>=25) FMODInstanceSetPause(player.inst,0)
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!mode2) {
    play_sound("19347_martian_chorused_bounces_06")
    vspeed=mmf_speed(50)
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=min(1,(1.01+image_xscale*3)/4)
image_yscale=image_xscale

image_alpha=min(1,(1.1+image_alpha*3)/4)

alpha=min(1,0.6,alpha+0.6/22)

if (player.frozen) {
    player.sprite_index=mems
    player.image_index=memf
    player.bowx=membx
    player.bowy=memby
    player.x=memx
    player.y=memy
    player.speed=0
}

if (mouse_check_button_pressed(mb_left) && within(global.mx,global.my,x-419/2,y-264/2,419,264))
    event_user(0)

with (KraidgiefDebris) {c=memc}

if (!inside_view()) {
    if (visible) {
        y=-9999
        speed=0
    }
}
if (memxv!=view_xview[0]) {
    resume_music()
    instance_destroy()
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (speed) killPlayer(ErrorTrap)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mode2 && speed=0) {
    play_sound("19347_martian_chorused_bounces_06")
    speed=10
    direction=point_direction(x,y,global.px,global.py)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!image_index) rect(view_xview[0],view_yview[0],800,608,$ffffff,alpha)
draw_self()

if (!image_index) {
    draw_set_font(fError)
    draw_set_color(0)
    texture_set_interpolation(1)
    draw_text_ext_transformed(x-195*image_xscale,y-94*image_xscale,str,-1,-1,image_xscale,image_xscale,0)
    texture_set_interpolation(0)
    draw_set_color($ffffff)
}
