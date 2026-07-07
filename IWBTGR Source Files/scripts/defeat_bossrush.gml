///defeat_bossrush(boss)

if (global.bossrush) {
    savedata("orb_"+argument[0],1)
    with (player) instance_destroy()
    room_goto(rBossRush)
}
