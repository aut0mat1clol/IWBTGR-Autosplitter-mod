#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (is_string(code)) execute_string(code)

if (roomTo!=0) room_goto(roomTo)

if (warpX=0 && warpY=0){
    with (player) {
        instance_destroy()
    }
} else {
    if (warpXhoff!=0 || warpX=0) player.x+=warpXhoff
    else player.x=warpX
    if (warpYvoff!=0 || warpY=0) player.y+=warpYvoff
    else player.y=warpY
}
#define Collision_bloodEmitter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("gameover") && !nobug) {
    if (is_string(code)) execute_string(code)

    if (roomTo!=0) room_goto(roomTo)

    if (warpX=0 && warpY=0){
        global.invincible=1
    } else {
        if (warpXhoff!=0 || warpX=0) player.x+=warpXhoff
        else player.x=warpX
        if (warpYvoff!=0 || warpY=0) player.y+=warpYvoff
        else player.y=warpY
    }
}
