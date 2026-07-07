///draw_selection(x,y,w,h)
//draw windows-style dotted selection rectangle
var dx,dy,w,h,i,col;

dx=argument[0]-2
dy=argument[1]-2
w=argument[2]+4
h=argument[3]+4

col=draw_get_color()
draw_set_color($271613)

i=dx+1
repeat (w-2) {
    if ((i-dx) mod 2) {
        draw_point(i,dy)
        draw_point(i,dy+h-1)
    }
    i+=1
}

i=dy+1
repeat (h-2) {
    if (!((i-dy) mod 2)) {
        draw_point(dx,i)
        draw_point(dx+w-1,i)
    }
    i+=1
}
draw_set_color(col)
