///clear_tetrimino_rows(num)
// only 2 and 4 lines get cleared at a time, no 1 or 3 so no need for cases
if (argument[0] == 2) {
    scor+=400
    play_sound("line (2)")
} else if (argument[0] == 4) {
    scor+=4800
    play_sound("tetris")
}
lines+=argument[0]
with (tetrisBlock) {
    y+=argument[0]*32
    if (y>=576) instance_destroy()
}
// reset the blocks on the tetrimino
with (tetrimino) {
    event_user(0)
}
