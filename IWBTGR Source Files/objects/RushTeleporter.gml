#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

if (type="tyson") {image_index=1 roomTo=rGuy1 warpX=3216 warpY=304}
if (type="birdo") {image_index=6 roomTo=rGraveyard warpX=3024 warpY=464}
if (type="kraidgief") {image_index=7 roomTo=rKraidgiefBoss warpX=96 warpY=288}
if (type="dracula") {image_index=3 roomTo=rDraculaBoss warpX=752 warpY=432}
if (type="mother") {image_index=5 roomTo=rMetroid warpX=1568 warpY=1520}
if (type="bowser") {image_index=2 roomTo=rBowserBoss warpX=16 warpY=432}
if (type="dragon") {image_index=4 roomTo=rGuyRoad warpX=23392 warpY=448}
if (type="guy") {image_index=8 roomTo=rGuyBoss warpX=16 warpY=432}

if (savedata("orb_"+type)) image_index=0
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index=0) killPlayer(BossTeleporter)
else {
    if (roomTo!=0) room_goto(roomTo)

    if (warpX=0 && warpY=0){
        with (player) {
            instance_destroy()
        }
    } else {
        player.x=warpX
        player.y=warpY
    }
}
