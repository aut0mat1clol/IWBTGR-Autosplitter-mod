#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (savedata("orb_bowser")) {
    instance_destroy()
    exit
}
eyes=-1
prop=0
driver_image=-1
wart_y=32
image_xscale=-3
image_yscale=3

prop_speed=0.5
phase=0
timer=0
intro=true
dying=true
meme=false

lerp_xstart=x
lerp_ystart=y

vspeed=mmf_speed(6)

hp=18
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (path_position>0.5) image_xscale=abs(image_xscale)
else image_xscale=-abs(image_xscale)
alarm[1]=25
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
path_speed=mmf_speed(100)
if (path_position>0.5) path_speed*=-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
coll=collision_rectangle(x-48,y-180,x+48,y-84,player,0,0)
if (coll) killPlayer(ClownCar)

if (phase == 0) {
    if (intro) {
        if (skipButton()) {
            timer=675
            driver_image=5
            vspeed=0
            y=208.5
        }
        if (timer == 0) {
            play_music("")
            if (instance_exists(player)) inst=play_sound("bowseropen (2)")
        } if (timer == 550)
            vspeed=0
        if (timer == 600)
            driver_image=0
        if (timer >= 600 && driver_image < 5) {
            driver_image+=mmf_animspeed(50)
        }
        if (timer == 675) {
            intro=false
            path_start(pBowserSwoosh,0,3,0)
            alarm[1]=25
            FMODInstanceStop(inst)
            inst=-1
            play_music("bowsernormal")
        }
    } else {
        // only useful for dashing
        if (path_speed!=0 && path_position!=0) {
            var dir;
            dir=lengthdir_x(1,direction)
            if (dir>0) {
                image_xscale=abs(image_xscale)
            } else if (dir<0) {
                image_xscale=-abs(image_xscale)
            }
        }
        if (dead) {
            if (timer<2200) image_angle+=45
            if (timer==2200 && instance_exists(player)) {
                x=704
                y=-204
                vspeed=mmf_speed(6)
                phase=1
                driver_image=-1
                intro=true
                eyes=-1
                image_angle=0
                dead=false
                image_xscale=-abs(image_xscale)
            }
        }
    }
} else if (phase == 1) {
    if (intro) {
        if (timer > 2300 && skipButton() && timer<2925) {
            timer=2925
            vspeed=0
            wart_y=0
            y=246
            driver_image=0
            with (BowserFloor) instance_destroy()
            if (inst) FMODInstanceStop(inst)
            inst=-1
            play_music("bowserfast (2)")
        }
        if (timer==2300) {
            with (BowserFloor) image_speed=mmf_animspeed(50)
            play_music("")
            if (instance_exists(player)) if (instance_exists(player)) inst=play_sound("bowseropen (2)")
        }
        if (timer==2800) {
            vspeed=0
        }
        if (timer==2900) {
            wart_y=19
            driver_image=0
        }
        if (timer==2902) {
            wart_y=12
        }
        if (timer==2904) {
            wart_y=0
        }
        if (timer==2975) {
            if (inst) FMODInstanceStop(inst)
            inst=-1
            play_music("bowserfast (2)")
            direction=mmf_direction(20)
            speed=mmf_speed(40)
            intro=false
        }
    } else {
        if (timer < 3900) {
            if (y+28*3+8*3 >= 512) {
                cameraHard.voffset=4
                play_sound("break")
                instance_create(x,512,WartPoof)
                with (instance_create(x,512,WartPoof)) {
                    sprite_index=sprWartPoofLeft
                    hspeed=-hspeed
                }
                if (hspeed < 0) {
                    direction=mmf_direction(12)
                } else {
                    direction=mmf_direction(4)
                }
            }
            if (x-32*3 <= 0) {
                direction=mmf_direction(28)
            }
            if (x+32*3 >= 800) {
                direction=mmf_direction(21)
            }
            if (y-28*3-32*3 <= 32) {
                if (hspeed < 0) {
                    direction=mmf_direction(21)
                } else {
                    direction=mmf_direction(28)
                }
            }
            image_xscale=abs(image_xscale)
            if (hspeed < 0) {
                image_xscale *= -1
            }
        } else if (timer == 3900 || timer == 4000) {
            if (timer == 4000) {
                x=672
                y=92+28*3
            }
            lerp_xstart=x
            lerp_ystart=y
            hspeed=0
            vspeed=0
        } else if (timer < 4000) {
            image_xscale=abs(image_xscale)
            x=lerp(lerp_xstart,672,(timer-3900)/100)
            y=lerp(lerp_ystart,92+28*3,(timer-3900)/100)
        } else if (timer <= 4030) {
            image_xscale=-abs(image_xscale)
            y=lerp(lerp_ystart,332+28*3,(timer-4000)/30)
            if (timer == 4002) {
                wart_y=12
            } else if (timer == 4004) {
                wart_y=19
            } else if (timer == 4006) {
                driver_image=-1
            }
            if (timer >= 4008 && timer <= 4012) {
                image_angle=lerp(0,90,(timer-4008)/4)
            }
        } else if (timer == 4050) {
            play_sound("marioshoot")
            instance_create(x-35,y-11-28*3,WartBanzai)
        } else if (timer > 4050) {
            if (!dead && !instance_exists(WartBanzai) && !instance_exists(BowserExplosion)) {
                if (!meme) {
                    timer = 4100
                    meme = true
                } else {
                    if (timer >= 4200) {
                        if (y >= 331+28*3) {
                            timer=4200
                            vspeed=-4
                        } else if (y <= 246) {
                            if (timer < 4225) vspeed=0
                            if (timer == 4275) image_xscale=-image_xscale
                            if (timer == 4300) image_xscale=-image_xscale
                            if (timer == 4350) {
                                play_sound("tysonhitted")
                                eyes=2
                            }
                            if (timer == 4425) {
                                eyes=-1
                                vspeed=-8
                            }
                            if (timer == 4475) {
                                dead=true
                                timer=5175
                            }
                        } else {
                            timer=4200
                            if (y < 331) {
                                if (image_angle>0) image_angle-=90/4 else image_angle=0
                            }
                        }
                    } else if (!instance_exists(player)) {
                        timer=4100
                    }
                }
            }
            if (dead) {
                image_angle-=45
                if (timer == 5200 && instance_exists(player)) {
                    x=704
                    y=-204
                    vspeed=mmf_speed(6)
                    phase=2
                    driver_image=-1
                    intro=true
                    eyes=-1
                    image_angle=0
                    dead=false
                    image_xscale=-abs(image_xscale)
                    prop_speed=0.2
                }
            }
        }
    }
} else if (phase == 2) {
    visible=true
    if (!dead && driver_image >= 8) {
        if (timer < 6075) driver_image=8+((timer mod 10) >= 5)
        else driver_image=8+((timer mod 4) >= 2)
    }
    if (intro) {
        if (timer > 5300 && skipButton() && timer<5975) {
            timer=5975
            vspeed=0
            y=246
            driver_image=8
        }
        if (timer == 5300) {
            play_music("")
            if (instance_exists(player)) inst=play_sound("bowseropen (2)")
        } if (timer == 5800)
            vspeed=0
        if (timer == 5900)
            driver_image=0
        if (timer > 5900 && driver_image < 8)
            driver_image+=mmf_animspeed(50)
        if (timer == 5975) {
            if (inst) FMODInstanceStop(inst)
            inst=-1
            if (instance_exists(player)) play_music("bowserfastest")
            eyes=1
        }
        if (timer >= 5975 && timer < 6075)
            driver_image+=2*((timer mod 10) >= 5)
        if (timer == 6075) prop_speed=0.5
        if (timer == 6100) {
            intro=false
            path_start(pWilyHover,mmf_speed(100),3,true)
        }
    } else {
        if (!dead) {
            coll=collision_rectangle(x-48,y-180,x+48,y-84,bullet,0,0)
            if (coll) if (!coll.invalid) with (coll) {with (other) event_user(0) instance_destroy()}
            if (timer == 6100)
                path_start(pWilyHover,mmf_speed(100),3,true)
            if (path_speed!=0 && path_position!=0) {
                var dir;
                dir=lengthdir_x(1,direction)
                if (dir>0) {
                    image_xscale=abs(image_xscale)
                } else if (dir<0) {
                    image_xscale=-abs(image_xscale)
                }
            }
            if (timer >= 6110 && timer < 7000) {
                if (timer mod 75 == 0) {
                    instance_create(x,y+180-28*3,WilyFireball)
                    play_sound("BOWSERFIRE")
                }
            }
            if (timer == 7000) {
                path_speed=0
                lerp_xstart=x
                lerp_ystart=y
            }
            if (timer >= 7000 && timer <= 7040) {
                x=lerp(lerp_xstart,704,(timer-7000)/40)
                y=lerp(lerp_ystart,246,(timer-7000)/40)
                driver_image+=2*((timer mod 10) >= 5)
            }
            if (timer >= 7050 && timer < 7100) {
                if (timer == 7050)
                    driver_image=8
                image_xscale=-abs(image_xscale)
                if (driver_image > -1) {
                    driver_image-=mmf_animspeed(50)
                } else if (image_angle<180) {
                    image_angle+=22.5
                }
            }
            if (timer == 7100) {
                play_sound("marioshoot")
                instance_create(x,y-22,WilyBall)
            }
            if (timer >= 7150) {
                if (image_angle>0) {
                    image_angle-=22.5
                } else if (driver_image<8) {
                    driver_image+=mmf_animspeed(50)
                } else if (timer<10000) {
                    timer=6090
                }
            }
        } else {
            image_angle-=45
            if (instance_exists(player)) {
                if (timer == 10200) {
                    inst=play_sound("bowserend")
                }
                if (timer == 10300) {
                    // end boss rush
                }
                if (timer == 10600) {
                    play_music("001 megaman2")
                    instance_create(678,486,OrbBowser)
                    instance_create(32,512,BowserFloor)
                    instance_create(768,512,BowserFloor)
                    with (BowserWall) instance_destroy()
                    with (WilyBall) instance_destroy()
                    instance_destroy()
                }
            }
        }
    }
}

timer+=1
prop+=prop_speed

if (!instance_exists(player)) if (inst) FMODInstanceStop(inst)
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase == 2 && !dead && other.valid) {
    with (other) instance_destroy()
    event_user(0)
} else if (!other.invalid && image_angle==0) {
    play_sound("click")
    other.direction=mmf_direction(irandom(31))
    other.invalid=1
}
#define Collision_BowserExplosion
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dead) exit
if (phase == 0) {
    path_speed=0
    vspeed=-mmf_speed(70)
    driver_image=6
    timer=2000
    play_music("")
    inst=play_sound("BrowserBeat1")
    dead=true
    eyes=0
} else if (phase == 1) {
    timer=5000
    vspeed=-mmf_speed(70)
    play_music("")
    inst=play_sound("BrowserBeat1")
    dead=true
    eyes=0
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inst) FMODInstanceStop(inst)
#define Other_8
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase == 0) {
    if (path_position < 0.5 || timer < 1100) {
        path_speed=0
        alarm[0]=25
    } else {
        if (path_index == pBowserSwoosh) {
            path_start(pBowserDash,mmf_speed(100),0,0)
        } else {
            x=xstart
            y=208.5
            path_start(pBowserSwoosh,0,3,0)
            alarm[1]=25
            timer=690
            image_xscale=-abs(image_xscale)
            instance_create(711,118,BowserBomb)
        }
    }
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///dr wily gets damaged

hp-=other.damage
play_sound("tysonhitted")
if (hp<=0) {
    dead=true
    path_speed=0
    hspeed=0
    vspeed=-mmf_speed(70)
    play_music("")
    inst=play_sound("BrowserBeat1")
    driver_image=12
    timer=10000
    eyes=0
} else {
    visible=false
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase == 1 && driver_image >= 0) {
    draw_sprite_ext(sprWart,driver_image,x,y+wart_y,image_xscale,image_yscale,image_angle,c_white,1)
}
draw_self()

if (phase < 2) {
    draw_sprite_ext(sprPropeller,prop,x,y,image_xscale,image_yscale,image_angle,c_white,1)
} else {
    draw_sprite_ext(sprBowserRocket,prop,x,y,image_xscale,image_yscale,image_angle,c_white,1)
}
if (eyes >= 0) {
    draw_sprite_ext(sprClownCarEyes,eyes,x,y,image_xscale,image_yscale,image_angle,c_white,1)
}
if (driver_image >= 0) {
    if (phase == 0) {
        draw_sprite_ext(sprBowser,driver_image,x,y,image_xscale,image_yscale,image_angle,c_white,1)
    } else if (phase == 2) {
        draw_sprite_ext(sprWily,driver_image,x,y,image_xscale,image_yscale,image_angle,c_white,1)
    }
}


if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,x+pivot_pos_x(24*image_xscale,16*image_yscale,image_angle+180),y+pivot_pos_y(24*image_xscale,16*image_yscale,image_angle+180),0.5,0.5,image_angle-global.boshybowangle*sign(image_xscale),$ffffff,1)
    texture_set_interpolation(0)
}
