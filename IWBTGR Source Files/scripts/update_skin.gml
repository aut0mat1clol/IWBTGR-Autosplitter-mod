//update message box skin

if (settings("border") || global.win_ver<6) {
    if (global.win_ver<6) {
        message_background(bgMessageXPXP)
        message_caption(1,"Message")
        message_size(320,128)
    } else {
        message_background(bgMessageXP)
        message_caption(0,"")
        message_size(320,150)
    }
    message_button(sprMsgButtonXP)
    message_text_font("Microsoft Sans Serif",8,0,0)
    message_button_font("Microsoft Sans Serif",8,0,1)
} else {
    if (global.win_ver==8) message_background(bgMessageWin8)
    else message_background(bgMessageWin7)
    message_caption(1,"Message")
    message_button(sprMsgButtonWin)
    message_text_font("Segoe UI Semilight",9,0,0)
    message_button_font("Segoe UI Semilight",9,0,0)
    message_size(320,128)
}

message_mouse_color(0)

if (global.jp) {
    message_text_charset(text_type,SHIFTJIS_CHARSET)
    message_text_charset(button_type,SHIFTJIS_CHARSET)
} else {
    message_text_charset(text_type,SHIFTJIS_CHARSET)
    message_text_charset(button_type,SHIFTJIS_CHARSET)
}
