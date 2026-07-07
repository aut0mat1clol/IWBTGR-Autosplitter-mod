///savedata(key)
///savedata(key,value)
//savedata registry. specifying a value writes to it.

var map;
map=global.datamap

if (argument_count=1) {
    if (ds_map_exists(map,argument[0])) return ds_map_find_value(map,argument[0])
    else return 0
} else {
    var _key, _value, _old;
    _key = argument0;
    _value = argument1;
    _old = 0;

    if (ds_map_exists(map, _key)) _old = ds_map_find_value(map, _key);

    if (ds_map_exists(map,_key)) ds_map_replace(map,_key,_value)
    else ds_map_add(map,_key,_value)

    // LiveSplit autosplitter hook. Awarding an orb represents a boss/major progression clear.
    // This catches Tyson, Mother Brain, Bowser, Birdo, Dracula, Kraidgief, Dragon, and The Guy.
    // GM8 may error when comparing a string value to a number, so all checks here use strings.
    if (string_copy(string(_key), 1, 4) = "orb_") {
        if (string(_value) = "1") {
            if (string(_old) != "1") {
                autosplitter_state("orb", string(_key))
            }
        }
    }
}
