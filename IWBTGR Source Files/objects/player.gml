#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
frozen=false
frozen2=false
cutscene=false

//gameover glitch
if (settings("gameover")) {
    invincible=global.invincible
    if (invincible) {
        global.silentgameover=1
        instance_create(0,0,gameOver)
        savedata("legit",0)
    }
}

global.invincible=0

djump=true

dot=(global.char==1)
vic=(global.char==2)
owater=(global.char==3)
boshy=(global.char==4)

physics=settings("physics") || boshy

if (boshy) {
    play_sound_pitch("ItsBOSHYtime",random_range(0.9,1.15))
}

alarm[0]=1

jump=8.5
jump2=7
maxSpeed=3
maxSpeedBoosted=4
maxVspeed=9
grav=0.4

if (owater) {
    physics=0
    jump=10
    maxVspeed=7.5

    for (i=0;i<10;i+=1) if (i!=key_skip) {
        k=keyboard[i]
        if (k==ord("N")) ot1=1
        if (k==ord("O")) ot2=1
        if (k==ord("S")) ot3=1
        if (k==ord("F")) ot4=1
    }
}

if (physics) {
    jump=10
    jump2=8
    maxSpeedBoosted=5
    maxVspeed=9.5
    //note: we don't want game maker to do some stupid rounding errors when the gravity moves you down
    //a whole half pixel down so we use something that's slightly less than that
    grav=0.4999999
    //its dumb but thats the easiest way to fix it
    physics=1
}

if (boshy) {
    jump=11
    jump2=10
    maxVspeed=7
    grav=0.7
}

if (dot) {
    sprite_index=sprDotKid
}

if (owater) sprite_index=sprOwataIdle

if (vic) {
    sprite_index=sprVic
    if (room=rBossRush) y=240
} else gravity=grav

image_speed=0.2

stoned=0
birded=0
carted=0

bowlag=settings("bowlag")
leg=savedata("legit")
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (owater) stop_sound(inst)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.bossrush && vic) {
    if (room=rBowserBoss) x+=64
    if (room=rKraidgiefBoss) y+=128
    if (room=rGraveyard) y-=96
}

if (boshy && global.gastly && !instance_exists(Gastly)) instance_create(x,y,Gastly)

if (boshy) {
    global.boshystretch=2
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///movement

if (boshy) mask_index=sprBoshyMask
else if (dot) mask_index=sprDotKid
else if (vic) mask_index=sprVickVapoRub
else if (physics) mask_index=sprClassicMask
else mask_index=sprMask

if (vic) {
    if (!frozen2 && !frozen && !cutscene) {
        h=global.input_h
        v=global.input_v
    }
    if (cutscene) v=0

    slow=global.key[key_jump]
    if (global.key_pressed[key_jump]) settings("vicseen",1)

    hspeed=h*(4-2*slow)
    if (!place_meeting(x,y,RyuWind))
        vspeed=v*(4-2*slow)

    if (h!=0 && !slow) image_xscale=sign(h)

    if (vicautofire) vicautofire-=1

    if (!frozen && !cutscene && !stoned) {
        if (global.key_pressed[key_shoot] || (global.key[key_shoot] && (!vicautofire || !global.autofireF))) {
            playerShoot()
            vicautofire=16
        }
        if (global.key_pressed[key_back] && (savedata("orb_guy") || room=rDev) && !global.bossrush) {
            x=1200
            y=1632-9
            room_goto(rGuy1)
        }
    }

    if (instance_exists(Cart)) x+=Cart.hspeed
} else {
    v=1

    if (!frozen2) {
        if (!stoned && !owataunt) {
            if (!cutscene && (!vineboost || global.input_h!=0)) h=global.input_h
            if (frozen) h=0
            if (walljumpboost) {
                h=walljumpdir
                walljumpboost-=1
            }

            maxSpeed=3
            if (instance_exists(ArkaPlatform)) if (ArkaPlatform.active) maxSpeed=5

            if (walljumpboost<0) {
                if (!walljump) {
                    //fortress & cart walljumps have different physics from yutu!
                    altj+=1
                    if (altj>=10) {
                        hspeed-=sign(hspeed)
                        altj=0
                    }
                    if (!physics) {
                        //guy has higher gravity, we simulate it during long walljumps for consistency in guy road.
                        vspeed+=0.1
                    }
                    if (boshy) vspeed-=0.3
                    if (abs(hspeed)<4) walljumpboost=0
                } else vspeed-=gravity
            } else if (!birded || h!=0) {
                if (h!=0) {
                    if (!hang) {
                        if (walljumpboost!=0)
                            hspeed=maxSpeedBoosted*h
                        else
                            hspeed=maxSpeed*h
                        image_xscale=h
                        if (boshy) {
                            sprite_index=sprBoshyWalk
                            image_speed=0.2
                        } else if (bowlag) {
                            sprite_index=sprPlayerClassicRun
                            if (owater) image_speed=0.25
                            else image_speed=mmf_animspeed(70,80)
                        } else {
                            sprite_index=sprPlayerRunning
                            if (owater) image_speed=0.25
                            else image_speed=1
                        }

                    }
                } else {
                    hspeed = 0
                    sprite_index=sprPlayerIdle
                    image_speed=0.2
                }
            }
        }

        if (carted) x+=Cart.hspeed
        if (birded) birded-=1
        if (vineboost) vineboost-=1
        if (fished) fished-=1
        if (stoned) {
            stoned-=1
            if (!stoned) {
                play_sound("shatter")
                cutscene=0
            }
        }

        if (onPlatform) {
            if (!place_meeting(x,y+4,platform)) onPlatform=0
        } else {
            if (vspeed<-0.05) {sprite_index=sprPlayerJump image_speed=0 image_index+=0.5 if (image_index>=4) image_index-=2}
            if (vspeed>0.05) {sprite_index=sprPlayerFall image_speed=0.5}
        }

        vspeed=min(vspeed,maxVspeed)

        //in guy, the couch traps work on the principle that the gravity is
        //calculated in a completely different way. to make them work in yutu,
        //we had to bullshit it with this:
        if (vspeed<-8.5 && !physics) {
            if (!global.key[key_jump])
                vspeed+=0.71
            else
                vspeed+=0.1
        }

        if (vspeed<-11 && boshy) {
            if (!global.key[key_jump])
                vspeed+=0.81
        }

        if (!frozen && !cutscene && !stoned && !owataunt) {
            if (global.key_pressed[key_shoot] || (global.key[key_shoot] && !global.autofireF && !owater)) playerShoot()
            if (global.key_pressed[key_jump] && !hang) playerJump(0)

            if (boshy && !instance_place(x,y,RyuWind)) {if (global.key_released[key_jump]) if (vspeed<0) vspeed*=0.6}
            else if (physics) {if (!global.key[key_jump]) if (vspeed<0) vspeed+=0.45}
            else {if (global.key_released[key_jump]) if (vspeed<0) vspeed*=0.45}

            if (owater) {
                if (global.key[key_shoot]) {
                    charnge+=1
                    if (global.autofire && (charnge=4 || charnge=8)) playerShoot()
                    if (charnge=25) inst=play_sound("mmcharge")
                    if (charnge=175) {killPlayer(player) settings("owataseen",1)}
                } else if (charnge) {
                    if (charnge>=25) stop_sound(inst)
                    playerShoot()
                    charnge=0
                }
            }

            if (global.key_pressed[key_back] && (savedata("orb_guy") || room=rDev) && !global.bossrush) {
                x=1200
                y=1632-9
                room_goto(rGuy1)
            }
        }

        if (physics) y-=frac(vspeed)
    }
    if (charnge>=25 && (cutscene || frozen || frozen2 || stoned || owataunt) && !instance_exists(ErrorTrap)) {
        stop_sound(inst)
        charnge=0
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///walljump
if (!vic) {
    hang=0

    //if you think this looks insane, that's because it is. guy walljumps work very differently from yutu walljumps,
    //but since we need to 1. keep yutu physics where possible and 2. make every jump in the game possible,
    //a lot of extra checks were needed to make sure everything worked properly.

    if (distance_to_object(WalljumpL)<2) {
        if (place_free(x,y+2)) {
            hang=1
            vspeed=2
            sprite_index=sprPlayerSliding
            image_xscale=1
        }
        if (hang || place_meeting(x,y,yellowallL) || place_free(x+image_xscale,y+2) || place_free(x-image_xscale,y+2)) {
            if (global.key_pressed[key_right] || (global.key[key_right] && distance_to_object(yellowallL)<2) || global.key_pressed[key_jump]) {
                if (global.key[key_jump]) {
                    sprite_index=sprPlayerJump
                    if (boshy) {
                        vspeed=-12
                        hspeed=8
                        djump=1
                        play_sound("boshywalljump")
                    } else if (physics) {
                        vspeed=-10
                        hspeed=8
                    } else {
                        vspeed=-9
                        hspeed=15
                    }
                    altj=2
                    walljump=2
                    walljumpboost=0
                    if (distance_to_object(WeirdYellowWallL)<2) {
                        walljumpboost=24
                        walljumpdir=1
                    } else if (distance_to_object(yellowallL)<2) {
                        carted=0
                        walljumpboost=-1
                        hspeed=10
                        vspeed=-10
                    } else if (physics) {
                        vineboost=24
                    }
                } else {
                    hspeed=3
                    sprite_index=sprPlayerFall
                }
                hang=0
            }
        }
    }

    if (distance_to_object(WalljumpR)<2) {
        if (place_free(x,y+2)) {
            hang=1
            vspeed=2
            sprite_index=sprPlayerSliding
            image_xscale=-1
        }
        if (hang || place_meeting(x,y,yellowallR) || place_free(x+image_xscale,y+2) || place_free(x-image_xscale,y+2)) {
            if (global.key_pressed[key_left] || (global.key[key_left] && distance_to_object(yellowallR)<2) || global.key_pressed[key_jump]) {
                if (global.key[key_jump]) {
                    sprite_index=sprPlayerJump
                    if (boshy) {
                        vspeed=-12
                        hspeed=-8
                        djump=1
                        play_sound("boshywalljump")
                    } else if (physics) {
                        vspeed=-10
                        hspeed=-8
                    } else {
                        vspeed=-9
                        hspeed=-15
                    }
                    altj=2
                    walljump=2
                    walljumpboost=0
                    if (distance_to_object(WeirdYellowWallR)<2) {
                        walljumpboost=24
                        walljumpdir=-1
                    } else if (distance_to_object(yellowallR)<2) {
                        carted=0
                        walljumpboost=-1
                        hspeed=-10
                        vspeed=-10
                    } else if (physics) {
                        vineboost=24
                    }
                } else {
                    hspeed=-3
                    sprite_index=sprPlayerFall
                }
                hang=0
            }
        }
    }

    if (hang) maxFallSpeed=2
    else maxFallSpeed=8

    if (walljump) {
        //guy's walljumps fire every frame while inside their triggers
        //we mimic that by repeating the sound
        walljump-=1
        if (!boshy) repeat (2) play_sound("jump1")
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///sprite management

if (sprite_index!=oldspr) {
    oldspr=sprite_index
    image_index=0
    if (sprite_index=sprPlayerJump && !bowlag && !boshy) image_index=2
}

if (softlock_count && sprite_index!=sprPlayerJump && sprite_index!=sprPlayerFall) softlock_count-=1

if (stoned) sprite_index=sprPlayerStoned

if (dot) {
    sprite_index=sprDotKid
    if (stoned) sprite_index=sprDotKidStoned
}

if (vic) {
    sprite_index=sprVic
    if (!frozen || !instance_exists(ErrorTrap)) {
        fac=approach(fac,global.input_v*-2,1/8)
        anim=(anim+1/4) mod 2
    }
    image_index=2+fac+5*(anim>1)
}

if (boshy) {
    if (sprite_index==sprBoshyWalk) {}
    else if (sprite_index=sprPlayerJump) {sprite_index=sprBoshyJump image_speed=0 image_index=min(2,image_index)}
    else if (sprite_index=sprPlayerFall) {sprite_index=sprBoshyFall image_speed=0.2}
    else {sprite_index=sprBoshyIdle image_speed=0.1}
    if (stoned) sprite_index=sprBoshyStoned
    boshybow+=0.2
}

if (owater) {
    if (owait) owait-=1
    if (!frozen || !instance_exists(ErrorTrap)) {
        if (charnge>25) if (!(charnge mod 4)) instance_create(x+random_range(-10,10),y-5+random_range(-10,10),OwataParticle)
        if (owatershot) owatershot-=1
    }
    if (sprite_index=sprPlayerIdle) {sprite_index=sprOwataIdle image_index=!!owatershot}
    if (sprite_index=sprPlayerRunning || sprite_index=sprPlayerClassicRun) {sprite_index=sprOwataWalk image_index=(image_index mod 2)+2*!!owatershot}
    if (sprite_index=sprPlayerJump || sprite_index=sprPlayerFall) {sprite_index=sprOwataJump image_index=!!owatershot}
    if (sprite_index=sprPlayerSliding) {sprite_index=sprOwataSlide image_index=!!owatershot}

    if (!frozen || !instance_exists(ErrorTrap)) {
        if (!owait && !owataunt && !cutscene && !stoned && sprite_index=sprOwataIdle) if (!global.key[key_jump] && !global.key[key_shoot] && !global.key[key_left] && !global.key[key_right]) {
            if (keyboard_check_pressed(ord("N")) && !ot1) {owataunt=1 owatimer=0}
            if (keyboard_check_pressed(ord("O")) && !ot2) {owataunt=2 owatimer=0}
            if (keyboard_check_pressed(ord("S")) && !ot3) {owataunt=3 owatimer=0 play_sound("upgrade")}
            if (keyboard_check_pressed(ord("F")) && !ot4) {owataunt=4 owatimer=0}
        }

        if (owataunt) {
            owatimer+=1
            if (owataunt=1) {sprite_index=sprOwataTaunt1 if (owatimer>30) owataunt=0}
            if (owataunt=2) {sprite_index=sprOwataTaunt2 if (owatimer>30) owataunt=0}
            if (owataunt=3) {sprite_index=sprOwataTaunt3 image_index=min(6,owatimer/4) if (owatimer>30) owataunt=0}
            if (owataunt=4) {sprite_index=sprOwataTaunt4 image_index=0 if (owatimer>30) owataunt=0}
            oldspr=sprite_index
        }
    }

    if (stoned) sprite_index=sprOwataStoned
}

if (bowlag) {
    if (irandom(20)) {
        bowx=x
        bowy=y
        if (sprite_index=sprPlayerIdle && floor(image_index)==3) bowy+=1
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///die

if (instance_exists(VicViper)) if (VicViper.active && !VicViper.win) exit

if (vic) {
    with (instance_place(x+hspeed,y+vspeed,playerKiller)) killPlayer(id)
} else {
    with (instance_place(x,y,playerKiller)) killPlayer(id)
}

if (fire=2) {
    instance_create(x,y,partFire)
    if (place_meeting(x,y,objWater) || place_meeting(x,y,objWater2)) fire=0
    if (place_meeting(x,y+1,block)) killPlayer(partFire)
}

global.px=x
global.py=y+8*(!dot && !vic)
#define Collision_platform
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vic) {
    if (v>=0 && y<other.y+4) {
        y=other.y-2
        yprevious=y
        onPlatform=1
    }
} else if (y-vspeed/2<=other.y+8*dot) {
    if (owater && vspeed>0 && other.object_index!=OwataPlatform) {
        djump=true
        with (OwataPlatform) instance_destroy()
    } else if (!owater) djump=1

    if (other.vspeed >= 0){
        yp=y
        y=other.y-9+8*dot
        if (other.vspeed>0) if (!place_free(x,y)) y=yp
        vspeed=other.vspeed
        yprevious=y
    }

    onPlatform=1
    walljumpboost=0
    carted=0

    if (instance_exists(Cart)) if (Cart.p=other.id) carted=1
}
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vic) killPlayer(block)
else {
    if (!place_free(x+hspeed,y)) {
        if (hspeed<=0) move_contact_solid(180,abs(hspeed))
        else move_contact_solid(0,abs(hspeed))
        hspeed=0
        walljumpboost=0
        carted=0
    }

    if (!place_free(x,y+vspeed)) {
        if (vspeed>0) {
            if (boshy) y=floor(y)
            move_contact_solid(270,abs(vspeed))
            carted=0
            djump=1
            with (JumpRefresher) visible=1
            walljumpboost=0
            with (OwataPlatform) instance_destroy()
        } else {
            move_contact_solid(90,abs(vspeed))
        }
        vspeed=0
        if (stoned) hspeed=0
    }

    if (!place_free(x+hspeed,y+vspeed)) {
        hspeed=0
        walljumpboost=0
        carted=0
    }
}
#define Collision_MedusaHead
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//its like a bird, just more intense.
if (vic) killPlayer(MedusaHead)
else {
    stoned=100
    hspeed=random_range(-20,20)
    vspeed=random_range(-10,10)
    play_sound("thud")
}
#define Collision_BIRD
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vic) killPlayer(other.object_index)
else {
    birded=10
    hspeed=random_range(-20,20)
    vspeed=random_range(-10,10)
    djump=0
    other.direction=90
}
#define Collision_FlyGuy
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//it's just a copy of bird

if (vic) killPlayer(other.object_index)
else {
    birded=10
    hspeed=random_range(-20,20)
    vspeed=random_range(-10,10)
    djump=0
    other.direction=90
}
#define Collision_RyuWind
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
////r/Woosh
if (vic) vspeed-=1
else vspeed-=1.5
#define Collision_CartStopper
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//yeah we don't know why these exist either.
//ask kayin.
carted=0
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=1
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
invincible=0
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprPlayerJump) image_index=2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (dot) {
    draw_circle_color(floor(x),floor(y),48,0,merge_color($ff,$c0c0c0,!!stoned),1)
}

if (owater) {
    if (sprite_index=sprOwataIdle || sprite_index=sprOwataStoned) spr=sprOwataIdle2
    if (sprite_index=sprOwataWalk) spr=sprOwataWalk2
    if (sprite_index=sprOwataJump) spr=sprOwataJump2
    if (sprite_index=sprOwataSlide) spr=sprOwataSlide2
    if (sprite_index=sprOwataTaunt1) spr=sprOwataTaunt1b
    if (sprite_index=sprOwataTaunt2) spr=sprOwataTaunt2b
    if (sprite_index=sprOwataTaunt3) spr=sprOwataTaunt3b
    if (sprite_index=sprOwataTaunt4) spr=sprOwataTaunt4b
    draw_sprite_ext(spr,floor(image_index),floor(x),floor(y),image_xscale,image_yscale,image_angle,image_blend,get_room_darkness())
}

draw_sprite_ext(sprite_index,floor(image_index),floor(x),floor(y),image_xscale,image_yscale,image_angle,image_blend,image_alpha)

if (sprite_index=sprOwataTaunt4) {
    f=min(1,2-owatimer/15)
    draw_sprite_ext(sprOwataTaunt4b,1,floor(x),floor(y-4-sqrt(owatimer)*5),image_xscale,image_yscale,image_angle,image_blend,get_room_darkness()*f)
    draw_sprite_ext(sprite_index,1,floor(x),floor(y-4-sqrt(owatimer)*5),image_xscale,image_yscale,image_angle,image_blend,image_alpha*f)
}

if (!bowlag) {
    bowx=floor(x)
    bowy=floor(y)
    if (sprite_index=sprPlayerIdle && floor(image_index)==3) bowy+=1
    if (sprite_index=sprOwataTaunt1) bowx+=-2*image_xscale
    if (sprite_index=sprOwataTaunt2) bowx+=-2*image_xscale
    if (sprite_index=sprOwataTaunt3) bowx+=-3*image_xscale
    if (sprite_index=sprOwataTaunt4) {bowx+=-3*image_xscale bowy+=1}
}

if (room=rCredits && !leg) draw_sprite_ext(sprBow,2+(image_xscale<0),bowx-(6-3*vic)*image_xscale,bowy-9+5*vic+owater*3,image_xscale,1,0,$ffffff,1)
else if (boshy && global.diff==0) draw_sprite_ext(sprBoshyBow,boshybow,bowx-5*image_xscale,bowy-9+floor(image_index)*(sprite_index==sprBoshyIdle),image_xscale,1,0,$ffffff,1)
else if (global.god || settings("godmode")) draw_sprite_ext(sprBow,1,bowx-(6-3*vic)*image_xscale,bowy-9+5*vic,image_xscale,1,0,$ffffff,1)
else if (global.diff==0) draw_sprite_ext(sprBow,owater*4,bowx-(6-3*vic)*image_xscale,bowy-9+5*vic,image_xscale,1,0,$ffffff,1)

if (vic && slow) draw_sprite_ext(sprVickVapoRub,(anim>1),floor(x),floor(y),image_xscale,image_yscale,0,$ffffff,1)
