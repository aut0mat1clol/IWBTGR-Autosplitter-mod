if (settings("border") && global.win_ver>5) {
    global.focus=0
    screen_redraw()
    return (show_message_ext("###"+argument0,lang("file17"),"",lang("file16"))==1)
}
return (show_message_ext(argument0,lang("file17"),"",lang("file16"))==1)
