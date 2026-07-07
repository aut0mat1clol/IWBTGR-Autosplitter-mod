//executes the save file once we're in the target room

global.death=savedata("deaths")
global.time=savedata("time")
global.tick=savedata("tick")
global.diff=savedata("diff")

with (player) {
    x=savedata("savex")
    y=savedata("savey")
    image_xscale=savedata("savew")
    softlock_count=5*!vic
}
