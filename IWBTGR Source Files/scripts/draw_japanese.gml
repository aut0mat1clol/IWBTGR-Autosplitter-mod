///draw_japanese(x,y,str,xscale,yscale,col,alpha,halign,valign)
var dx,ax,ay,dy,str,xsc,ysc,col,c,p,l,i,width,height,line,alpha,halign,valign,mw;

dx=argument[0]
dy=argument[1]
str=argument[2]
xsc=argument[3]
ysc=argument[4]
col=argument[5]
alpha=argument[6]
halign=argument[7]
valign=argument[8]

l=string_length(str)

if (halign || valign || global.tcalc) {
    ax=0
    ay=0
    mw=0
    for (i=1;i<=l;i+=1) {
        c=string_char_at(str,i)
        p=string_pos(c,global.dictionary)
        if (p) ax+=(15-5*(p<75))*xsc
        if (c="#" || c=chr(10) || i==l) {
            width[line]=ax
            mw=max(mw,ax)
            line+=1
            ax=0
            height+=16*ysc
        }
    }
}

if (global.tcalc) {
    global.twidth=mw
    global.theight=height
    global.tcalc=0
    exit
}

line=0

if (halign=1) dx-=floor(width[line]/2)
if (halign=2) dx-=width[line]

if (valign=1) dy-=floor(height/2)
if (valign=2) dy-=height

for (i=1;i<=l;i+=1) {
    c=string_char_at(str,i)
    p=string_pos(c,global.dictionary)
    if (p && !(c="#" || c=chr(10))) {
        draw_sprite_ext(sprJapanese,p-1,floor(dx),floor(dy),xsc,ysc,0,col,alpha)
        dx+=(15-5*(p<75))*xsc
    }// if (p==0) if (!string_pos(c,global.dffdgdfg)) {global.dffdgdfg+=c clipboard_set_text(global.dffdgdfg)}
    if (c="#" || c=chr(10)) {
        line+=1
        dx=argument[0]
        if (halign=1) dx-=width[line]/2
        if (halign=2) dx-=width[line]
        dy+=16*xsc
    }
}
