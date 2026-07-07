savedata("orb_guy",1)
unlocks("1",1)

if (savedata("legit")) {
    if (global.char==1) settings("cleardot",1)
    if (global.char==2) settings("clearvic",1)
    if (global.char==3) settings("clearowata",1)
    if (global.char==4) settings("clearboshy",1)

    if (global.diff=2 || global.diff=3)
        settings("pog",1)
    if (global.diff=3)
        settings("swag",1)
}

commit_save()
save_settings()
