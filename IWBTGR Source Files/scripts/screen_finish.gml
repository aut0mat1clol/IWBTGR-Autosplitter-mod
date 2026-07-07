//this is where the magic happens -

//game maker 8.1 waits the frame timer BEFORE presenting.
//however, it doesn't wait if you draw yourself...
//so we manually call this on end step, which composes the screen and updates the internal buffer,
//and then since we are redrawing it just updates the screen for us. so that means we don't need
//to present twice or any other dumb hacks to get the frame to appear immediately.

if (!global.minimized) {
    if (settings("vsync")) screen_wait_vsync()
    screen_redraw()
}

//we also prepare the next frame now, because game maker is going to
//run its own draw event right after this, and wait for us.
screen_prepare()
