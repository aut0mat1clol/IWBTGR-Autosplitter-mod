var str,i,name;

name=argument[0]

joyset=name

str=joymaps(name)
for (i=0;i<10;i+=1) {
    p=string_pos("|",str)
    cut=string_copy(str,1,p-1)
    str=string_delete(str,1,p)

    joymap[i]=cut

    joykey[i,0]=-1

    if (string_pos("axis",cut)) {
        joykey[i,0]=0
        joykey[i,1]=real(string_digits(cut))
        joykey[i,2]=!!string_pos("+",cut)-!!string_pos("-",cut)
    }
    if (string_pos("button",cut)) {
        joykey[i,0]=1
        joykey[i,1]=real(string_digits(cut))
        joykey[i,2]=1-!!string_pos("-",cut)
    }
    if (string_pos("hat",cut)) {
        joykey[i,0]=2
        joykey[i,1]=0
        joykey[i,2]=real(string_digits(cut))
    }
}
