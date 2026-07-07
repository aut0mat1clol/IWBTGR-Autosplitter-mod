#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
str="IT'S DANGEROUS TO GO#  ALONE! TAKE THIS."

image_xscale=800/256
image_yscale=608/240
image_speed=0
display=""

orbcount=savedata("orb_tyson")+savedata("orb_mother")+savedata("orb_bowser")+savedata("orb_birdo")+savedata("orb_dracula")+savedata("orb_kraidgief")
keycount=unlocks("secret1")+unlocks("secret2")+unlocks("secret3")+unlocks("secret4")+unlocks("secret5")+unlocks("secret6")
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (inside_view()) go=1
else {
    c=0
    go=0
}

if (go) {
    timer+=1
    if (timer>=4) {
        timer=0
        c+=1
        if (string_copy(str,c,2)=="  ") c+=2
        if (c>=string_length(str)) {
            go=0
        } else {
            play_sound("zeldatext")
        }
    }
    display=string_copy(str,1,c)
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (global.bossrush) {
    str=" "+" "+" "+"I"+"T"+"'"+"S"+" "+"A"+" "+"S"+"E"+"C"+"R"+"E"+"T"+"#"+
        " "+" "+" "+"T"+"O"+" "+"E"+"V"+"E"+"R"+"Y"+"B"+"O"+"D"+"Y"+"."
    image_index=1
    with (ZeldaSword) image_speed=0.25
    export_include_file_location("i.w"+"av",temp_directory+"\i.w"+"av")
    snd=FMODSoundAdd(temp_directory+"\i.w"+"av",0)
    FMODSoundSetGroup(snd,2)
    FMODSoundSetMaxVolume(snd,global.gain*0.7)
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
stop_sound(snd)
FMODSoundFree(snd)
file_delete(temp_directory+"\i.w"+"av")
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()

draw_set_font(fNes)
draw_text_transformed(x-79*image_xscale,y-41*image_yscale,display,image_xscale/2,image_yscale/2,0)

draw_text_transformed(104*image_xscale,48*image_yscale,orbcount,image_xscale/2,image_yscale/2,0)
draw_text_transformed(104*image_xscale,(48+240)*image_yscale,orbcount,image_xscale/2,image_yscale/2,0)

draw_text_transformed(104*image_xscale,40*image_yscale,keycount,image_xscale/2,image_yscale/2,0)
draw_text_transformed(104*image_xscale,(40+240)*image_yscale,keycount,image_xscale/2,image_yscale/2,0)

draw_sprite_ext(sprZeldaItems,global.char,125*image_xscale,35*image_yscale,image_xscale,image_yscale,0,$ffffff,1)
draw_sprite_ext(sprZeldaItems,global.char,125*image_xscale,(240+35)*image_yscale,image_xscale,image_yscale,0,$ffffff,1)
