#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//attention moviegowers.

//huge angry mommy thinker.
//just masive

sprite_index=sprMotherHitboxes
image_speed=0

glass=instance_create(x,y,block)
glass.sprite_index=sprMotherHitboxes
glass.image_index=1
glass.image_speed=0

hp=35
alarm[0]=2
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_music(room_song())
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!you_losted) if (escape) {
    timer-=1
    instance_create(irandom(800*3),1824,TourianDebris)
    if (!(abs(timer) mod 12.5)) view_yview[0]+=3
    if (timer<=0) {
        play_music("")
        play_sound("paintboom")
        killPlayer(TourianBarrier)
        you_losted=1
    }
} else if (!die) {
    anim=(anim+mmf_animspeed(20)) mod 4
    flash=max(0,flash-mmf_animspeed(40))

    image_index=0
    if (place_meeting(x,y,player)) killPlayer(MommyThinker)
    if (open) image_index=2
}

if (die) {
    anim=2+mmf_animspeed(40)
    if (flash=0) {flash=1 c+=1 if (c=30) {x=-1000 defeat_bossrush("mother")}}
    flash=max(0,flash-mmf_animspeed(40))
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (die) exit
if (image_index=0) {
    image_index=2
    play_sound("shatter")
    open=1
} else {
    play_sound("motherhit")
    hp-=other.damage
    flash=1
    if (hp<=0) {
        die=1
        timer=3000
        play_music("tourianescape (2)")
        with (musicChanger) if (x<2400) instance_destroy()
        with (Spaghettio) instance_destroy()
        with (SpaghettiosDispenser) instance_destroy()
        with (TourianTurret) instance_destroy()
        with (MotherBrainPlatform) vspeed=mmf_speed(15)
        with (glass) instance_destroy()
    }
}
with (other) instance_destroy()
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (Spaghettio) instance_destroy()
with (SpaghettiosDispenser) instance_destroy()
with (TourianTurret) instance_destroy()
with (MotherBrainPlatform) instance_destroy()
with (musicChanger) if (x<2400) instance_destroy()

x=-9999

depth=-100

escape=1
timer=3000

play_music("tourianescape (2)")
alarm[0]=-1
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (you_losted) {
    rect(view_xview[0],view_yview[0],800,608,0,1)
} else if (escape) {
    draw_set_font(fNes)
    draw_set_color($ff0000)
    draw_text(view_xview[0]+64,view_yview[0]+48,"TIME")
    draw_set_color($ffffff)
    draw_text(view_xview[0]+64,view_yview[0]+64,timer)
}

if (flash>0) draw_sprite(sprMotherBrain,4,x,y)
else draw_sprite(sprMotherBrain,floor(anim),x,y)
if (open) draw_sprite(sprMotherHitboxes,0,x,y)

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,x+16,y,0.5,0.5,-global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}
