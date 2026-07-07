//write save to file on disk

if (room=rTitle || room=rFiles || !savedata("saved") || global.bossrush || global.savenum==0 || global.diff==3) exit

var f,s;

f=file_text_open_write(global.savefile)
file_text_write_string(f,ds_map_write(global.datamap))
file_text_close(f)
