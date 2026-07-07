#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (savedata("orb_tyson")) {
    instance_destroy()
    exit
}
intro=true
timer=0
y=ceil(y/608)*608-10
image_xscale=6
image_yscale=6
image_speed=0 // intro is 30/200
base_speed=0
phase=0
hp=5
fist=instance_create(-1000,-1000,TysonFist)
vulnerable=false
hitted=false
culprit=noone
running=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
play_sound("punchoutfall")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active && !running) {
    running=1
    visible=1
    with (TysonDoor) image_index=0
}

if (!intro && !instance_exists(player)) {
    // game over animation
    with (fist) {
        other.timer=0
        instance_destroy()
    }
    if (timer==20) {
        play_music("")
        gameOver.inst=play_sound("gameoverpo")
    }
    timer+=1
    if (hp > 0 || timer < 100 || y < ystart + 500) {
        // we're visible, flex
        y=ystart
        hspeed=0
        vspeed=0
        sprite_index=sprTysonFlex
        image_speed=5/100
    }
    exit
}
if (intro) {
    // intro
    if (skipButton() && running && timer<2040) {
        // skip
        with (TysonDoor) image_speed=0.25
        player.x=x
        player.xprevious=x
        if (!player.vic) {
            player.y=407
            player.ystart=407
        }
        player.hspeed=0
        player.vspeed=0
        player.h=0
        y=ystart
        timer=2040
    }
    if (timer == 0) {
        if (running) {
            // player has entered, walk in
            play_music("")
            player.cutscene=true
            if (player.x < x) {
                player.h=1
            } else {
                player.h=0
                timer+=1
            }
        }
    } else {
        // remainder of intro animation
        switch (timer) {
        case 100: case 400: case 700:
            play_sound("pound")
        case 103: case 403: case 703:
            cameraHard.voffset=-6
        }
        if (timer == 100) {
            with (TysonDoor) image_speed=0.25
        } else if (timer == 400) {
            with (TysonStar) {
                vspeed=-2
                alarm[0]=10
            }
        } else if (timer == 450) {
            play_sound("shatter")
        } else if (timer == 750) {
            vspeed=-1
            inst=play_sound("punchout1")
        } else if (timer == 1300) {
            sprite_index=sprTysonDance
            image_speed=30/200
        } else if (timer == 1850) {
            FMODInstanceStop(inst)
            inst=play_sound("punchout2")
        } else if (timer == 2050) {
            player.cutscene=false
            intro=false
            timer=0
            FMODInstanceStop(inst)
            inst=-1
            play_music("punchout3")
            global.silent_gameover=true
        }
        if (y mod 608<=ystart)
            vspeed=0
        if (timer != 0) timer+=1
    }
} else if (hitted) {
    if (hp > 0) {
        // got shot, taking damage animation
        if (timer < 10) {
        } else if (timer < 15) {
            fist.y=-1000
            vulnerable=false
            sprite_index=sprTysonFall
            image_speed=0
            vspeed=-6
        } else if (timer < 20) {
            vspeed=6
        } else {
            timer=470
            hitted=false
        }
    } else {
        // KO, falling down / getting up animation
        if (timer < 100) {
            vspeed=4
            if (timer == 16 || timer == 32 || timer == 48) {
                image_xscale=-image_xscale
            }
            hspeed=image_xscale*2
            vspeed=4+timer/8
            if (timer mod 16 < 2) {
                hspeed=0
                vspeed=0
            }
        } else if (timer < 300) {
            if (timer == 100) {
                play_sound("groundhit")
                play_music("fallmusic")
            }
        } else if (timer < 320 && phase < 2) {
            if (timer == 300) {
                play_music("punchout3")
            }
            x=3584
            sprite_index = sprTysonGetUp
            y = ystart + 200
            if (timer >= 310)
                y = ystart
            else
                x-=200*sign(image_xscale)
        } else if (phase == 2) {
            if (timer == 410) {
                play_music("")
                play_sound("fightwin")
                play_sound("tko")
                TysonReferee.visible=true
            }
            if (timer == 730) {
                // VICTOLY
                play_music("12")
                global.silent_gameover=false
                instance_create(4064,288,OrbTyson)
                with (TysonReferee) instance_destroy()
                with (TysonDoor) instance_destroy()
                instance_destroy()
            }
        } else {
            y=ystart
            hitted=false
            hp=5
            phase+=1
            timer=-10
            base_speed=phase
        }
    }
    timer+=1

} else {
    // regular battle ai
    var punch; // 0=none, 1=punch1, 2=punch2, 3=fireball
    var punchtimer;
    punch=0
    base_speed=phase
    if (timer >= 320 && phase == 2) base_speed-=5
    if (timer < 100) {
    } else if (timer < 120) {
        punch=1
        punchtimer=timer-100
    } else if (timer < 200) {
    } else if (timer < 220) {
        punch=1
        punchtimer=timer-200
    } else if (timer < 300) {
    } else if (timer < 320) {
        if (phase < 2) punch=1 else punch=2
        punchtimer=timer-300
    } else if (timer < 350) {
    } else if (timer < 380) {
        punch=2
        punchtimer=timer-350
    } else if (timer < 450) {
    } else if (timer < 510) {
        punch=3
        punchtimer=timer-450
    } else {
        timer=-5
    }
    timer+=1

    vulnerable=false // set to true below when vulnerable
    var player_dir;
    player_dir = sign(global.px-x)
    if (punch == 0) {
        // just walkin
        sprite_index=sprTysonWalk
        image_speed=20/200
        hspeed=base_speed*player_dir
        vspeed=0
        fist.y=-1000
    } else if (punch == 1) {
        // uppercut
        hspeed=(base_speed+5)*player_dir
        image_speed=0
        sprite_index=sprTysonPunch
        // be careful his position stays the same!
        var new_image_index;
        new_image_index=punchtimer >= 10
        if (new_image_index == 1 && new_image_index != image_index) {
            play_sound("tysonpunch")
        }
        image_index=new_image_index
        if (image_index == 0) {
            vspeed=7
        } else {
            vspeed=-7
            fist.x=x
            fist.y=y+225
        }
    } else if (punch == 2) {
        // punching the floor away
        sprite_index=sprTysonPunch
        vspeed=0
        hspeed=base_speed*player_dir
        if (punchtimer < 10) {
            image_index=0
        } else if (punchtimer < 20) {
            if (punchtimer == 10) play_sound("tysonpunch2")
            image_index=2
            fist.x=x
            fist.y=y+320
        } else if (punchtimer < 30) {
            if (punchtimer == 20) {
                play_sound("tysonpunch2")
                image_xscale=-image_xscale
            }
            fist.x=x
            fist.y=y+320
        }
        if (punchtimer == 10+7 || punchtimer == 20+7) {
            // destroy block
            var list,c;
            with (TysonBrick) if (instance_place(x,y,TysonFist)) {
                list[c]=id
                c+=1
            }

            if (c) with (list[irandom(c-1)]) {
                vspeed=-2
                instance_destroy()
            }
        }
    } else if (punch == 3) {
        // vomiting fireballs
        sprite_index=sprTysonFireball
        image_speed=0
        vulnerable=true
        vspeed=0
        hspeed=0
        fist.x=x-18*sign(image_xscale)
        fist.y=y+120

        if (punchtimer == 10) {
            repeat (3) instance_create(fist.x,fist.y,TysonFireball)
            play_sound("spitfire")
        }
    }

    fist.hspeed=hspeed
    fist.vspeed=vspeed
    if (player_dir != 0 && punch != 2) {
        image_xscale=abs(image_xscale)*player_dir
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inst>=0) FMODInstanceStop(inst)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///get hit
if (vulnerable) {
    hp-=global.damage
    hitted=true
    timer=0
    play_sound("tysonhitted")
    if (hp <= 0) {
        fist.y=-1000
        alarm[0]=10
        sprite_index=sprTysonFall
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,x+8*sign(image_xscale),y+24,0.5,0.5,global.boshybowangle*sign(image_xscale),$ffffff,1)
    texture_set_interpolation(0)
}
