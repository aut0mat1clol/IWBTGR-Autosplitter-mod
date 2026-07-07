//read the current save file

var f;

if (file_exists(global.savefile)) {
    f=file_text_open_read(global.savefile)
    str=file_text_read_string(f)
    file_text_close(f)
    ds_map_clear(global.datamap)
    if (!ds_map_read_safe(global.datamap,str)) {
        if (show_question(lang("file18"))) {
            file_delete(global.savefile)
            file_copy(global.backupfile,global.savefile)
            f=file_text_open_read(global.savefile)
            str=file_text_read_string(f)
            file_text_close(f)
            ds_map_clear(global.datamap)
            if (!ds_map_read_safe(global.datamap,str)) {
                show_message("Corrupt save data")
                new_game(0,0)
            }
        }
    }

} else new_game(0,0)
