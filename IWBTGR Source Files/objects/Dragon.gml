#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=3
image_yscale=3
image_speed=mmf_animspeed(20)

hp=0
animate=1
nonstick=1

instance_create(x,y,DragonFace)


/*
    flag 0  = active
    flag 2  = in place
    flag 3  = in phase
    flag 5  = looking left
    flag 34 = dead

    value A = intro timer
    value B = boss timer
    value Z = hp

    action point = 84,45 - 56,1
*/
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (animate) frame=(frame+mmf_animspeed(20)) mod 2

if (active && inplace) {
    if (settings("dragonskip") && !global.bossrush) {
        if (keyboard_check(192) && keyboard_check(ord("N"))) {
            skipped=1
            play_music("")
        }
    }
}

if (!phase) {
    //introduction sequence
    //173
    if (active) {
        timer+=1
    }
    //174
    if (timer==100) {
        vspeed=mmf_speed(100)
    }
    //175
    if (!inplace) {
        if (y>128) {
            y=128
            inplace=1
            RoadMoon.vspeed=vspeed
            speed=0
            play_sound("break")
            player.cutscene=0
        }
    }
    //176
    if (timer==250) {
        hspeed=mmf_speed(25)
        play_music("megamanboss")
    }
    //178
    if (x>=25984) {
        speed=0
        phase=1
        timer=0
    }
    if (skipped) {
        play_music("")
        play_music("megawin")
    }
} else {
    //in phase, active.

    //179
    timer+=1

    event_user(0)

    //180
    if (timer=10) {
        hspeed=mmf_speed(-15)
        //this block is forced down in the fight bc the dragon never hits it
        play_sound("break")
        with (blockTrapDestructible) if (x==25984) instance_destroy()
    }

    //181
    if (timer=50) {
        speed=0
    }

    //182
    if (timer=100) {
        vspeed=mmf_speed(-15)
    }

    //183,184
    if (x>DragonMarker.x) {
        if (bbox_top<0) direction=270
        if (bbox_bottom>608+140) direction=90
    }

    //185,186
    if (timer=350) {
        instance_create(actionx,actiony,DragonFire)
        shooting=floor(20*(2/mmf_animspeed(20)))
        play_sound("fire")
    }

    //187
    if (timer=450) {
        instance_create(actionx,actiony,DragonFire)
        play_sound("fire")
        timer=201
    }

    //189,190
    if (shooting) shooting-=1

    //197
    if (hp>=10 && y<10 && timer>=0 && image_xscale>0 && flag20==false && flag21==false && flag78==false) {
        speed=0
        frame=0
        animate=0
        shooting=0
        timer=-1000
        flag20=true
    }

    //198 - 203
    if (timer=-800) {i=instance_create(x-140,y+82 ,DragonDevilism) i.goto=750}
    if (timer=-900) {i=instance_create(x+20 ,y+82 ,DragonDevilism) i.goto=750}
    if (timer=-670) {i=instance_create(x-140,y+210,DragonDevilism) i.goto=750 visible=0}
    if (timer=-750) {i=instance_create(x+20 ,y+210,DragonDevilism) i.goto=750}
    if (timer=-700) {i=instance_create(x-140,y+338,DragonDevilism) i.goto=750}
    if (timer=-850) {i=instance_create(x+20 ,y+338,DragonDevilism) i.goto=750}

    //208
    if (timer>-600 && timer<-400) {
        view_xview[0]+=1
    }

    //209
    if (timer=-350) {
        x+=650
        visible=1
        image_xscale=-3
        event_user(0)
        animate=1
        with (DragonDevilism) event_user(0)
        vspeed=mmf_speed(25)
        instance_create(actionx,actiony,DragonFire)
        with (DragonDevilismBlackShit) instance_destroy()
        play_sound("fire")
        timer=101
    }

    //210
    if (hp>=25 && y<20 && timer>=0 && image_xscale<0 && flag21==false && flag78==false) {
        speed=0
        frame=0
        animate=0
        shooting=0
        timer=-2000
        flag21=true
    }

    //212 - 217
    if (timer=-1900) {i=instance_create(x-90,y+82 ,DragonDevilism) i.goto=-750}
    if (timer=-1780) {i=instance_create(x+70,y+82 ,DragonDevilism) i.goto=-750}
    if (timer=-1850) {i=instance_create(x-90,y+210,DragonDevilism) i.goto=-750}
    if (timer=-1825) {i=instance_create(x+70,y+210,DragonDevilism) i.goto=-750}
    if (timer=-1900) {i=instance_create(x-90,y+338,DragonDevilism) i.goto=-750}
    if (timer=-1780) {i=instance_create(x+70,y+338,DragonDevilism) i.goto=-750 visible=0}

    //220
    if (timer>-1600 && timer<-1400) {
        view_xview[0]-=1
    }

    //221
    if (timer=-1350) {
        x-=650
        visible=1
        image_xscale=3
        event_user(0)
        animate=1
        with (DragonDevilism) event_user(0)
        vspeed=mmf_speed(25)
        instance_create(actionx,actiony,DragonFire)
        with (DragonDevilismBlackShit) instance_destroy()
        play_sound("fire")
        timer=101
    }

    //222
    if (hp>=50 && y<10 && timer>=0 && image_xscale>0 && flag21==true && flag78==false) {
        speed=0
        frame=0
        animate=0
        shooting=0
        timer=-3000
        flag20=true
    }

    //223-228
    if (timer=-2700) {i=instance_create(x-140,y+82 ,DragonDevilism) i.goto=10000000 visible=0}
    if (timer=-2900) {i=instance_create(x+20,y+82 ,DragonDevilism) i.goto=10000000}
    if (timer=-2750) {i=instance_create(x-140,y+210,DragonDevilism)  i.goto=10000000}
    if (timer=-2850) {i=instance_create(x+20,y+210,DragonDevilism) i.goto=10000000}
    if (timer=-2750) {i=instance_create(x-140,y+338,DragonDevilism) i.goto=10000000}
    if (timer=-2800) {i=instance_create(x+20,y+338,DragonDevilism) i.goto=10000000}

    //229
    if (timer>-2600 && timer<-2300) {
        view_xview[0]+=1
    }

    //230
    if (timer=-2001) {
        x=26806
        y=148
        image_xscale=-3
        event_user(0)
        animate=1
        with (DragonDevilism) event_user(0)
        hspeed=mmf_speed(-27)
        flag78=true
        with (DragonDevilismBlackShit) instance_destroy()
        visible=1
        timer=3000
    }
    //231
    if (timer=3001) {
        with (DragonBlock) event_user(0)
    }

    //232
    if (flag78 && timer>3050) {
        view_xview[0]=x-600
    }

    if (skipped) {
        speed=0
        timer=50199
        skipped=0
    }
    //237,238
    if (timer=50200) {
        play_sound("megawin")
        if (global.char==3) with (player) {cutscene=1 h=0}
    }

    //239
    if (!instance_exists(player) && timer<50000) {speed=0 timer=0}

    //240
    if (timer=50500-50*(global.char==3)) {
        if (global.bossrush) {
            defeat_bossrush("dragon")
        } else {
            with (player) instance_destroy()
            global.save_on_room_change=1
            global.orb_on_room_change="orb_dragon"
            room_goto(rGuyFortress1)
        }
    }
    if (timer=50350 && global.char==3) {
        with (player) {owataunt=3 owatimer=0 play_sound("upgrade")}

    }
    if (timer=50400 && global.char==3) {
        player.visible=0
        instance_create(player.x,player.y,OwataOut)
    }

    if (dead) {
        instance_create(x+irandom_range(-100,200),y+irandom(250),MagicExplosion)
    }
}
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("click")
other.direction=mmf_direction(irandom(31))
#define Collision_blockTrapDestructible
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) {
    hspeed=other.hspeed
    instance_destroy()
    play_sound("break")
}
#define Collision_DragonMarker
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed<0) {
    direction=mmf_direction(17)
    speed=mmf_speed(30)
}
#define Collision_DragonMarker2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (hspeed<0) {
    timer=50000
    dead=true
    speed=mmf_speed(10)
    direction=315
    play_sound("paintboom")
    play_music("")
    flag78=false
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///update action point
//action point = 84,45
//origin = 56,1
//face offset = 82,73

actionx=x+28*image_xscale
actiony=y+44*image_yscale

DragonFace.x=actionx-70
DragonFace.y=actiony-73
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
dx=floor(x)
dy=floor(y)

with (DragonFace) event_user(0)

draw_sprite_ext(sprDragonMouth,!!shooting,dx,dy+3*(floor(frame)-1),image_xscale,image_yscale,0,$ffffff,1)
draw_sprite_ext(sprDragon,floor(frame),dx,dy,image_xscale,image_yscale,0,$ffffff,1)

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,x+40*sign(image_xscale),y+56+floor(frame)*3,0.5,0.5,sign(image_xscale)*-global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}

with (DragonFace) event_user(0)
