#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=-1
image_speed=mmf_animspeed(20)
intro=true
timer=0
inst=-1
damage=0
phase=0
lerp_xstart=0
lerp_ystart=0
big_bullet_counter=0

volmus=1

portrait_scale=0
portrait_speed=0
line=-1
c=0
display=""
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=true
if (intro) {
    if (skipButton()) {
        portrait_speed=-1/6
        player.x=64
        player.xprevious=64
        timer=2800
        spikeRight.x=0
        spikeRight.hspeed=0
    }
    if (timer==0) {
        player.cutscene=true
        if (player.x<64-3) {
            player.h=1
            exit
        } else {
            player.x=64
            player.xprevious=61
            player.h=0
        }
    }
    if (timer>5 && volmus>0.3) {
        volmus=max(0.3,volmus-0.05)
        FMODGroupSetVolume(1,(volmus*settings("volmus"))/100)
    }
    if (timer==50-6) {
        portrait_speed=1/6
        if (global.char==3) line=12 else line=0
    }
    if (timer==50) {
        with (spikeRight) hspeed=mmf_speed(20)
        if (global.char==4) inst=play_sound("ItsBOSHYtime")
        else if (global.char==3) {inst=play_sound("jpguy0") tempjp=1}
        else inst=play_sound("final1")
    }
    with (spikeRight) if (x+hspeed>0) {
        x=0
        hspeed=0
    }
    if (timer==250-6+50*(global.char==3)-100*(global.char==4)) portrait_speed=-1/6
    if (timer==250+50*(global.char==3)-100*(global.char==4)) {
        tempjp=0
        FMODInstanceStop(inst)
        if (global.char==4) inst=play_sound("boshy_guy1")
        else if (global.char==3) {inst=play_sound("finalb") timer=2650}
        else inst=play_sound("final2")
    }
    if (timer==600-6+150*(global.char==4)) portrait_speed=-1/6
    if (timer==600+150*(global.char==4)) {
        FMODInstanceStop(inst)
        if (global.char==4) inst=play_sound("ItsBOSHYtime")
        else inst=play_sound("final3")
    }
    if (timer==850-6) portrait_speed=-1/6
    if (timer==850) {
        FMODInstanceStop(inst)
        if (global.char==4) inst=play_sound("boshy_guy2")
        else inst=play_sound("final 5")
    }
    if (timer==1000-6+100*(global.char==4)) portrait_speed=-1/6
    if (timer==1000+100*(global.char==4)) {
        FMODInstanceStop(inst)
        if (global.char==4) {inst=play_sound("ItsBOSHYtime") timer=2650}
        else inst=play_sound("final5")
    }
    if (timer==1050-6+100*(global.char==4)) portrait_speed=-1/6
    if (timer==1050+100*(global.char==4)) {
        FMODInstanceStop(inst)
        inst=play_sound("missing2")
    }
    if (timer==1650-6) portrait_speed=-1/6
    if (timer==1650) {
        FMODInstanceStop(inst)
        if (global.char==4) inst=play_sound("ItsBOSHYtime")
        else inst=play_sound("MISSING1")
    }
    if (timer==1775-6) portrait_speed=-1/6
    if (timer==1775) {
        FMODInstanceStop(inst)
        inst=play_sound("final6")
    }
    if (timer==2000-6) portrait_speed=-1/6
    if (timer==2000) {
        FMODInstanceStop(inst)
        if (global.char==4) inst=play_sound("ItsBOSHYtime")
        else inst=play_sound("final7")
    }
    if (timer==2250-6) portrait_speed=-1/6
    if (timer==2250) {
        FMODInstanceStop(inst)
        inst=play_sound("final9")
    }
    if (timer==2500-6) portrait_speed=-1/6
    if (timer==2500) {
        FMODInstanceStop(inst)
        if (global.char==4) inst=play_sound("ItsBOSHYtime")
        else inst=play_sound("final10")
    }
    if (timer==2750-6) portrait_speed=-1/6

    if (portrait_speed != 0) {
        portrait_scale+=portrait_speed
        if (portrait_scale <= 0) {
            portrait_scale=0
            line+=1
            if (timer>2500) line=20
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
        str=lang("guy"+string(line))
        if (global.char==4) {
            if (line mod 2==0) str="It's Boshy time!"
            else str=pick((line-1)/2,lang("guyboshy1"),lang("guyboshy2"))
        }
        if (instance_exists(player)) c=min(c+0.33,string_length(str))
        display=string_replace_all(string_copy(str,1,floor(c)),"$","")
    }

    if (timer==2800) {
        FMODInstanceStop(inst)
        inst=-1
        player.cutscene=false
        timer=5000
        intro=false
    }
} else if (phase==0) {
    portrait_scale+=portrait_speed
    if (portrait_scale<=0) {
        portrait_scale=0
        portrait_speed=0
        line=20
    }
    if (timer==5050) {
        with (instance_create(x-37,y-43,GuyFirstBullet)) {
            move_towards_point(global.px,global.py,mmf_speed(100))
        }
        play_sound("fire")
    }
    if (timer==5100) {
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
        path_start(pGuyJump,mmf_speed(100),0,false)
    }
    if (timer==5120) {
        instance_create(x-47,y-41,Grenade)
    }
    if (timer==5200) {
        image_xscale=1
        hspeed=mmf_speed(50)
        sprite_index=sprGuyWalk
        image_speed=mmf_animspeed(70,80)
    }
    if (timer==5210) {
        hspeed=0
        vspeed=mmf_speed(100)
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
    }
    if (damage<30 && y>=576 && sprite_index=sprGuyJump) {
        speed=0
        play_sound("break")
        y=576
        sprite_index=sprGuyStand
        image_speed=mmf_animspeed(20)
        instance_create(48,452,GuyPersistentFirePillar)
        instance_create(80,452,GuyPersistentFirePillar)
        instance_create(720,452,GuyPersistentFirePillar)
        instance_create(752,452,GuyPersistentFirePillar)
        cameraHard.voffset=-4
    }
    if (timer==5350 && player.bbox_bottom<566) {
        play_sound("fire")
        with (instance_create(x+34,y-43,GuyFirstBullet)) {
            move_towards_point(global.px,global.py,mmf_speed(100))
        }
        timer=5325
    }
    if (timer==5360) {
        hspeed=mmf_speed(100)
        sprite_index=sprGuyWalk
        image_speed=mmf_animspeed(70,80)
    }
    if (damage<30 && y==576 && hspeed>0 && bbox_right>=708) {
        play_sound("break")
        image_xscale=-1
        hspeed=-mmf_speed(100)
        cameraHard.voffset=-4
    }
    if (damage<30 && y==576 && hspeed<0 && bbox_left<=91) {
        play_sound("break")
        image_xscale=1
        hspeed=mmf_speed(100)
        cameraHard.voffset=-4
    }
    if (timer==5500) {
        play_sound("tysonhitted")
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
        hspeed=0
        vspeed=-mmf_speed(100)
        with (GuyPersistentFirePillar) instance_destroy()
    }
    if (timer==5520) {
        move_towards_point(734,450,mmf_speed(100))
    }
    if (timer>5520 && timer<6000 && x>=734) {
        x=734
        y=448
        image_xscale=-1
        speed=0
        sprite_index=sprGuyStand
        image_speed=mmf_animspeed(20)
        play_sound("break")
        cameraHard.voffset=-4
        if (damage<30) timer=5001
        else {timer=8000 phase=1}
    }
} else if (phase==1) {
    if (timer==8100) {
        hspeed=0
        vspeed=-mmf_speed(50)
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
    }
    if (timer>8000 && bbox_top<63) {
        vspeed=mmf_speed(60)
        timer=8500
    }
    if (timer==8501) {
        var i;
        for (i=19;i<=24;i+=1) with (instance_create(x-47,y-41,GuySpreadBullet)) direction=mmf_direction(i)
        play_sound("teleport")
    }
    if (x>=720 && bbox_bottom>=457 && vspeed=mmf_speed(60) && sprite_index==sprGuyJump) {
        x=726
        y=448
        play_sound("break")
        cameraHard.voffset=-4
        speed=0
        sprite_index=sprGuyStand
        image_speed=mmf_animspeed(20)
        image_xscale=-1
    }
    if (timer==8550) {
        for (i=15;i<=20;i+=1) with (instance_create(x-37,y-43,GuySpreadBullet)) direction=mmf_direction(i)
        play_sound("teleport")
    }
    if (timer==8560) {
        hspeed=-mmf_speed(50)
        sprite_index=sprGuyWalk
        image_speed=mmf_animspeed(70,80)
    }
    if (timer==8570) {
        hspeed=0
        vspeed=mmf_speed(50)
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
    }
    if (y>=576 && sprite_index==sprGuyJump) {
        speed=0
        sprite_index=sprGuyWalk
        image_speed=mmf_animspeed(70,80)
        cameraHard.voffset=-4
        y=576
    }
    if (timer==8620) {
        hspeed=-mmf_speed(100)
        image_speed=mmf_animspeed(70,80)
    }
    if (timer==8660) {
        move_towards_point(63,448,mmf_speed(100))
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
        play_sound("tysonhitted")
    }
    if (y<=448 && sprite_index==sprGuyJump && timer>8650 && timer<8700) {
        play_sound("break")
        cameraHard.voffset=-4
        speed=0
        sprite_index=sprGuyStand
        image_speed=mmf_animspeed(20)
        image_xscale=1
        x=76
        y=449
    }
    if (timer==8800 || timer==8900 || timer==9000 || timer==9100 || timer==9200) {
        play_sound("teleport")
        with (instance_create(x+34,y-43,GuySpreadBullet)) move_towards_point(global.px,global.py,mmf_speed(90))
    }
    if (timer==9300) {
        play_sound("tysonhitted")
        hspeed=mmf_speed(70)
        vspeed=0
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
    }
    if (timer==9380) {
        x=726
        y=448
        image_xscale=-1
        speed=0
        sprite_index=sprGuyStand
        image_speed=mmf_animspeed(20)
        play_sound("break")
        timer=8001
    }
} else if (phase==2) {
    if (global.px<396) image_xscale=-1
    if (global.px>396) image_xscale=1
    if (timer<=10010) {
        x=lerp(lerp_xstart,401,(timer-10000)/10)
        y=lerp(lerp_ystart,577,(timer-10000)/10)
    }
    if (timer==10010) {
        sprite_index=sprGuyStand
        image_speed=mmf_animspeed(20)
        play_sound("break")
    }
    var action_x;
    if (image_xscale<0) action_x=x-37
    else action_x=x+34
    if (timer==10100) {
        instance_create(action_x,y-43,GuyBouncingBullet)
        play_sound("fire")
    }
    if (timer==10200 && big_bullet_counter<3) {
        big_bullet_counter+=1
        timer=10020
    }
    if (timer==10230) {
        with (instance_create(action_x,y-43,Grenade)) {
            direction=135
            speed=mmf_speed(50)
        }
    }
    if (timer==10280) {
        Grenade.direction=mmf_direction(21)
        big_bullet_counter=0
        timer=10011
    }
} else if (phase==3) {
    image_angle+=45
    if (timer<=20020) {
        x=lerp(lerp_xstart,416,(timer-20000)/20)
        y=lerp(lerp_ystart,312,(timer-20000)/20)
    }
    if (timer==20020) {
        play_sound("shatter")
        GlAsshole.visible=true
        with (prtGuyGlass) {speed=mmf_speed(60) depth=-1}
        instance_create(407,301,TheGun)
        instance_destroy()
    }
}

if (instance_exists(player) || !intro || timer mod 10 == 0) timer+=1

//put music volume back up after cutscene
if (timer>2800 && volmus<1) {
    volmus=min(1,volmus+0.05)
    FMODGroupSetVolume(1,(volmus*settings("volmus"))/100)
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.invalid) exit

if (phase<2) {
    with (other) instance_destroy()
    visible=false
    damage+=other.damage
    play_sound("hit")
    if (damage>=30 && timer<5501) {
        timer=5501
        hspeed=0
        vspeed=-mmf_speed(100)
        play_sound("tysonhitted")
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
        with (GuyPersistentFirePillar) instance_destroy()
    }
    if (damage>=45) {
        lerp_xstart=x
        lerp_ystart=y
        speed=0
        timer=10000
        phase=2
        damage=45
        sprite_index=sprGuyJump
        image_speed=mmf_animspeed(50)
    }
} else if (phase==2) {
    other.invalid=1
    other.direction=random(360)
    play_sound("click")
}
#define Collision_GuyBouncingBullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.counter>=1) {
    with (other) instance_destroy()
    play_sound("pound")
    visible=false
    damage+=1
    if (damage>=49) {
        phase=3
        lerp_xstart=x
        lerp_ystart=y
        timer=20000
        play_music("")
        sprite_index=sprGuyDie
        with (WilyFirePillar) instance_destroy()
        with (Grenade) instance_destroy()
        with (GuyBouncingBullet) instance_destroy()
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inst!=-1) FMODInstanceStop(inst)
music_updatevolume()
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("break")
speed=0
image_xscale=1
sprite_index=sprGuyStand
image_speed=mmf_animspeed(20)
// TODO screen shake
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,x-16*image_xscale,y-70,0.25,0.25,sign(image_xscale)*-global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}

if ((line<0 || line>13) && portrait_speed==0) exit

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
img=2+(timer mod 10 >= 5)
if ((line+1) mod 2) {
    img=(global.diff==0)
    if (global.char==1) img+=4
    if (global.char==2) img+=6
    if (global.char==3) img+=8
    if (global.char==4) img+=10
}
draw_sprite_ext(sprGuyPortrait,img,64+32+70-30,68+9+73,portrait_scale,portrait_scale,0,c_white,1)

if ((img==2 || img==3) && global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,64+32+70-30+6+38*portrait_scale,68+9+73-46*portrait_scale,0.5*portrait_scale,0.5*portrait_scale,global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}


// text
if (portrait_speed==0) {
    draw_set_font(fSans)
    //translate
    if (line mod 2 == 0) {
        if (global.char==1) draw_text_transformed(181+35-30,62+6,"Dotkid",2,2,0)
        else if (global.char==3) draw_text_transformed(181+35-30,62+6,"Owata",2,2,0)
        else if (global.char==4) draw_text_transformed(181+35-30,62+6,"Boshy",2,2,0)
        else draw_text_transformed(181+35-30,62+6,"The Kid",2,2,0)
    } else draw_text_transformed(181+35-30,62+6,"The Guy",2,2,0)

    if (tempjp) draw_japanese(217+33-30,91+5,display,2,2,$ffffff,1,0,0)
    else draw_text_transformed_lang(217+33-30,91+5,display,2,2,0)
}
