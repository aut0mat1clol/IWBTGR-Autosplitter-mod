#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODAllStop()
inst=play_sound("megaman1")

image_speed=0.5

view_yview[0]=room_height-608

line=0
f=0
go=1
reset=false
char=0

alarm[0]=27*50
alarm[1]=42*50
alarm[2]=76*50
if (settings("pog")) alarm[3]=5

text[0]="In the Year 200X"
text[1]="On his 15th Birthday..."
text[2]="A child left home..."
text[3]="On his dangerous and epic quest"
text[4]="To become The Guy!"

if (settings("devkeys")) devkeys=1

verify_unlocks()
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state<2) {
    state=2
    timer=0
}
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state<4) {
    state=4
    FMODInstanceStop(inst)
    inst=play_sound("megaman2")
}
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
view_xview[0]=800
state=5
timer=0
FMODInstanceStop(inst)
play_music("zelda")
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[3]=5

ry=random(1)
instance_create(328+irandom(lerp(100,300,ry))*choose(-1,1),round(lerp(50,300,ry)),Poggers)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (devkeys) {
    if (keyboard_check(ord("F"))) {
        if (keyboard_check(ord("2"))) {select_save(0) global.diff=1 instance_create(128+5,128+12,player) room_goto(rMegaman)}
        if (keyboard_check(ord("3"))) {select_save(0) global.diff=1 instance_create(0+5,928+12,player) room_goto(rGraveyard)}
        if (keyboard_check(ord("4"))) {select_save(0) global.diff=1 instance_create(32+5,512+12,player) room_goto(rCastlevania)}
        if (keyboard_check(ord("5"))) {select_save(0) global.diff=1 instance_create(1920+5,480+12,player) room_goto(rKraidgiefLair)}
        if (keyboard_check(ord("7"))) {select_save(0) global.diff=1 instance_create(32+5,288+12,player) room_goto(rGuyFortress1)}
        if (keyboard_check(ord("8"))) {select_save(0) global.diff=1 instance_create(736+5,416+12,player) room_goto(rGuyTower)}
    }
}

if (state=0) {
    f=median(0,f+go*1/50,1)

    timer+=1

    if (timer=150) go=-1

    if (timer=250) {
        timer=0
        go=1
        line+=1
        if (line=5) {
            state=1
            timer=0
        }
    }
}

if (state=2) {
    view_yview[0]=max(0,view_yview[0]-4)
    if (view_yview[0]==0) {
        state=3
    }
}

if (state=5) {
    timer+=1
    if (timer<608 || timer>708)
        view_yview[0]=min(room_height-608,view_yview[0]+1)
}

if (!reset) {
    if (global.key_pressed[key_jump]) {
        if (state!=4) {
            state=4
            view_xview[0]=0
            view_yview[0]=0
            play_music("")
            FMODInstanceStop(inst)
            inst=play_sound("megaman2")
            alarm[2]=(76-42)*50
        } else {
            if (opt) start_bossrush(menuchartogamechar(char))
            else room_goto(rFiles)
        }
    }

    if (state=4) {
        v=0
        if (global.input_v!=0) {
            if (!lockv) v=global.input_v
            lockv=1
        } else {
            lockv=0
        }
        h=0
        if (global.input_h!=0) {
            if (!lockh) h=global.input_h
            lockh=1
        } else {
            lockh=0
        }

        if (v!=0 && unlocks("1")) opt=!opt
        if (h!=0 && opt && unlocks("2")) char=median(0,char+h,4)
    } else opt=0
} else {
    if (keyboard_check_pressed(ord('N'))) reset=false
    if (keyboard_check_pressed(ord('Y'))) {
        reset=false
        input_defaults()
    }
}

y=ystart+36*opt

if (keyboard_check_pressed(ord('C')) && keyboard_check(vk_control)) {
    reset=true
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODInstanceStop(inst)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("swag")) {
    draw_background_ext(bgTitleSwag,28,22,1,1,0,rainbow(swag),1)
    swag+=5
}

draw_self()

draw_set_font(fSans)
draw_text(5,586-18,"Cherry Treehouse#"+version)

//hide version and start until intro is done
if (state!=4) rect(0,352,416,256,0,1)

//hide boss rush
if (!unlocks("1")) rect(290,400,128,32,0,1)

if (opt && unlocks("2")) {
    if (char) draw_sprite_ext(sprite_index,0,417,408,-1,1,0,$ffffff,1)
    draw_sprite(sprChar,menuchartogamechar(char),412+20-13,408-13)
    if (char<4) draw_sprite_ext(sprite_index,0,412+40,408,1,1,0,$ffffff,1)
}

rect(0,3032,800,192,0,1)

if (state==5) {
    draw_background_stretched(bgStory1,800+400-128*(608/224),608,256*(608/224),224*(608/224))
    draw_background_stretched(bgStory2,800+400-128*(608/224),1300,256*(608/224),16*(608/224))
}

draw_set_halign_lang(1)

if (!done) {
    draw_text_transformed_color_lang(400,3100,lang("intro"+string(line)),2,2,0,$ffffff,$ffffff,$ffffff,$ffffff,round(f*3)/3)
}

if (state==5) {
    draw_text_transformed_lang(800+250,1520,lang("item0"),2,2,0)
    draw_text_transformed_lang(800+550,1520,lang("item1"),2,2,0)

    draw_text_transformed_lang(800+250,1760,lang("item2"),2,2,0)
    draw_text_transformed_lang(800+550,1760,lang("item3"),2,2,0)

    draw_text_transformed_lang(800+250,2060,lang("item4"),2,2,0)
    draw_text_transformed_lang(800+550,2060,lang("item5"),2,2,0)

    draw_text_transformed_lang(800+250,2270,lang("item6"),2,2,0)
    draw_text_transformed_lang(800+550,2270,lang("item7"),2,2,0)

    draw_text_transformed_lang(800+250,2560,lang("item8"),2,2,0)
    draw_text_transformed_lang(800+550,2560,lang("item9"),2,2,0)

    draw_text_transformed_lang(800+400,2770,lang("item10"),2,2,0)

    draw_text_color_lang(800+400,2905,lang("item11"),0,0,0,0,1)
}

if (reset) {
    draw_set_font(fSans)
    rect(view_xview[0]+315,view_yview[0]+298,170,30,0,1)
    draw_rectangle(view_xview[0]+315,view_yview[0]+298,view_xview[0]+315+169,view_yview[0]+298+30,1)
    draw_set_valign_lang(0)
    draw_text(view_xview[0]+400,view_yview[0]+304, "Reset controls? [Y/N]")
    draw_set_valign_lang(0)
}

draw_set_halign_lang(0)
