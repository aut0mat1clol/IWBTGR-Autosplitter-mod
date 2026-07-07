///rotate_tetrimino(cw)
play_sound("rotate")
with (tetrimino) {
    angle+=argument[0]*2-1
    angle=(angle+4) mod 4
    event_user(0)
}
