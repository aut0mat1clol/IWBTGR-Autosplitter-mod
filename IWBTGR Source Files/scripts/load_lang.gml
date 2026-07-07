var dir,f,str,p,name,data;

dir="data\_english.txt"

switch (settings("language")) {
    case 1:
        global.language=1
        global.jp=1
        dir="data\_japanese.txt"
        update_skin()
        break
    case 2:
        global.language=2
        global.jp=0
        dir="data\_spanish.txt"
        update_skin()
        break
    default:
        //we need the dictionary anyway so load japanese first
        settings("language",1)
        load_lang()
        settings("language",0)
        global.language=0
        global.jp=0
        break
}

ds_map_clear(global.langmap)

f=file_text_open_read(dir)
do {
    str=file_text_read_string(f)
    file_text_readln(f)
    if (str="") continue
    p=string_pos("=",str)
    if (!p) continue
    name=string_copy(str,1,p-1)
    data=string_delete(str,1,p)
    ds_map_add(global.langmap,name,data)
} until (file_text_eof(f))
file_text_close(f)

if (global.jp) global.dictionary=lang("dictionary")
