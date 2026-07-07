with (world) {
    keyboard[0]=vk_up
    keyboard[1]=vk_down
    keyboard[2]=vk_left
    keyboard[3]=vk_right
    keyboard[4]=vk_shift
    keyboard[5]=ord("Z")
    keyboard[6]=ord("R")
    keyboard[7]=ord("P")
    keyboard[8]=ord("S")
    keyboard[9]=vk_backspace
    settings("keyup"   ,keyboard[0])
    settings("keydown" ,keyboard[1])
    settings("keyleft" ,keyboard[2])
    settings("keyright",keyboard[3])
    settings("keyjump" ,keyboard[4])
    settings("keyshoot",keyboard[5])
    settings("keyreset",keyboard[6])
    settings("keypause",keyboard[7])
    settings("keyskip" ,keyboard[8])
    settings("keyback" ,keyboard[9])

    ds_map_clear(global.joymap)
    if (file_exists(global.joyfile))
        file_delete(global.joyfile)

    global.joynum=0
    alarm[3]=50
}
