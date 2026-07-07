var hour,atime,minu,sec;

hour=argument[0] div 3600
atime=argument[0] mod 3600

minu=atime div 60
sec=atime mod 60

return string(hour)+":"+format(minu,2)+":"+format(sec,2)
