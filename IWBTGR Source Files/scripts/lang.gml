var d;

d=ds_map_find_value(global.langmap,argument[0])

if (!is_string(d) || string(d)=="") return argument[0]+" lang missing!"
return d
