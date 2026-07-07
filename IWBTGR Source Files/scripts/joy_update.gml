var pressed;

if (joystick_found()) alarm[3]=50

if (global.ignorejoy) {
    global.ignorejoy=0
} else for (joyid=0;joyid<global.joynum;joyid+=1) {
    joyname=joy_get(joyid,3,0)
    if (joyname!=joyset) joy_unpack(joyname)

    for (i=0;i<10;i+=1) {
        pressed=joy_get_map(joyid,i)
        global.key[i]=global.key[i] || pressed
        if (pressed && !joylock[i,joyid]) {
            global.key_pressed[i]=1
            global.current_input=joyid
            joylock[i,joyid]=1
        }
        if (!pressed && joylock[i,joyid]) {
            global.key_released[i]=1
            joylock[i,joyid]=0
        }
    }
}
