///new_game(diff,char)
//creates a new file

global.death=0
global.time=0
global.tick=0
global.diff=argument[0]
global.char=argument[1]

ds_map_clear(global.datamap)
savedata("deaths",0)
savedata("time",0)
savedata("tick",0)
savedata("diff",global.diff)
savedata("char",global.char)
savedata("saved",0)
savedata("saveroom",0)
savedata("legit",1)

if (global.char) settings("newcharseen",1)

// LiveSplit autosplitter hook
autosplitter_state("new_game", "")
