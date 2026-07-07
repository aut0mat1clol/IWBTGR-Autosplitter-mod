#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=40
image_yscale=40
mouth_index=0
mouth_moving=true
phase=0
rng=-1
instance_create(xstart+20,ystart+146,GuyMouth)
inst=-1
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///pain animation

if (x==xstart+10) {
    x-=8
    y+=5
} else if (x==xstart+2) {
    x-=6
    y+=16
} else {
    x=xstart+10
    y=ystart-10
}
alarm[0]=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase==0) {
    // start this animation a little earlier otherwise it doesn't sync for some reason
    if (timer==200-7) {GlAsshole.image_speed=mmf_animspeed(15) GlAsshole.image_index=1}
    if (timer==240) {FMODInstanceStop(TheGun.inst) play_music("contra")}
    if (timer==280) {
        with (TheGun) instance_destroy()
        player.cutscene=false
        player.y+=608
        player.yprevious+=608
        view_yview[0]+=608
        inst=play_sound("aaaa 3")
        play_sound("shatter")
        play_sound("break")
        Geye.image_index=0
        Geye.image_speed=mmf_animspeed(20)
        GuyMouth.image_index=1
        with (GlAsshole) instance_destroy()
        xx[0]=248
        xx[1]=746
        xx[2]=634
        xx[3]=337
        xx[4]=605
        xx[5]=566
        xx[6]=158
        xx[7]=405
        xx[8]=709
        xx[9]=313
        yy[0]=1005
        yy[1]=980
        yy[2]=973
        yy[3]=749
        yy[4]=756
        yy[5]=923
        yy[6]=895
        yy[7]=962
        yy[8]=1022
        yy[9]=1083
        for (i=0;i<10;i+=1) {
            with (instance_create(xx[i],yy[i],DestroyedBlock)) {
                l=32
                t=448
                speed=mmf_speed(100)
                direction=random(360)
            }
        }
    }
    if (timer==390) {
        with (Geye) {
            image_index=0
            image_speed=0
            vuln=1
        }
        GuyMouth.image_index=0
    }
    if (timer==450) {
        inst=play_sound("destroy2")
        GuyMouth.image_index=2
    }
    if (timer==600 || timer==800 || timer==1000) {
        with (Geye) {
            if (vuln) {
                with (instance_create(x,y,GuyShot)) move_towards_point(global.px,global.py,mmf_speed(50))
            }
        }
    }
    if (timer==1300) {
        instance_create(105,1129,GuyToothShooter)
        with (GuyTooth) instance_destroy()
        GuyMouth.moving=false
        for (i=306;i<=498;i+=32) {
            instance_create(i,1141,GuyTooth)
        }
    }
    if (timer==1500) timer=590
} else if (phase==1) {
    if (timer==1505) Geye.reverse=true
    if (timer==1515) {
        Geye.sprite_index=sprGeyeNuts
        Geye.image_speed=mmf_animspeed(20)
        GuyMouth.image_index=1
        GuyMouth.moving=true
        event_perform(ev_alarm,0) // shake animation
        inst=play_sound("aaaa 3")
    }
    if (timer==1550) {
        Geye.image_index=0
        Geye.image_speed=0
        GuyMouth.image_index=0
        alarm[0]=-1
        x=xstart
        y=ystart
    }
    if (timer==1700) {
        GuyMouth.image_index=2
        inst=play_sound("crushbones")
    }
    if (timer==1850) {
        with (Geye) {
            look_at_player=false
            image_speed=mmf_animspeed(20)
            if (global.px>=3584) {
                direction=point_direction(xstart,ystart,global.px,global.py+9+50)
            } else {
                direction=point_direction(xstart,ystart,global.px,global.py+9-60)
            }
            direction=round(direction*8/90)*90/8
            event_perform(ev_alarm,0)
            alarm[1]=25
        }
    }
    if (timer==2000) {
        GuyMouth.image_index=2
        inst=play_sound("escape")
    }
    if (timer==2500) {
        with (Geye) {
            vuln=true
            alarm[0]=-1
            alarm[1]=-1
        }
    }
    if (timer==2520) {
        play_sound("fire")
        with (Geye) with (instance_create(x,y,GuyShot)) move_towards_point(56,1059,mmf_speed(100))
        with (Geye) with (instance_create(x,y,GuyShot)) move_towards_point(757,1059,mmf_speed(100))
    }
    if (timer==2540) {
        instance_create(16,1064,GuyPersistentFirePillar)
        instance_create(48,1064,GuyPersistentFirePillar)
        instance_create(80,1064,GuyPersistentFirePillar)
        instance_create(720,1064,GuyPersistentFirePillar)
        instance_create(752,1064,GuyPersistentFirePillar)
        instance_create(784,1064,GuyPersistentFirePillar)
        Geye.look_at_player=true
        Geye.image_index=0
        Geye.image_speed=0
    }
    if (timer==2599) {
        with (Geye) {
            (instance_create(x,y,GuyGlassShot)).eye=id
        }
    }
    if (timer==2800 || tiemr==2900 || timer==3000) {
        with (Geye) {
            if (vuln) {
                with (instance_create(x,y,GuyShot)) move_towards_point(global.px,global.py,mmf_speed(50))
            }
        }
        play_sound("fire")
    }
    if (timer==3200) {
        rng=irandom(1)
    }
    if (timer==3201 && rng==0) {
        direction=point_direction(xstart+20,ystart+146,global.px,global.py)
    }
    if (timer>=3201 && rng==0 && (timer mod 3) == 0) {
        with (instance_create(xstart+20,ystart+146,GuyShot)) {
            speed=mmf_speed(20)
            direction=other.direction
        }
    }
    if (timer==3202 && rng==1) {
        (instance_create(-321,1135,GuyToothShooter)).hspeed=mmf_speed(80)
        with (GuyTooth) instance_destroy()
        GuyMouth.moving=false
        for (i=306;i<=498;i+=32) {
            instance_create(i,1141,GuyTooth)
        }
    }
    if (timer==3400) {
        timer=2600
    }
} else if (phase==2) {
    if (timer==3505) with (Geye) reverse=true
    if (timer==3515) {
        Geye.sprite_index=sprGeyeNuts
        Geye.image_speed=mmf_animspeed(20)
        GuyMouth.image_index=1
        GuyMouth.moving=true
        event_perform(ev_alarm,0) // shake animation
        inst=play_sound("aaaa 3")
    }
    if (timer==3550) {
        Geye.image_index=0
        Geye.image_speed=0
        GuyMouth.image_index=0
        alarm[0]=-1
        x=xstart
        y=ystart
        with (instance_create(xstart+20,ystart+146,GuyShot)) {
            speed=mmf_speed(100)
            direction=mmf_direction(24)
        }
        with (instance_create(xstart+20,ystart+146,GuyShot)) {
            speed=mmf_speed(100)
            direction=mmf_direction(22)
        }
        with (instance_create(xstart+20,ystart+146,GuyShot)) {
            speed=mmf_speed(100)
            direction=mmf_direction(26)
        }
        for (i=112;i<=688;i+=32) {
            instance_create(i,1185,GuyPersistentFirePillar)
        }
    }
    if (timer==3700) {
        GuyMouth.image_index=2
        if (global.char==4) inst=play_sound("yesidid") else inst=play_sound("---sex-")
        with (Geye) vuln=true
        with (Guybrow) event_user(0)
    }
    if (timer==3800) {
        play_sound("fire")
        with (Geye) {
            if (vuln) {
                with (instance_create(x,y,GuyShot)) {
                    move_towards_point(global.px,global.py,mmf_speed(30))
                }
            }
        }
    }
    if (timer==3900) {
        play_sound("fire")
        (instance_create(-321,1129,GuyToothShooter)).hspeed=mmf_speed(100)
        instance_create(370,1141,GuyTooth)
        instance_create(466,1141,GuyTooth)
    }
    if (timer==4000) {
        play_sound("fire")
        with (Geye) {
            if (vuln) {
                with (instance_create(x,y,GuyShot)) {
                    move_towards_point(global.px,global.py,mmf_speed(30))
                }
            }
        }
        timer=3700
    }
} else if (phase==3) {
    if (timer==4515) {
        GuyMouth.image_index=1
        event_perform(ev_alarm,0) // shake animation
        inst=play_sound("nono")
    }
    if (timer==4550) {
        with (Geye) instance_destroy()
        with (Guybrow) instance_destroy()
        with (GuyMouth) instance_destroy()
        instance_create(global.px,global.py,KidSpin)
        with (player) instance_destroy()
    }
    if (timer>4550 && visible) {
        if (image_xscale<=5) {
            visible=false
        } else {
            image_xscale-=5
            image_yscale-=5
        }
    }
    if (timer==4570) {
        defeat_bossrush("guy")
    }
    if (timer==4650) {
        room_goto(rEnding)
    }
}

if (active) timer+=1
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inst!=-1) FMODInstanceStop(inst)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
if (timer>=4550) {
    draw_sprite_ext(sprGuyBlood,0,x,y,image_xscale/40,image_yscale/40,0,c_white,1)
}

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    draw_sprite_ext(sprBoshyEzBossBow,0,x+5*image_xscale,y-3*image_yscale,1,1,global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}
