var song;

song=argument[0]

global.realsong=song

if (global.boshysong && song!="") song=pick(global.boshysong-1,
    "lalala",
    "trollolo",
    "rickroll",
    "chocolaterain",
    "barrelroll",
    "keyboardcat",
    "hamstersong",
    "cookie",
    "brentalfloss",
    "doitlive",
    "George_Michael_-_Careless_Whisper_Loop_2",
    "epicsaxguy"
)

if (!global.importantsound) {
    if (ds_map_find_value(global.sndmap,"song")!=song) {
        ds_map_replace(global.sndmap,"song",song)
        FMODInstanceStop(ds_map_find_value(global.sndmap,"inst"),0)
        if (song!="") {
            ds_map_replace(global.sndmap,"inst",loop_sound(song))
        }
    } else FMODInstanceSetPause(ds_map_find_value(global.sndmap,"inst"),0)
}
