//controller support
//based on sonic boll & mega man shattered diamond code
var i,j;

mem=global.joynum
global.joynum=joystick_count()
global.ignorejoy=1

joyset=""

for (i=0;i<global.joynum;i+=1) {
    joyname=joy_get(i,3,0)
    if (string(joymaps(joyname))="none") {
        //freeze game
        FMODMasterSetVolume(0)
        with (titleCtrl) FMODInstanceSetPause(inst,1)
        with (ClownCar) if (inst) FMODInstanceSetPause(inst,1)
        with (DraculaIntro) if (inst) FMODInstanceSetPause(inst,1)
        with (GuyFirst) if (inst) FMODInstanceSetPause(inst,1)

        //prepare the screen
        surface_reset_target()
        d3d_set_projection_ortho(-(view_wport[0]-800-3),-(view_hport[0]-608-3),view_wport[0],view_hport[0],0)
        draw_set_font(fComic13)
        draw_set_halign_lang(1)
        draw_set_valign_lang(1)
        rect(0,0,800,global.resh,0,0.5)

        boxx=400-224
        boxy=304-144

        //FIRST YOU DRAW A CIRCLE
        draw_background_part(tileMaster,32,96,32,32,boxx-32,boxy-32)
        draw_background_part(tileMaster,32,96,32,32,boxx+448,boxy-32)
        draw_background_part(tileMaster,32,96,32,32,boxx+448,boxy+288)
        draw_background_part(tileMaster,32,96,32,32,boxx-32,boxy+288)
        dx=boxx
        repeat (14) {
            draw_background_part(tileMaster,0,96,32,32,dx,boxy-32)
            draw_background_part(tileMaster,0,96,32,32,dx,boxy+288)
            dx+=32
        }
        dy=boxy
        repeat (9) {
            draw_background_part(tileMaster,32,64,32,32,boxx-32,dy)
            draw_background_part(tileMaster,32,64,32,32,boxx+448,dy)
            dy+=32
        }
        rect(boxx,boxy,448,288,0,1)

        //take a snapshot of this controller
        joy_snap(i)

        //wait for confirmation
        draw_text(400,304-2,"New Controller Detected:#"+joyname+"##You need to map your buttons#before you can use this controller.####Press a button when you're ready or#press esc to skip this controller.")

        do {
            screen_refresh()
            sleep(20)
            io_handle()
            joystick_key=""

            //if you disconnect the controller...
            if ((joystick_update() && joystick_count()<global.joynum)) {
                //restore game state
                with (titleCtrl) FMODInstanceSetPause(inst,0)
                with (ClownCar) if (inst) FMODInstanceSetPause(inst,0)
                with (DraculaIntro) if (inst) FMODInstanceSetPause(inst,0)
                with (GuyFirst) if (inst) FMODInstanceSetPause(inst,0)
                FMODMasterSetVolume(1)
                draw_set_halign_lang(0)
                draw_set_valign_lang(0)
                io_clear()
                exit
            }

            //now we listen for buttons from any of them with the same name
            //this is necessary f.ex. on xbox controllers that can have wack axis
            //positions while disconnected and also gamecube adapters
            yes=-1
            for (k=0;k<global.joynum;k+=1) if (joystick_key=="") {
                if (joy_get(k,3) == joyname) {
                    joystick_key=joy_compare(k)
                    if (string_pos("button",joystick_key)) yes=k
                }
            }
        } until (yes!=-1 || keyboard_key==vk_escape)

        if (keyboard_key==vk_escape) {
            joymaps(joyname,"")
            continue
        }

        //now wait for you to let go of that button
        do {
            screen_refresh()
            sleep(20)
            io_handle()
            joystick_update()
            joystick_key=joy_compare(yes)
        } until (joystick_key="")

        //take a snapshot of the ACTUAL controller you're using here
        //phew
        joy_snap(yes)

        yeah=1
        do {
            if (!yeah) {
                do {
                    //update screen
                    screen_refresh()
                    sleep(20)
                    io_handle()
                } until (!keyboard_check_direct(vk_escape))
            }
            yeah=1
            current=0
            wait=""
            repeat (10) {
                //ask for a new button
                rect(boxx,boxy,448,288,0,1)
                draw_text(400,304-2,"New Controller Detected:#"+joyname+"##You need to map your buttons#before you can use this controller.##Please press "+lang(butname(current))+"...##Press space to skip the current button#or press esc to start over.")

                //ask for button!
                do {
                    //update screen
                    screen_refresh()
                    sleep(20)
                    io_handle()

                    if (keyboard_check_direct(vk_escape)) {
                        yeah=0
                        break
                    } else {
                        //if you disconnect the controller...
                        if ((joystick_update() && joystick_count()<global.joynum)) {
                            //restore game state
                            with (titleCtrl) FMODInstanceSetPause(inst,0)
                            with (ClownCar) if (inst) FMODInstanceSetPause(inst,0)
                            with (DraculaIntro) if (inst) FMODInstanceSetPause(inst,0)
                            with (GuyFirst) if (inst) FMODInstanceSetPause(inst,0)
                            FMODMasterSetVolume(1)
                            draw_set_halign_lang(0)
                            draw_set_valign_lang(0)
                            io_clear()
                            exit
                        }

                        joystick_key=joy_compare(yes)

                        //make sure the new button isn't already mapped to something else
                        valid=1 for (j=0;j<current;j+=1) if (joystick[j]==joystick_key) valid=0

                        //allow you to not map specific buttons
                        waitspace=space
                        space=keyboard_check_direct(vk_space)
                    }
                } until ((valid && joystick_key!=wait && joystick_key!="") || (space && !waitspace))

                if (yeah) {
                    //store this button map
                    joystick[current]=joystick_key
                    current+=1
                    wait=joystick_key
                }
            }
        } until (yeah)

        //store the new mapping
        map=""
        for (j=0;j<10;j+=1) map+=joystick[j]+"|"
        joymaps(joyname,map)
        save_settings()
        world.joyset=""
    }
}

//restore game state
with (titleCtrl) FMODInstanceSetPause(inst,0)
with (ClownCar) if (inst) FMODInstanceSetPause(inst,0)
with (DraculaIntro) if (inst) FMODInstanceSetPause(inst,0)
with (GuyFirst) if (inst) FMODInstanceSetPause(inst,0)
FMODMasterSetVolume(1)
draw_set_halign_lang(0)
draw_set_valign_lang(0)
io_clear()
