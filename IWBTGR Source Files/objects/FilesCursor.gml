#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0.5
char=0

boshybow=0
selected=0
mem=0
file=0
owatershot=0
charnge=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.key_pressed[key_reset] && !visible) {
    visible=1
}

boshybow+=0.2

if (!OptsButton.image_index && visible) {
    if (!selected) {
        if (global.input_h!=mem) {
            if (global.input_h=1) {file=modulo(file+1,0,3) play_sound("click")}
            if (global.input_h=-1) {file=modulo(file-1,0,3) play_sound("click")}
        }
        mem=global.input_h
    }

    if (global.key_pressed[key_jump]) {
        if (selected) {
            with (FilesDataHolder) event_user(0)
        } else {
            selected=1
            select_save(file+1)
            if (!file_exists(global.savefile)) {
                if (file_exists(global.backupfile)) {
                    if (ask_question(lang("file18"))) {
                        restore_backup(file+1)
                        with (FilesDataHolder) if (FilesCursor.file+1==i) alarm[0]=1
                    }
                }
            }
            play_sound("click")
        }
    }
}

if (file=0) x=approach(x,127,16)
if (file=1) x=approach(x,391,16)
if (file=2) x=approach(x,647,16)

with (FilesDataHolder) if (i=other.file+1) {
    other.char=char
    other.leg=leg
    other.med=!diff
}

if (char==0) {
    if (!settings("bowlag")) {
        sprite_index=sprPlayerRunning
        image_speed=0.5
    } else {
        sprite_index=sprPlayerClassicRun
        image_speed=mmf_animspeed(70,80)
    }
    y=ystart
}

dot=0
vic=0
owater=0
boshy=0

if (char==1) {sprite_index=sprDotKid dot=1 y=ystart+8 image_speed=0.5}
if (char==2) {sprite_index=sprVic vic=1 y=ystart image_speed=0 image_index=2 anim=(anim+1/4) mod 2 image_index=2+fac+5*(anim>1)}
if (char==3) {sprite_index=sprOwataWalk owater=1 y=ystart image_speed=0.25 image_index=image_index mod 2+2*!!owatershot}
if (char==4) {sprite_index=sprBoshyWalk boshy=1 y=ystart image_speed=0.2}

if (global.key_pressed[key_shoot] && visible) {
    if (selected) {
        selected=0
        with (FilesDataHolder) confirm=0
        play_sound("click")
    } else if (!OptsCtrl.visible) if (instance_number(bullet)<4) {
        if (char=2) {
            instance_create(x,y,bullet)
            play_sound("vicshoot")
        } else if (char=3) {
            instance_create(x,y-4,bullet)
            play_sound("fire3")
            owatershot=20
        } else {
            instance_create(x,y-2,bullet)
            play_sound("fire2")
        }
    }
}

if (owatershot) owatershot-=1

if (global.key[key_shoot] && char=3) {
    if (charnge>25) if (!(charnge mod 4)) instance_create(x+random_range(-10,10),y-5+random_range(-10,10),OwataParticle)

    charnge+=1
    if (charnge=25) inst=play_sound("mmcharge")
    if (charnge=175) {
        visible=0
        sleep(300)
        for (i=0;i<8;i+=1) {
            o=instance_create(x,y,OwataBlood)
            o.f=3
            o.speed=8
            o.direction=i*45
            o.image_xscale=2
            o.image_yscale=2
        }
        repeat (20) {
            o=instance_create(x,y,OwataParticle)
            o.speed=random_range(6,7)
            o.direction=random(360)
        }
        play_sound("mmdie")
    }
} else {
    if (charnge>25) stop_sound(inst)
    if (charnge>75 && visible) {
        i=instance_create(x,y-4,bullet)
        i.sprite_index=sprOwataBullet
        i.image_speed=0
        i.image_index=1
        owatershot=20
        play_sound("fire4")
    }
    charnge=0
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

if (!leg) draw_sprite_ext(sprBow,2,x-(6-3*vic)*image_xscale,y-9+5*vic+owater*3,image_xscale,1,0,$ffffff,1)
else if (med) {
    if (boshy) draw_sprite_ext(sprBoshyBow,boshybow,x-5*image_xscale,y-9,image_xscale,1,0,$ffffff,1)
    else draw_sprite_ext(sprBow,(char==3)*4,x-(6-3*vic)*image_xscale,y-9+5*vic,image_xscale,1,0,$ffffff,1)
}

if (!OptsButton.image_index) {
    draw_sprite_stretched(sprFileBorder,0,32+8*(file)*32,128,192,352)
}

if (char==1) {
    draw_circle_color(floor(x),floor(y),48,0,merge_color($ff,$c0c0c0,!!stoned),1)
}
