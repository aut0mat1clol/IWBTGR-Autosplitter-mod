#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
alarm[0]=10+x/32

thumb=0
image_speed=0.5

loading=1
char=0
leg=1
diff=0
confirm=0

for (j=0;j<8;j+=1) {
    orb[j]=0
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
select_save(i)
read_save()

death=string(savedata("deaths"))
time=time_str(savedata("time"))
diff=savedata("diff")
char=savedata("char")

diffstr=lang("file7")
if (diff=1) diffstr=lang("file8")
if (diff=2) diffstr=lang("file9")
if (diff=3) diffstr=lang("file10")

orb[0]=savedata("orb_tyson")
orb[1]=savedata("orb_bowser")
orb[2]=savedata("orb_dracula")
orb[3]=savedata("orb_dragon")
orb[4]=savedata("orb_mother")
orb[5]=savedata("orb_birdo")
orb[6]=savedata("orb_kraidgief")
orb[7]=savedata("orb_guy")

leg=savedata("legit")

thumb=0

if (file_exists(global.saveimg)) {
    thumb=background_add(global.saveimg,0,0)
} else {
    //1.0 compatibility
    if (file_exists(filename_change_ext(global.saveimg,".bmp"))) {
        thumb=background_add(filename_change_ext(global.saveimg,".bmp"),0,0)
    } else {
        if (file_exists(global.savefile)) thumb=-1
    }
}

select_save(0)
read_save()

loading=0
sel=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (FilesCursor.selected && FilesCursor.file+1==i) {
    v=0
    if (global.input_v!=0) {
        if (!lockv) {
            v=global.input_v
            play_sound("click")
        }
        lockv=1
    } else lockv=0

    blank=(!loading && thumb==0)
    if (!confirm) sel=modulo(sel+v,blank,2+unlocks("2"))

    h=0
    if (global.input_h!=0) {
        if (!lockh) {
            h=global.input_h
            if (sel!=0) play_sound("click")
        } lockh=1
    } else lockh=0

    if (confirm && v!=0) {confirm=!(confirm-1)+1 play_sound("click")}

    if (!confirm) {
        if (sel=1) {
            diffnew=median(0,diffnew+h,3)
            diffstr2=lang("file11")
            if (diffnew=1) diffstr2=lang("file12")
            if (diffnew=2) diffstr2=lang("file13")
            if (diffnew=3) diffstr2=lang("file14")
        }

        if (sel=2) {
            // usual: kid, dot, vic, owata, boshy
            // here: kid, boshy, owata, vic, dot
            // here -> usual: !!charnew*(5-charnew)
            charnew=median(0,charnew+h,4)
            charstr="The Kid"
            if (charnew==1) charstr="Boshy"
            if (charnew==2) charstr="Owata"
            if (charnew==3) charstr="Vic Viper"
            if (charnew==4) charstr="Dotkid"

        }
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (thumb) background_delete(thumb)
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (FilesCursor.selected && FilesCursor.file+1==i) {
    if (sel==0) {
        select_save(i)
        load_game()
    } else {
        if (!blank && !confirm) confirm=1
        else if (confirm=2 || blank) {
            select_save(i)
            new_game(diffnew,menuchartogamechar(charnew))
            room_goto(rGuy1)
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
//translate

if (!leg) draw_set_color($ff)

draw_set_font(fComic12)
draw_text_lang(x+6,y+4,lang("file1")+string(i))

draw_set_font(fComic10)

if (loading) {
    draw_sprite(sprNewFile,0,x,y+32-3*global.jp)
    draw_text_lang(x+6,y+128+4-6*global.jp,lang("file2"))
    draw_text_lang(x+6,y+160+4-6*global.jp,lang("file3"))
    draw_text_lang(x+6,y+192+4-6*global.jp,lang("file4"))
} else {
    if (FilesCursor.selected && FilesCursor.file+1==i) {
        if (sel==0) {
            draw_text_lang(x+38,y+32+4,lang("file5"))
            draw_text_lang(x+38,y+64+4,lang("file6"))
            if (!unlocks("2"))
                rect(x+32,y+96,96,32,0,1)
        } else {
            if (confirm) {
                draw_text_lang(x+38,y+32+4,lang("file15"))
                draw_text_lang(x+38,y+64+4,lang("file16"))
                draw_text_lang(x+38,y+96+4,lang("file17"))
                draw_sprite(sprMenuArrow,image_index,x+6,y+40+32*confirm)
            } else {
                draw_sprite(sprDiff,diffnew,x+64,y+64)
                if (sel==1) {
                    draw_text_lang(x+38-20*global.jp,y+32+4,diffstr2)
                    draw_text(x+38,y+64+4,"<-         ->")
                }
                if (unlocks("2")) {
                    // char transform
                    draw_sprite(sprChar,menuchartogamechar(charnew),x+64,y+96)
                    if (sel==2) {
                        draw_text(x+38,y+32+4,charstr)
                        draw_text(x+38,y+96+4,"<-         ->")
                    }
                } else rect(x+32,y+96,96,32,0,1)
            }
        }
        if (!confirm) draw_sprite(sprMenuArrow,image_index,x+6,y+40+32*sel)
    } else {
        if (thumb) draw_background(thumb,x,y+32-3*global.jp)
        else if (thumb=-1) draw_sprite(sprNewFile,1,x,y+32-3*global.jp)
        else draw_sprite(sprNewFile,0,x,y+32-3*global.jp)
    }
    if (thumb!=0) {
        draw_text_lang(x+6,y+128+4-6*global.jp,lang("file2")+" "+time)
        draw_text_lang(x+6,y+160+4-6*global.jp,lang("file3")+" "+death)
        draw_text_lang(x+6,y+192+4-6*global.jp,diffstr)
    } else {
        draw_text_lang(x+6,y+128+4-6*global.jp,lang("file2"))
        draw_text_lang(x+6,y+160+4-6*global.jp,lang("file3"))
        draw_text_lang(x+6,y+192+4-6*global.jp,lang("file4"))
    }
}

for (j=0;j<8;j+=1) {
    if (orb[j])
        draw_sprite(sprBossTele,j+1,x+(j mod 4)*32,y+224+(j div 4)*32)
}

draw_set_color($ffffff)
