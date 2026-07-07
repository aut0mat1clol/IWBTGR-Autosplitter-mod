#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.char==0) {
    sprite_index=sprPlayerClassicRun
    image_speed=mmf_animspeed(70,80)
} else if (global.char==1) {
    sprite_index=sprDotKid
    y+=8
    dot=1
} else if (global.char==2) {
    sprite_index=sprVic
    image_speed=0
    image_index=2
    vic=1
} else if (global.char==3) {
    sprite_index=sprOwataWalk
    image_speed=0.25
    owater=1
} else if (global.char==4) {
    sprite_index=sprBoshyWalk
    image_speed=0.2
    boshy=1
}

image_xscale=-1
speed=-mmf_speed(1)

bowlag=settings("bowlag")
leg=savedata("legit")
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (vic) {
    sprite_index=sprVic
    fac=approach(fac,global.input_v*-2,1/8)
    anim=(anim+1/4) mod 2
    image_index=2+fac+5*(anim>1)
}

if (active) {
    if (instance_exists(player)) {
        x=player.x
        y=player.y
        image_xscale=player.image_xscale
    } else {
        vspeed+=0.4
        if (place_meeting(x,y+vspeed,block)) {
            move_outside_solid(90,10)
            move_contact_solid(270,10)
            y+=9
            vspeed=0
        }
    }
} else {
    if (bowlag) {
        if (irandom(20)) {
            bowx=floor(x)
            bowy=floor(y)
            if (sprite_index=sprPlayerIdle && floor(image_index)==3) bowy+=1
        } else bowx=floor(x+1)
    }
}

if (owater) {
    image_index=(image_index mod 2)+2
    player.owatershot=20
    with (OwataPlatform) depth=-1013
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite_ext(sprTheGun,0,floor(x)+10*image_xscale,floor(y)-13,1,image_xscale,90,$ffffff,1)
if (!active) {
    draw_sprite_ext(sprite_index,floor(image_index),floor(x),floor(y),image_xscale,1,0,$ffffff,1)

    if (!bowlag) {
        bowx=floor(x)
        bowy=floor(y)
        if (sprite_index=sprPlayerIdle && floor(image_index)==3) bowy+=1
    }

    boshybow+=0.2

    if (!leg) draw_sprite_ext(sprBow,2+(image_xscale<0),bowx-(6-3*vic)*image_xscale,bowy-9+5*vic+owater*3,image_xscale,1,0,$ffffff,1)
    else if (boshy && global.diff==0) draw_sprite_ext(sprBoshyBow,boshybow,bowx-5*image_xscale,bowy-9,image_xscale,1,0,$ffffff,1)
    else if (global.god || settings("godmode")) draw_sprite_ext(sprBow,global.god || settings("godmode"),bowx-(6-3*vic)*image_xscale,bowy-9+5*vic,image_xscale,1,0,$ffffff,1)
    else if (global.diff==0) draw_sprite_ext(sprBow,owater*4,bowx-(6-3*vic)*image_xscale,bowy-9+5*vic,image_xscale,1,0,$ffffff,1)
    if (dot) {
        draw_circle_color(floor(x),floor(y),48,0,merge_color($ff,$c0c0c0,!!stoned),1)
    }
}
