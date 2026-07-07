var time,atime,minu,sec,msec;

msec=(argument[1]*2) mod 100

atime=argument[0] mod 3600

minu=atime div 60
sec=atime mod 60

return format(minu,2)+":"+format(sec,2)+":"+format(msec,2)
