///playerJump(silent)
//silent flag is only used for the bullet bills in the snifit room

//infinite jump cheat
if (global.jumbpbsdtdve || settings("infjump")) djump=1

if (place_meeting(x,y+1,block) || onPlatform || place_meeting(x,y+1,objWater)) {
    vspeed=-jump
    if (!argument[0] && !owater) play_sound("jump1")
    if (owater) djump=!place_meeting(x,y+1,OwataPlatform)
    else djump=1
} else if (owater) {
    if (djump || global.jumbpbsdtdve || settings("infjump")) {
        with (OwataPlatform) instance_destroy()
        instance_create(x,y+11,OwataPlatform)
        play_sound("jump3")
        djump=0
    }
} else if (djump || place_meeting(x,y+1,objWater2)) {
    vspeed=-jump2//min(vspeed,-jump2)
    sprite_index=sprPlayerJump
    play_sound("jump2")
    djump=0
}
