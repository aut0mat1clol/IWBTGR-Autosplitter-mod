///autosplitter_state(event, detail)
// Writes simple key=value data for LiveSplit.

var _event, _detail, _dir, _file;

_event = argument0;
if (argument_count > 1) _detail = string(argument1); else _detail = "";

// This is initialized in game_start.gml.
global.asl_event_id += 1;

_dir = working_directory + "\\save";
directory_create(_dir);

_file = file_text_open_write(_dir + "\\autosplitter.txt");

file_text_write_string(_file, "event_id=" + string(global.asl_event_id));
file_text_writeln(_file);

file_text_write_string(_file, "event=" + string(_event));
file_text_writeln(_file);

file_text_write_string(_file, "detail=" + string(_detail));
file_text_writeln(_file);

file_text_write_string(_file, "room_id=" + string(room));
file_text_writeln(_file);

file_text_write_string(_file, "room_name=" + room_get_name(room));
file_text_writeln(_file);

file_text_write_string(_file, "deaths=" + string(global.death));
file_text_writeln(_file);

file_text_close(_file);
