#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
timer=0
alpha_speed=0
prompt=false

sky=1
alarm[0]=25
alarm[1]=75
alarm[2]=24

if (global.char==4 && global.diff!=0) alarm[2]+=5*50

instance_create(0,0,CreditsTextLayer)

q='"'

line=0
text_alpha=0
text[0]="C o n g r a t u l a t i o n s ! !"
text[1]="Y o u   W o n ! !"
text[2]="- = I - W - B - T - G = -"
text[3]="Featuring...."
text[4]="- Remastered Credits -##Natsu & Renko: Project Management#Floogle & renex: Programming#Kayin: Quality Assurance#Midoru, Koala, & Roaming97: Translation"
text[5]="Special Thanks##Wolsk - Tesivonius - Bogandemon#Daglom - Mastermaxify - Kousaku-P#Duncan - Cocoa Pebbles - MajokkoMetis#Solgryn#& Everyone Else"
text[6]="- Original Credits -##Produced, Programmed and Designed By,#Michael "+q+"Kayin"+q+" O'Reilly##With Some Art and a Lot of Music Ripped from Games By#Nintendo, Konami, Capcom, Enix and Possibly Others!"
text[7]="Also Featuring...#The 8 (non)Robot Masters"
text[8]="Beta Tested by..#Paul "+q+"Makaris"+q+" Spickerman and Marc "+q+"Niku"+q+" Host#And the rest of Pyoko!##Voices By... # Paul "+q+"Makaris"+q+" Spickerman as The Kid#Michael "+q+"Kayin"+q+" O'Reilly as The Guy#Ben "+q+"Waffle"+q+" Hubbard as Fist of the North Star Narrator"
text[9]="Special Thanks to...#AJ Traskos, April Mahon, Katie Williamson,#Heber "+q+"Patito"+q+" Rivas and Maggie O'Reilly#Thank you for contributing to my thought process"
text[10]="Additional Special Thanks to...#Scott Sharkey, Zaratustra, Friday#and my webhost and friend, Kemru! (Also: \#Finalfight)"
text[11]="Extra Special Thanks to...#Eric Alexander#For inspiring me make a game, showing me MMF2 and #helping me develop and even name this game.#Thank you for being excited and#sincere about everything I do!"
text[12]="And Thanks to...#The Open Sound Project and Shyguy Kingdom#For Obvious Reasons"
text[13]="Thank You for Playing!"
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (timer<120*50) alarm[0]=25

if (!irandom(5)) instance_create(0,0,CreditsTree)
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (timer<150*50) alarm[1]=75

if (timer>120*50)
    if (!irandom(5)) instance_create(0,0,CreditsMountain)
#define Alarm_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char==4) {
    if (global.diff==0) inst=loop_sound("lalala")
    else inst=play_sound("Boshy_Credits")
} else inst=play_sound("zel3-ending")
#define Alarm_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//this attempts to catch up to timer imprecision in mmf2
//by running two steps every 35 frames
//it makes sure the music syncs up

alarm[3]=33
event_user(1)
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (CycleSpikeUp) if (inside_view()) image_speed=mmf_animspeed(30)
with (CycleSpikeDown) if (inside_view()) image_speed=mmf_animspeed(30)

if (timer<210*50) {
    off=(off+1) mod 32
    tile_layer_shift(-1010,1,0)
    if (!off) tile_layer_shift(-1010,-32,0)
}

if (timer==2*50) {
    text_speed=1
    text_alpha=0
}

if (timer==4*50) {
    text_speed=-1
}

if (timer==5*50) {
    text_speed=1
    text_alpha=0
    line+=1
}

if (timer==7*50) {
    text_speed=-1
}

if (timer==8*50) {
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==12*50) {
    text_speed=-1
}
if (timer==14*50) {
    text_speed=1
    text_alpha=0
    line+=1
}

if (timer==15*50) {
    sky_speed=-1
    alpha_speed=-1
    image_alpha=0
}
if (timer==16*50) {
    alpha_speed=-1
}
if (timer==18*50) {
    vspeed=-mmf_speed(20)
}
if (timer==20*50) {
    with (CreditsBugz) event_user(0)
    (rCredits_00176214).hspeed=-mmf_speed(10)
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==21*50) {
    alpha_speed=1
}
if (timer==27*50) {
    text_speed=-1
}
if (timer==28*50) {
    x=253
    y=2382
    speed=0
    hspeed=mmf_speed(10)
    alpha_speed=-1
}
if (timer==30*50) {
    direction=-45
}
if (timer==31*50) {
    direction=0
}
if (timer==36*50) {
    text_speed=1
    text_alpha=0
    line+=1   }

if (timer==40*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==43*50) {
    x=2076
    y=1864
    speed=0
    hspeed=mmf_speed(20)
    text_speed=-1
    text_alpha=1
}
if (timer==44*50) {
    alpha_speed=-1
    image_alpha=1
}
if (timer==55*50) {
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==59*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==61*50) {
    text_speed=-1
    text_alpha=1
}
if (timer==62.3*50) {
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==64*50) {
    text_speed=-1
}
if (timer==66.5*50) {
    alpha_speed=-1
    image_alpha=1
    x=377
    y=1819
    speed=0
}
if (timer==67*50) {
    vspeed=-mmf_speed(5)
}
if (timer==75*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==77*50) {
    alpha_speed=-1
    image_alpha=1
    x=2108
    y=2620
    speed=0
    hspeed=mmf_speed(10)
}
if (timer==82*50) {
    CreditsKid.speed=0
    CreditsKids.speed=0
    with (CreditsSpikeDude) event_user(0)
}
if (timer==85*50) {
    with (CreditsKraidgief) event_user(0)
}
if (timer==89*50) {
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==90.5*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==92*50) {
    text_speed=-1
    text_alpha=1
}
if (timer==94*50) {
    alpha_speed=-1
    image_alpha=1
    x=2293
    y=3230
    direction=mmf_direction(20)
    speed=mmf_speed(20)
    with (CreditsMedusa) event_user(0)
    with (CreditsWitch) event_user(0)
}
if (timer==106*50) {
    with (CreditsDracula) event_user(0)
}
if (timer==106.7*50) {
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==108*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==110*50) {
    x=3614
    y=4515
    speed=0
    vspeed=-mmf_speed(10)
}
if (timer==112*50) {
    text_speed=-1
    text_alpha=1
}
if (timer==114*50) {
    alpha_speed=-1
    image_alpha=1
    with (CreditsMedusa) instance_destroy()
    with (CreditsClownCar) event_user(0)
    with (CreditsBirdo) event_user(0)
    (rCredits_0034B726).vspeed=mmf_speed(10)
    (rCredits_0006B108).vspeed=mmf_speed(5)
}
if (timer==124*50) {
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==126*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==127*50) {
    text_speed=-1
    text_alpha=1
}
if (timer==130*50) {
    alpha_speed=-1
    image_alpha=1
    x=1188
    y=4707
    direction=180
}
if (timer==133*50) {
    with (CreditsSpaghet) event_user(0)
    play_sound("metroid_noise")
}
if (timer==142*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==143.5*50) {
    x=411
    y=4057
    direction=0
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==148*50) {
    text_speed=-1
    text_alpha=1
}
if (timer==150*50) {
    alpha_speed=-1
    image_alpha=1
}
if (timer==156*50) {
    with (CreditsDragon) event_user(0)
    with (rCredits_003CE133) {direction=mmf_direction(17) speed=mmf_speed(20)}
}
if (timer==161.5*50) {
    text_speed=1
    text_alpha=0
    line+=1
}
if (timer==165*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==167*50) {
    alpha_speed=-1
    image_alpha=1
    text_speed=-1
    text_alpha=1
    with (CreditsClownCar) instance_destroy()
    with (CreditsBirdo) instance_destroy()
    x=224
    y=5590
    speed=mmf_speed(15)
}

if (skipButton() && timer<185*50 && timer>25) {
    text_speed=-1
    sky_speed=1
    alarm[0]=-1
    alarm[1]=-1
    if (timer<82*50) {
        with (CreditsKid) {x+=hspeed*(82*50-other.timer) speed=0}
        with (CreditsKids) {x+=hspeed*(82*50-other.timer) speed=0}
        with (CreditsTree) instance_destroy()
        with (CreditsMountain) instance_destroy()
    }
    timer=185*50
    FMODInstanceSetPosition(inst,184.5/218.435)
}

if (timer==195*50) {
    alpha_speed=1
    image_alpha=0
}
if (timer==196*50) {
    alpha_speed=-1
    image_alpha=1
    sky_speed=1
    speed=0
    x=400
    y=304
    final=1
}

if (timer>=185*50 && timer<210*50) {
    tile_layer_shift(-1011,mmf_speed(8),0)
    tile_layer_shift(-1014,mmf_speed(8),0)
}
if (timer>=195*50 && timer<210*50) {
    tile_layer_shift(-1012,mmf_speed(8),0)
    with (deliciousFruit) {x+=mmf_speed(8) depth=-1013}
}

if (timer==210*50) {
    with (CreditsKid) {speed=0 active=1 instance_create(floor(x),floor(y),player) player.depth=depth}
    with (CreditsKids) {speed=0 if (global.char!=1) {image_speed=0 image_index=5}}
}

if (timer==212*50) {
    (rCredits_00037BDA).vspeed=mmf_speed(8)
    play_sound("19347_martian_chorused_bounces_06")
}

if (timer==216*50) {
    if (instance_exists(player)) {
        text_speed=1
        line=13
        text_alpha=0
        with (CreditsKids) event_user(0)
    }
}
if (timer==222*50) {
    if (instance_exists(player)) {
        if (savedata("legit") && !unlocks("2") && unlocks("secret1") && unlocks("secret2") && unlocks("secret3") && unlocks("secret4") && unlocks("secret5") && unlocks("secret6")) {
            unlock_ending()
            with (player) instance_destroy()
            room_goto(rUnlocks)
        } else {
            unlock_ending()
            with (player) instance_destroy()
            room_goto(rTitle)
        }
    }
}
image_alpha+=alpha_speed/50
sky=median(0,sky+sky_speed/50,1)
text_alpha=median(0,text_alpha+text_speed/50,1)

timer+=1

var ovx,ovy;

ovx=view_xview[0]
ovy=view_yview[0]

if (final) {view_xview[0]=0 view_yview[0]=0}
else {
    view_xview[0]=median(0,x-400+17,room_width-800)
    view_yview[0]=median(0,y-304+17+4,room_height-608)
}

tile_layer_shift(-1010,view_xview[0]-ovx,view_yview[0]-ovy)
tile_layer_shift(-1011,view_xview[0]-ovx,view_yview[0]-ovy)
tile_layer_shift(-1012,view_xview[0]-ovx,view_yview[0]-ovy)
tile_layer_shift(-1014,view_xview[0]-ovx,view_yview[0]-ovy)
CreditsKid.x+=view_xview[0]-ovx
CreditsKid.y+=view_yview[0]-ovy
with (CreditsKids) {
    x+=view_xview[0]-ovx
    y+=view_yview[0]-ovy
}
with (CreditsTree) {
    x+=view_xview[0]-ovx
    y+=view_yview[0]-ovy
}
with (CreditsMountain) {
    x+=view_xview[0]-ovx
    y+=view_yview[0]-ovy
}

global.px=x
global.py=y
#define Collision_EndingTrigger
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
execute_string(other.o)
with (other) instance_destroy()
#define Collision_EndingLeftArrow
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=180
#define Collision_EndingUpRightArrow
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=45
#define Collision_EndingUpArrow
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
direction=90
#define Collision_EndingSlowTrigger
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
speed=mmf_speed(7)
#define Collision_EndingTysonTrigger
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) instance_destroy()
speed=0
with (CreditsTyson) event_user(0)
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char==4) {
    var p;

    sprites[0]=sprBoshyKids1
    sprites[1]=sprBoshyKids2
    sprites[2]=sprBoshyKids3
    sprites[3]=sprBoshyKids4
    sprites[4]=sprBoshyKids5
    sprites[5]=sprBoshyKids6
    sprites[6]=sprBoshyKids7
    sprites[7]=sprBoshyKids8
    sprites[8]=sprBoshyKids9
    sprites[9]=sprBoshyKids10
    sprites[10]=sprBoshyKids11
    sprites[11]=sprBoshyKids12

    spritesj[0]=sprBoshyKids1J
    spritesj[1]=sprBoshyKids2J
    spritesj[2]=sprBoshyKids3J
    spritesj[3]=sprBoshyKids4J
    spritesj[4]=sprBoshyKids5J
    spritesj[5]=sprBoshyKids6J
    spritesj[6]=sprBoshyKids7J
    spritesj[7]=sprBoshyKids8J
    spritesj[8]=sprBoshyKids9J
    spritesj[9]=sprBoshyKids10J
    spritesj[10]=sprBoshyKids11J
    spritesj[11]=sprBoshyKids12J

    p=ds_priority_create()
    with (CreditsKids) ds_priority_add(p,id,x)

    i=0 repeat (12) {
        o=ds_priority_delete_min(p)
        o.later=spritesj[i]
        o.sprite_index=sprites[i]
        o.image_speed=0.2
    i+=1}

    ds_priority_destroy(p)
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_set_font(fSans)
draw_set_halign_lang(1)
draw_set_valign_lang(1)
draw_text_transformed_color(view_xview[0]+400-1,view_yview[0]+240-1,text[line],2,2,0,0,0,0,0,text_alpha)
draw_text_transformed_color(view_xview[0]+400-1,view_yview[0]+240+1,text[line],2,2,0,0,0,0,0,text_alpha)
draw_text_transformed_color(view_xview[0]+400+1,view_yview[0]+240-1,text[line],2,2,0,0,0,0,0,text_alpha)
draw_text_transformed_color(view_xview[0]+400+1,view_yview[0]+240+1,text[line],2,2,0,0,0,0,0,text_alpha)
draw_text_transformed_color(view_xview[0]+400,view_yview[0]+240,text[line],2,2,0,$ffffff,$ffffff,$ffffff,$ffffff,min(1,text_alpha*3))
draw_set_valign_lang(0)
draw_text_color(room_width-400,304,"New Content#Unlocked!",0,0,0,0,1)
draw_set_halign_lang(0)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

rect(0,0,room_width,room_height,c_black,image_alpha)


rect(view_xview[0],view_yview[0]+608-232,800,232,c_black,1)
rect(view_xview[0],view_yview[0]+608-223,800,223,$f7d7c4,1)

rect(view_xview[0],view_yview[0],800,608,$f7d7c4,sky)

if (prompt) rect(0,0,room_width,room_height,c_black,1)
