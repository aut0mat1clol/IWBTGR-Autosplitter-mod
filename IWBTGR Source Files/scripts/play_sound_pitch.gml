var snd;

snd=FMODSoundPlay(ds_map_find_value(global.sndmap,argument[0]),1)
FMODInstanceSetPitch(snd,argument[1])
FMODInstanceSetPause(snd,0)
return snd
