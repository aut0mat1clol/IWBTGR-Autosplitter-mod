f=file_text_open_write(global.setfile)
file_text_write_string(f,ds_map_write(global.setmap))
file_text_writeln(f)
file_text_writeln(f)
file_text_write_string(f,"This file contains your settings.")
file_text_writeln(f)
file_text_write_string(f,"Deleting it won't erase your unlocks or secrets.")
file_text_close(f)

if (ds_map_size(global.unlmap)) {
    f=file_text_open_write(global.unlfile)
    file_text_write_string(f,ds_map_write(global.unlmap))
    file_text_writeln(f)
    file_text_writeln(f)
    file_text_write_string(f,"This file contains your secrets and unlocks.")
    file_text_close(f)
} else file_delete(global.unlfile)

if (ds_map_size(global.joymap)) {
    f=file_text_open_write(global.joyfile)
    file_text_write_string(f,ds_map_write(global.joymap))
    file_text_writeln(f)
    file_text_writeln(f)
    file_text_write_string(f,"This file contains mappings for the following controllers:")
    file_text_writeln(f)

    key=ds_map_find_first(global.joymap)
    repeat (ds_map_size(global.joymap)) {
        file_text_writeln(f)
        file_text_write_string(f,key)
        key=ds_map_find_next(global.joymap,key)
    }
    file_text_writeln(f)
    file_text_writeln(f)
    file_text_write_string(f,"You can either delete this, or press Ctrl-C in the title screen to reset all.")
    file_text_close(f)
} else file_delete(global.joyfile)
