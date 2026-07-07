if (unlocks("1") && !unlocks("2")) {
    if (unlocks("secret1") && unlocks("secret2") && unlocks("secret3") && unlocks("secret4") && unlocks("secret5") && unlocks("secret6")) {
        unlocks("2",1)
        settings("newcharseen",0)
        with (BossTeleporter) if (type="dev") y=ystart
        if (room!=rCredits && room!=rTitle) {
            play_important("item get 1")
            world.alarm[2]=150
        }
        save_settings()
    }
}
