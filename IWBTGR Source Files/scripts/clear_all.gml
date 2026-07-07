var dip;

ds_map_clear(global.unlmap)

for (i=0;i<ds_list_size(dips)/4;i+=1) {
    dip=ds_list_find_value(dips,i*4)
    settings(dip,0)
}

cleared2=1
play_sound("splatter")
