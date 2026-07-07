// xto, yto; sets direction and speed
var dX, dY, ang;
dX=argument[0]-x
dY=argument[1]-y
ang=(arctan2(-dY,dX)+degtorad(90))/2
if (ang!=pi/2) {
speed=dX/(cos(ang)*sqrt(2*(dY+tan(ang)*dX)/gravity))
direction=radtodeg(ang)}
