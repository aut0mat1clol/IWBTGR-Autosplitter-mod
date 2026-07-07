var i;

for (i=0;i<10;i+=1) {
    if (!global.focus) global.key[i]=0
    else {
        if (i<4) {
            //we call direct checks twice because of
            //https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-getasynckeystate#return-value
            keyboard_check_direct(keyboard[i])
            global.key[i]=keyboard_check_direct(keyboard[i])
            global.key_released[i]=0
            global.key_pressed[i]=0
            if (global.key[i] && !lock[i]) {
                global.key_pressed[i]=1
                global.current_input=-1
                lock[i]=1
            }
            if (!global.key[i] && lock[i]) {
                global.key_released[i]=1
                lock[i]=0
            }
        } else {
            global.key[i]=keyboard_check(keyboard[i])
            global.key_pressed[i]=keyboard_check_pressed(keyboard[i])
            global.key_released[i]=keyboard_check_released(keyboard[i])
            if (global.key_pressed[i]) global.current_input=-1
        }
    }
}

if (global.focus) joy_update()

if (!global.key[key_right]) global.input_h=-global.key[key_left]
else global.input_h=global.key[key_right]

if (!global.key[key_down]) global.input_v=-global.key[key_up]
else global.input_v=global.key[key_down]

if (global.pause_delay) global.pause_delay-=1
else if (global.key_pressed[key_pause] && !instance_exists(PauseMenu) && !instance_exists(gameOver) && room!=rTitle && room!=rFiles && room!=rEnding && room!=rCredits) {
    instance_create(0,0,PauseMenu)
}

if (global.key_pressed[key_reset] && (room!=rCredits || instance_exists(gameOver))) {
    reset_game()
}
