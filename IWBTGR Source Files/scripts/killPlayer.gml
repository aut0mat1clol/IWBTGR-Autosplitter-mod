///killPlayer(culprit)
var culprit;

culprit=argument[0]
if (culprit>=100000) {
    culprit=culprit.object_index
}

//invincible cheat
if (global.god || settings("godmode")) exit

with (player) {
    if (softlock_count) {
        global.softlocks+=1
        if (global.softlocks==10 && settings("softlock_secret")) {
            if (ask_question(lang("file19"))) {
                restore_backup()
                reset_game()
                global.softlocks=0
            }
        }
    } else global.softlocks=0

    if (invincible) exit
    if (culprit=Metroid || culprit=TourianBarrier || culprit=VicViper) {
        global.silent_gameover=1
    } else {
        if (vic) {
            play_sound("vicdie")
            instance_create(x,y,VicBlood)
        } else {
            if (boshy) {
                quote=irandom(6)
                i=instance_create(floor(x+32),floor(y),BoshyQuote)
                i.image_index=quote
                play_sound_pitch(pick(quote,
                    "SoFuckingClose",
                    "Noho (2)",
                    "GodDamnit (2)",
                    "Fuck (2)",
                    "Damnit (2)",
                    "Awww",
                    "Nyaaa_the_hell"
                ),random_range(0.9,1.15))
                repeat (200) instance_create(x,y,BoshyBlood)
            } else if (owater) {
                if (room=rGuyBoss || settings("resmus")) play_music("")
                else pause_music()
                stop_sound(inst)
                for (i=0;i<8;i+=1) {
                    o=instance_create(x,y,OwataBlood)
                    o.f=3
                    o.speed=8
                    o.direction=i*45
                    o.image_xscale=2
                    o.image_yscale=2
                }
                play_sound("mmdie")
                global.silent_gameover=1

                if (charnge=175) {
                    repeat (20) {
                        o=instance_create(x,y,OwataParticle)
                        o.speed=random_range(6,7)
                        o.direction=random(360)
                    }
                }
            } else {
                if (stoned) {
                    play_sound("thud")
                    play_sound("shatter")
                } else play_sound("splatter")
                instance_create(x,y,bloodEmitter)
            }
        }
    }

    instance_destroy()
    instance_create(0,0,gameOver)

    if (culprit==VicViper) {
        gameOver.alarm[0]=150
    }
    if (culprit==DracGlass) {
        FMODInstanceStop(DraculaIntro.inst)
    }
    if (culprit==ZeldaOldMan) {
        gameOver.alarm[0]=100
        ZeldaOldMan.go=0
        ZeldaOldMan.c=99
        ZeldaOldMan.str="#     GET OFF ME!"
    }
    if (culprit==ZeldaSword) {
        gameOver.alarm[0]=100
        ZeldaOldMan.go=0
        ZeldaOldMan.c=99
        if (settings("slurs"))
            ZeldaOldMan.str="YOU JUMPED INTO A#SWORD. YOU RETARD!"
        else
            ZeldaOldMan.str=" YOU JUMPED INTO A#SWORD. YOU DUMBASS!"
    }
    if (culprit==ZeldaFire) {
        gameOver.alarm[0]=100
        ZeldaOldMan.go=0
        ZeldaOldMan.c=99
        ZeldaOldMan.str=" WHAT ARE YOU DOING?"
    }

    with (MoonBigFall) event_user(0)
    with (MommyThinker) stop=escape

    if (room=rCredits) FMODInstanceStop(EndingController.inst)

    global.death+=1
    savedata("deaths",global.death)
    savedata("time",global.time)
}
