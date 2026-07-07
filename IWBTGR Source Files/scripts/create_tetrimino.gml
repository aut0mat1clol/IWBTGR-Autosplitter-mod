///create_tetrimino(type)
with (tetrimino) {
    other.scor+=10
    play_sound("hit")
    instance_destroy()
}
if (argument[0] == pill) {
    play_music("")
    instance_create(375,-100,KillPill)
} else {
    counts[argument[0]]+=1
    with (instance_create(384,32,tetrimino)) {
        type=argument[0]
        event_user(0)
    }
}
