//switch to one of the 3 save files

global.savenum=argument[0]

global.savefile=global.savedir+"\game"+string(global.savenum)+".sav"
global.saveimg=global.savedir+"\save"+string(global.savenum)+".png"

global.backupfile=global.savedir+"\backups\game"+string(global.savenum)+".sav"
global.backupimg=global.savedir+"\backups\save"+string(global.savenum)+".png"

if (!file_exists(global.savefile)) {
    new_game()
}

global.hitboxes=settings("hitboxes")
global.autofire=settings("autofire")

global.softlocks=0
