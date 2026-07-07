#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=5.5
image_yscale=5.5
image_index=1
image_speed=0
nonstick=true
timer=0
hitbox=instance_create(x,y,KGHitbox)
eyebox=instance_create(x,y,KGEyebox)
vuln=false
intro=true
roar_offset=0
walk_right=false
phase=0
walk_counter=0
rng=-1
rng2=-1
transition=false
damage=0
eye_damage=0
eye_damage_max=0
blankas=0
fire_down=false
with (spikeUp) depth=900
text=false

devkey=true
for (i=0;i<10;i+=1) if (world.keyboard[i]==ord("K")) devkey=false
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
cameraKraid.piledriver=false
cameraKraid.locked=false

defeat_bossrush("kraidgief")
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///stop roaring
if (!frozen) {
    vuln=false
    image_index=1
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (frozen) exit

if (intro) {
    if (timer==50) {
        play_music("Battle 3")
        vspeed=-mmf_speed(8)
    }
    if (timer>=50) {
        if (timer mod 10 == 0) {
            cameraKraid.voffset=3
            play_sound("earthquaketest (2)")
            instance_create(0,0,KraidgiefDebrisSpawner)
        } else {
            cameraKraid.voffset=15
        }
        if (skipButton()) y=384
    }
    if (y<=384) {
        y=384
        vspeed=0
        timer=2000
        intro=false
    }
} else if (phase==0) {
    if (timer==2020) {
        image_index=0
        vuln=true
        play_sound("kraidgiefroar")
        alarm[0]=80
    } else if (timer==2150) {
        hspeed=mmf_speed(41)
        if (!walk_right && !transition) hspeed=-hspeed
        image_index=0
        image_speed=mmf_animspeed(30)
        if (walk_right && !transition) walk_counter+=1
    }
    if (!transition) {
        if (floor(image_index)==2 && frac(image_index)<image_speed && (sprite_index==sprKraidgiefChop || sprite_index==sprKraidgiefPunch)) {
            cameraKraid.voffset=15
            play_sound("earthquaketest (2)")
            instance_create(0,0,KraidgiefDebrisSpawner)
        }
        if (timer==20050) {
            if (rng==0) {
                sprite_index=sprKraidgiefChop
            } else {
                sprite_index=sprKraidgiefPunch
            }
            image_index=0
            image_speed=0
        } else if (timer==20100) {
            if (rng==0) {
                image_index=1
            }
            image_speed=mmf_animspeed(10)
        } else if (timer==20200) {
            sprite_index=sprKraidgiefWalk
            image_index=1
            image_speed=0
            walk_right=false
            timer=2019
        }
    } else {
        if (x>256) {
            x=256
            hspeed=0
            vspeed=-mmf_speed(20)
            sprite_index=sprKraidgiefLariet
            image_index=0
            image_speed=mmf_animspeed(50)
            timer=500000
        }
        if (sprite_index==sprKraidgiefLariet) {
            if (timer mod 2 == 0) cameraKraid.voffset=15
            with (KraidgiefCeiling) if (place_meeting(x,y,other)) {
                instance_destroy()
            }
            var max_alarm;
            max_alarm=0
            with (KraidgiefDebrisSpawner) if (alarm[0]>max_alarm) max_alarm=alarm[0]
            if (max_alarm<40) {
                play_sound("earthquaketest (2)")
                instance_create(0,0,KraidgiefDebrisSpawner)
            }
        }
        if (y<64) {
            play_sound("earthquaketest (2)")
            instance_create(0,0,KraidgiefDebrisSpawner)
            with (KraidgiefCeiling) instance_destroy()
            y=64
            vspeed=0
            phase=1
            sprite_index=sprKraidgiefWalk
            image_index=0
            image_speed=0
            alarm[0]=60
            vuln=true
            timer=600000
            play_sound("kraidgiefroar")
            transition=false
            cameraKraid.locked=false
            walk_counter=0
        }
    }
} else if (phase==1) {
    if (timer==600100) {
        if (x-global.px<150) {
            rng=irandom(3)+1+walk_counter
        } else {
            rng=-100
            eye_damage_max=100
        }
    } else if (timer==600120 && rng>=-10 && rng<6) {
        eye_damage_max=walk_counter
        walk_counter+=1
    } else if (timer==600125 && rng<6) {
        image_speed=mmf_animspeed(30)
        hspeed=mmf_speed(41)
        if (eye_damage>eye_damage_max) {
            eye_damage=0
        } else {
            hspeed=-hspeed
        }
    } else if (timer==600120 && rng>5) {
        rng2=irandom(2)+1
        walk_counter=0
        play_sound("kraidgiefroarfast")
    } else if (timer==600125 && rng2==1) {
        sprite_index=sprKraidgiefChargeUp
    } else if (timer==600150 && rng2==1) {
        sprite_index=sprKraidgiefWalk
        image_index=0
        image_speed=mmf_animspeed(60)
        hspeed=-mmf_speed(30)
    } else if (timer==600250 && rng2==1) {
        hspeed=mmf_speed(30)
    } else if (timer==600125 && rng2==2) {
        sprite_index=sprKraidgiefHeadbutt
        image_index=0
        image_speed=0
        hspeed=-mmf_speed(10)
    } else if (timer==600155 && rng2==2) {
        // adjust for wonky origins in headbutt animation
        x+=2
        y-=16
    } else if (timer==600165 && rng2==2) {
        x-=10
        y-=85
        image_speed=mmf_animspeed(10)
        image_index+=image_speed
    } else if (timer==600175 && rng2==2) {
        x+=8
        y+=101
    } else if ((timer==600140 || timer==600240 || timer==600340) && rng2==3) {
        image_index=0
        vuln=true
        alarm[0]=60
        play_sound("kraidgiefroar")
        // spawns at action point but we know where it is here
        instance_create(x+311,y+150,KGHadouken)
    } else if ((timer==600150 || timer==600250) && rng2==3) {
        vuln=false
        image_index=1
        alarm[0]=-1
    } else if (timer==600350 || timer==600420) {
        hspeed=0
        sprite_index=sprKraidgiefWalk
        image_index=0
        image_speed=0
        vuln=true
        play_sound("kraidgiefroar")
        alarm[0]=60
    } else if (timer==600500) {
        timer=600000
        rng2=-1
    } else if (timer==600050 && x<=-64) {
        if (!instance_exists(player)) {
            timer=600410
        } else {
            play_music("")
            sprite_index=sprKraidgiefGrab
            image_index=0
            image_speed=mmf_animspeed(1)
            phase=3
            play_sound("kraidgiefroarfast")
            timer=-5000
        }
    }
} else if (phase==2) {
    if (timer==900050) {
        play_sound("kraidgiefroar")
        hspeed=-mmf_speed(20)
        sprite_index=sprKraidgiefWalk
        image_speed=mmf_animspeed(60)
    }
    if (hspeed<0) {
        var make_particle;
        make_particle=false
        with (blockTrapDestructible) if (place_meeting(x,y,other)) {
            make_particle=true
            instance_destroy()
        }
        if (make_particle) {
            play_sound("earthquaketest (2)")
            instance_create(0,0,KraidgiefDebrisSpawner)
        }
    }
    if (x<150) {
        play_sound("earthquaketest (2)")
        instance_create(0,0,KraidgiefDebrisSpawner)
        with (blockTrapDestructible) instance_destroy()
        x=150
        hspeed=0
        sprite_index=sprKraidgiefAngryStand
        vuln=true
        play_sound("kraidgiefroarfast")
        timer=900500
    }
    if (timer==900600 && blankas<5) {
        play_sound("kraidgiefroar")
        blankas+=1
        timer=900300
        if (player.bbox_bottom>=560) {
            instance_create(x+226,y+506,Blanka)
        } else if (player.bbox_bottom>=462) {
            instance_create(x+429,y+410,Blanka)
        } else if (player.bbox_bottom>=368) {
            instance_create(x+355,y+318,Blanka)
        } else if (player.bbox_bottom>=272) {
            instance_create(x+252,y+231,Blanka)
        }
    }
    if (timer==900601) {
        play_sound("kraidgiefroarfast")
        fire_down=player.bbox_bottom>350
    }
    if (timer==900700) {
        play_sound("kraidgiefroarfast")
        play_sound("paintboom")
        if (fire_down) {
            instance_create(x+252,y+273,KGFireDown)
        } else {
            instance_create(x+252,y+273,KGFireSide)
        }
        sprite_index=sprKraidgiefFire
        image_speed=mmf_animspeed(50)
    }
    if (timer>900700 && !instance_exists(KGFireDown) && !instance_exists(KGFireSide)) {
        blankas=0
        sprite_index=sprKraidgiefAngryStand
        timer=900300
    }
} else if (phase==3) {
    // grabby hands
    if (timer > -6500 && image_index+image_speed>=1) {
        image_index=1
        image_speed=0
        with (player) instance_destroy()
        timer=-8000
        cameraKraid.piledriver=true
    }
    if (timer==-7995) play_music("FatalOK")
    if (timer==-7950) {
        play_sound("hskspd")
        text=true
    }
    if (timer==-7750) {
        text=false
        sprite_index=sprKraidgiefSPD
        image_index=0
        image_speed=mmf_animspeed(50)
        speed=mmf_speed(100)
        direction=mmf_direction(7)
    }
    if (timer==-7600) {
        direction=mmf_direction(25)
    }
    if (sprite_index==sprKraidgiefSPD && image_index<image_speed) {
        play_sound("swosh")
    }
    if (timer==-7430) {
        sprite_index=sprKraidgiefShit
        speed=0
        play_sound("metal2short")
        play_sound("earthquaketest (2)")
        instance_create(0,0,KraidgiefDebrisSpawner)
        global.silent_gameover=true
        if (global.char==2) {
            play_sound("vicdie")
            instance_create(x+178-7,y+50+157,VicBlood)
        } else if (global.char==3) {
            for (i=0;i<8;i+=1) {
                o=instance_create(x+178-7,y+50+157,OwataBlood)
                o.f=3
                o.speed=8
                o.direction=i*45
                o.image_xscale=2
                o.image_yscale=2
            }
            play_sound("mmdie")
        } else {
            play_sound("splatter")
            instance_create(x+178-7,y+50+157,bloodEmitter)
        }
        global.death+=1
        instance_create(0,0,gameOver)
    }
} else if (phase==4) {
    // dead
    if (timer==1000050) {
        instance_create(x+535,y+200,KGFireSide)
        play_sound("earthquaketest (2)")
        instance_create(0,0,KraidgiefDebrisSpawner)
        play_sound("kraidgiefroar")
    }
    if (timer>1000050) {
        vspeed=mmf_speed(20)
        sprite_index=sprKraidgiefDying
    }
    if (timer==1000200) {
        instance_create(x+559,y+288,KGFireSide)
        play_sound("earthquaketest (2)")
        instance_create(0,0,KraidgiefDebrisSpawner)
    }
    if (timer==1000205) {
        instance_create(x+540,y+544,KGFireSide)
        play_sound("earthquaketest (2)")
        instance_create(0,0,KraidgiefDebrisSpawner)
        play_sound("kraidgiefroarfast")
    }
    if (timer==1000210) {
        instance_create(x+551,y+154,KGFireSide)
        with (spikeUp) instance_destroy()
        with (Blanka) instance_destroy()
        play_sound("earthquaketest (2)")
        instance_create(0,0,KraidgiefDebrisSpawner)
        play_sound("kraidgiefroarfast")
        instance_destroy()
        exit
    }
}

if (x<-64) {
    hspeed=0
    x=-64
    walk_right=true
}

if (((vuln && sprite_index==sprKraidgiefWalk) || sprite_index==sprKraidgiefShit) && timer mod 2 == 0) {
    roar_offset=!roar_offset // flip between 0 and 1
} else { roar_offset=0 }

var action_ok, action_x, action_y;
action_ok=true
switch (sprite_index) {
case sprKraidgiefWalk: switch (floor(image_index)) {
    case 0: action_x=311 action_y=179 break
    case 1: action_x=310 action_y=151 break
    case 2: action_x=310 action_y=123 break
    case 3: action_x=310 action_y=151 break
    case 4: action_x=310 action_y=172 break
} break
case sprKraidgiefAngryStand: action_x=134+150 action_y=123+120 break
case sprKraidgiefFire: switch (floor(image_index)) {
    case 0: action_x=132+150 action_y=124+120 break
    case 1: action_x=134+150 action_y=117+120 break
}
default: action_ok=false break
}

action_x+=x
action_y+=y

if (action_ok) {
    hitbox.x=action_x
    hitbox.y=action_y
    eyebox.x=action_x
    eyebox.y=action_y
} else {
    hitbox.x=-400
    eyebox.x=-400
}


hitbox.visible=false
eyebox.visible=false
if (vuln) {
    var culprit;
    with (hitbox) culprit=instance_place(x,y,bullet)
    with (culprit) {
        other.damage+=damage
        other.hitbox.visible=true
        play_sound("hit")
        instance_destroy()
    }
    if (phase<1 && damage>=15) transition=true
    if (phase<2 && damage>=25) {
        timer=900000
        phase=2
        alarm[0]=-1
        with (eyebox) instance_destroy()
    }
    if (phase==2 && damage>=120) {
        phase=4
        timer=1000000
        with (Blanka) xspeed=0
        play_music("")
    }
}

if (phase==1) {
    with (eyebox) culprit=instance_place(x,y,bullet)
    with (culprit) {
        other.eyebox.visible=true
        other.eye_damage+=damage
        play_sound("thud")
        instance_destroy()
    }
}

timer+=1
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!frozen && other.vspeed==0) {
    other.direction=choose(45,90,135,-45,-90,-135)
    play_sound("click")
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index==sprKraidgiefWalk && image_speed=mmf_animspeed(30)) {
    image_index=1
    image_speed=0
    hspeed=0
    play_sound("earthquaketest (2)")
    instance_create(0,0,KraidgiefDebrisSpawner)
    if (phase==0) {
        cameraKraid.voffset=15
        timer=2060
        if (walk_counter>=2) {
            timer=20000
            walk_counter=0
            rng=irandom(1)
        }
    } else if (phase==1) {
        timer=600000
        with (KraidgiefFallingSpike) if (irandom(11)==0) active=true
    }
}
if (sprite_index==sprKraidgiefChop) {
    sprite_index=sprKraidgiefWalk
    image_index=1
    image_speed=0
}
if (sprite_index==sprKraidgiefPunch) {
    image_index=2
}
if (sprite_index==sprKraidgiefHeadbutt) {
    timer=600320
    sprite_index=sprKraidgiefWalk
    image_index=1
    image_speed=0
    hspeed=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var spr, ind;

y+=roar_offset
spr=sprPlayerFall
ind=0

if (global.char==1) spr=sprDotKid
if (global.char==2) {spr=sprVic ind=2 ang=90}
if (global.char==3) spr=sprOwataJump
if (global.char==4) spr=sprBoshyJump

var kid_x,kid_y;
if (sprite_index==sprKraidgiefGrab && image_index>=1) {
    kid_x=x+111
    kid_y=y+317
} else if (sprite_index==sprKraidgiefSPD) {
    if (floor(image_index)==0) {
        kid_x=x+100
        kid_y=y+132
    } else if (floor(image_index)==1) {
        kid_x=x+257
        kid_y=y+216
    } else if (floor(image_index)==2) {
        kid_x=x+688
        kid_y=y+132
    } else {
        kid_y=-999
    }
}

if ((sprite_index==sprKraidgiefGrab && image_index>=1) || sprite_index==sprKraidgiefSPD) {
    if (spr==sprOwataJump) draw_sprite_ext(sprOwataJump2,ind,kid_x,kid_y,1,1,ang,$ffffff,get_room_darkness())
    draw_sprite_ext(spr,ind,kid_x,kid_y,1,1,ang,$ffffff,1)
}

with (KGHitbox) event_user(0)
with (KGEyebox) event_user(0)

draw_sprite_ext(sprite_index,floor(image_index),floor(x)+0.25,floor(y)+0.25,image_xscale,image_yscale,image_angle,image_blend,image_alpha)

with (KGHitbox) event_user(0)
with (KGEyebox) event_user(0)

if (global.char==4 && global.diff==0) {
    texture_set_interpolation(1)
    if (sprite_index==sprKraidgiefWalk) oy=abs(2-floor(image_index))*4 else oy=0
    if (sprite_index==sprKraidgiefLariet) ox=16 else ox=0
    if (sprite_index==sprKraidgiefAngryStand || sprite_index=sprKraidgiefFire) oy=18
    if (sprite_index==sprKraidgiefHeadbutt && image_index>=2) {ox=-64 oy=28}
    draw_sprite_ext(sprBoshyEzBossBow,0,x+(65+ox)*image_xscale,y+(18+oy)*image_yscale,0.75,0.75,global.boshybowangle,$ffffff,1)
    texture_set_interpolation(0)
}

y-=roar_offset
if (text) {
    draw_sprite(sprHokutoNoKen,0,view_xview[0]+400,view_yview[0]+608-24)
}
#define KeyPress_75
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (devkey && phase!=4 && !global.bossrush) {
    if (settings("kraidgief")) {
        damage+=5
        play_sound("hit")

        if (damage>=120) {
            intro=0
            phase=4
            timer=1000000
            with (Blanka) xspeed=0
            play_music("")
        }
    } else if (!instance_exists(ErrorTrap)) instance_create(0,0,ErrorTrap)
}
