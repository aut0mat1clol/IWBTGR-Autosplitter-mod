///move_tetrimino(xdiff,ydiff)
var xdiff,ydiff,i;
xdiff=argument[0]*32
ydiff=argument[1]*32
with (tetrimino) {
    x+=xdiff
    y+=ydiff
    for (i=0; i<4; i+=1) {
        with (blocks[i]) {
            instance_destroy()
        }
    }
    event_user(0)
}
