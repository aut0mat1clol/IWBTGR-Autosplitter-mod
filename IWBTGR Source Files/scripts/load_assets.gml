var dir,voices;

global.importantsound=0

global.langmap=ds_map_create()
global.sndmap=ds_map_create()
voices=ds_list_create()

ds_map_add(global.sndmap,"song","")
ds_map_add(global.sndmap,"inst",0)

dir="data\"

f=file_text_open_read(dir+"_voices.txt")
do {
    str=file_text_read_string(f)
    file_text_readln(f)
    if (str="") continue
    ds_list_add(voices,str)
} until (file_text_eof(f))
file_text_close(f)

for (f=file_find_first(dir+"*.wav",0);f!="";f=file_find_next()) {
    snd=FMODSoundAdd(dir+f,0)
    FMODSoundSetGroup(snd,2)
    FMODSoundSetMaxVolume(snd,global.gain*0.7)
    ds_map_add(global.sndmap,filename_change_ext(f,""),snd)
} file_find_close()

for (f=file_find_first(dir+"*.ogg",0);f!="";f=file_find_next()) {
    if (f="snd_boom.ogg") continue
    snd=FMODSoundAdd(dir+f,2)
    name=filename_change_ext(f,"")
    if (ds_list_find_index(voices,name)!=-1) FMODSoundSetGroup(snd,2)
    else FMODSoundSetGroup(snd,1)
    FMODSoundSetMaxVolume(snd,global.gain*0.7)
    ds_map_add(global.sndmap,name,snd)
} file_find_close()

ds_list_destroy(voices)

global.haswinsound=0
fn=environment_get_variable("windir")+"\Media\Windows Foreground.wav"
if (file_exists(fn)) {
    snd=FMODSoundAdd(fn,2)
    ds_map_add(global.sndmap,"windows error",snd)
    global.haswinsound=1
}

snd=FMODSoundAdd(dir+"snd_boom.ogg",0)
FMODSoundSetGroup(snd,2)
FMODSoundSetMaxVolume(snd,global.gain*0.7)
ds_map_add(global.sndmap,"snd_boom",snd)

global.haswinding=0
fn=environment_get_variable("windir")+"\Media\Windows Ding.wav"
if (file_exists(fn)) {
    snd=FMODSoundAdd(fn,0)
    FMODSoundSetGroup(snd,2)
    FMODSoundSetMaxVolume(snd,global.gain*0.7)
    ds_map_add(global.sndmap,"winding",snd)
    global.haswinding=1
}

f=file_text_open_read(dir+"_loop.txt")
do {
    str=file_text_read_string(f)
    file_text_readln(f)
    if (str="") continue
    p=string_pos("=",str)
    name=string_copy(str,1,p-1)
    point=real(string_delete(str,1,p))
    snd=ds_map_find_value(global.sndmap,name)
    if (snd) {
        FMODSoundSetLoopPoints(snd,point/FMODSoundGetLength(snd),1)
    } else show_error("nonexisting sound name '"+name+"'",0)
} until (file_text_eof(f))
file_text_close(f)

f=file_text_open_read(dir+"_volume.txt")
do {
    str=file_text_read_string(f)
    file_text_readln(f)
    if (str="") continue
    p=string_pos("=",str)
    name=string_copy(str,1,p-1)
    vol=real(string_delete(str,1,p))
    snd=ds_map_find_value(global.sndmap,name)
    if (snd) {
        FMODSoundSetMaxVolume(snd,median(0,global.gain*(0.7+0.1*vol),1))
    } else show_error("nonexisting sound name "+name,0)
} until (file_text_eof(f))
file_text_close(f)
