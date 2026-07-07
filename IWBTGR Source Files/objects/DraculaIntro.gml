#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=3
image_speed=0

timer=0

portrait_scale=0
portrait_speed=0
line=-1
inst=-1
draw_drac=true

c=0
display=""

textspeed=0.33

if (player.stoned) player.stoned+=30
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (skipButton() && timer<1900) {
    player.cutscene=false
    portrait_speed=-1/6
    FMODInstanceStop(inst)
    if (timer<1645) {
        instance_create(430,360,DracGlass)
        image_index=1
    }
    timer=1900
}

if (ch && !player.stoned && inst2) {
    FMODInstanceSetVolume(inst2,0)
    FMODInstanceSetVolume(inst,1)
}
ch=player.stoned

if (timer==0) {player.cutscene=true player.h=-1}
if (timer==50) {player.h=0}
if (timer==75-6) {portrait_speed=1/6 line=0 if (global.char==3) line=6}
if (timer==75) {line=0 if (global.char==4) {inst2=play_sound("ItsBLURRYtime") inst=play_sound("ItsBOSHYtime")} else if (global.char==3) {line=6 tempjp=1 inst=play_sound("vdracula1") inst2=play_sound("vdracula2")} else {inst=play_sound("1-diemonster") inst2=play_sound("2-diemonster")} if (player.stoned) FMODInstanceSetVolume(inst,0) else FMODInstanceSetVolume(inst2,0)}
if (timer==290-12) {portrait_speed=-1/6 tempjp=0}
if (timer==290) {FMODInstanceStop(inst) FMODInstanceStop(inst2) if (global.char==3) {} else inst=play_sound("2-itwasnotbymyhands")}
if (timer==350 && global.char==3) {inst=play_sound("7-what") timer=1601}
if (timer==820-12) {portrait_speed=-1/6}
if (timer==820) {FMODInstanceStop(inst) if (global.char==4) inst=play_sound("ItsBOSHYtime") else if (global.char==3) inst=play_sound("vdracula2") else inst=play_sound("3-tribute")}
if (timer==1100-12) {portrait_speed=-1/6}
if (timer==1100) {FMODInstanceStop(inst) inst=play_sound("4-perhapsthesame")}
if (timer==1300-12) {portrait_speed=-1/6}
if (timer==1300) {FMODInstanceStop(inst) if (global.char==4) inst=play_sound("ItsBOSHYtime") else if (global.char==3) inst=play_sound("vdracula3") else inst=play_sound("5-yourwords")}
if (timer==1600-12) {portrait_speed=-1/6}
if (timer==1600) {FMODInstanceStop(inst) inst=play_sound("6-whatisaman")}
if (timer==1645) {player.cutscene=false image_index=1 instance_create(430,360,DracGlass) }
if (timer==1680) {image_index=2 if (global.char==3) timer=1850}
if (instance_exists(player)) {
    if (timer==1900) image_speed=mmf_animspeed(20)
    if (floor(image_index)>=6 && image_index<7) image_speed=mmf_animspeed(10)
    if (floor(image_index)>=7 && image_index<9) image_speed=mmf_animspeed(20)
    if (floor(image_index)>=9) image_speed=0
    if (timer==1950) {
        with (instance_create(x,bbox_bottom+1,DracTele)) {
            max_width=32*3
            holder=other.id
            visible=false
        }
    }
    if (timer==2000-12) {
        portrait_speed=-1/6
    }
    if (timer==2000) {
        DracTele.visible=true
        play_music("draculafight")
        instance_create(-200,543,Dracula)
        instance_destroy()
    }
}
if (instance_exists(player) || timer>1645  || timer mod 5 == 0) timer=timer+1
if (portrait_speed != 0) {
    portrait_scale+=portrait_speed
    if (portrait_scale <= 0) {
        portrait_scale=0
        line+=1
        if (timer>1900) line=20
        c=0
        if (line<20) portrait_speed=1/6
        else portrait_speed=0
    }
    if (portrait_scale >= 1) {
        portrait_scale=1
        portrait_speed=0
    }
}

if (line>=0 && portrait_scale >= 1) {
    if (instance_exists(player)) c=min(c+textspeed,string_length(lang("dracula"+string(line))))
    display=string_replace_all(string_copy(lang("dracula"+string(line)),1,floor(c)),"$","")
    if (global.char==4 && (line mod 2==0)) display="It's Boshy time!"
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FMODInstanceStop(inst)
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=image_number-1
image_speed=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_drac=false
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (draw_drac) draw_self()
with (DracTele) event_perform(ev_draw,0)

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,x-20+2*image_index,y-64-5*image_index,0.15,0.15,-global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}

if ((line<0 || line>7) && portrait_speed==0) exit

// text box
left=64+32-30
right=672+32+30
top=55+9
midtop=98+9
midbot=179+9
bottom=220+9
top_col=$610000
bot_col=c_black
alpha=(255-100)/255
draw_primitive_begin(pr_trianglestrip)
draw_vertex_color(left,top,top_col,alpha)
draw_vertex_color(right,top,top_col,alpha)
draw_vertex_color(left,midtop,top_col,alpha)
draw_vertex_color(right,midtop,top_col,alpha)
draw_vertex_color(left,midbot,bot_col,alpha)
draw_vertex_color(right,midbot,bot_col,alpha)
draw_vertex_color(left,bottom,bot_col,alpha)
draw_vertex_color(right,bottom,bot_col,alpha)
draw_primitive_end()

// portrait
img=0
if ((line+1) mod 2) {
    if (global.char==1) img=5+(global.diff==0)
    else if (global.char==2) img=7+(global.diff==0)
    else if (global.char==3) img=9+(global.diff==0)
    else if (global.char==4) img=17+(global.diff==0)
    else img=1+(global.diff==0)

    if (player.stoned) {
        if (global.char==0) img+=10
        else if (global.char==3) img+=6
        else if (global.char==4) img+=2
        else img+=8
    }
}
draw_sprite_ext(sprDracPortrait,img,64+32+70-30+6,68+9+73,portrait_scale,portrait_scale,0,c_white,1)

if (img==0 && global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,64+32+70-30+6-48*portrait_scale,68+9+73-56*portrait_scale,0.5*portrait_scale,0.5*portrait_scale,-global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}

// text
if (portrait_speed==0) {
    if (global.language==0) draw_set_font(fDrac)
    else draw_set_font(fNes)
    //translate
    if (line mod 2 == 0) {
        if (global.char==1) draw_text(181+35-30,62+6,"Dotkid")
        else if (global.char==3) draw_text(181+35-30,62+6,"Owata")
        else if (global.char==4) draw_text(181+35-30,62+6,"Boshy")
        else draw_text(181+35-30,62+6,"The Kid")
    } else draw_text(181+35-30,62+6,"Dracula")
    if (global.jp || tempjp) draw_japanese(217+33+1-30,91+5,display,2,2,$ffffff,1,0,0)
    else draw_text(217+33+1-30,91+5,display)
}
