lf="
"
str=""
if (!directory_exists(working_directory+"\data")) {
    str+="data folder"+lf
} else {
    if (!file_exists("data\GMFMODSimple.dll")) str+="data\GMFMODSimple.dll"+lf
    if (!file_exists("data\fmodex.dll"      )) str+="data\fmodex.dll"+lf
}

if (str!="") {
    show_error("Files missing or misplaced:"+lf+lf+str+lf+"Please make sure you've fully extracted the game download.",1)
    return 0
}

FMODInit()

voldamp=1

return 1
