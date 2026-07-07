#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!place_free(x+hspeed,y)) hspeed=-hspeed
if (!place_free(x,y+vspeed)) vspeed=-vspeed

if (place_meeting(x+hspeed-player.hspeed,y,player)) {
    player.hspeed=hspeed
}

if (y>player.y) {
    if(place_meeting(x,y+vspeed-player.vspeed-1,player)){
        player.hspeed+=hspeed
        player.y=y-8
        player.y+=vspeed+1
        player.vspeed=vspeed
        player.onPlatform=1
        player.djump=1
    } else if (place_meeting(x+hspeed-player.hspeed,y+vspeed-player.vspeed,player)) {
        player.hspeed=0
    }
} else {
    if (place_meeting(x,y+vspeed-player.vspeed,player)) {
        if (vspeed<0) player.vspeed=0
        else player.vspeed=vspeed
    } else if(place_meeting(x+hspeed-player.hspeed,y+vspeed-player.vspeed,player)) {
        player.hspeed=0
    }
}
