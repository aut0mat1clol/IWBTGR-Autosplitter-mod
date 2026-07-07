///within (xtest, ytest, x, y, w, h)
var a,b,c,d,e,f;

a=argument[0]
b=argument[1]

c=argument[2]
d=argument[3]

e=argument[4]
f=argument[5]

return (a=clamp(a,c,c+e-1) and b=clamp(b,d,d+f-1))
