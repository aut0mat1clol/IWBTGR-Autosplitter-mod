#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0

if (type="tyson") {image_index=1 roomTo=rGuy1 warpX=4000 warpY=304}
if (type="birdo") {image_index=6 roomTo=rFactoryOutskirts warpX=32 warpY=976}
if (type="kraidgief") {image_index=7 roomTo=rMegaman warpX=32 warpY=400}
if (type="dracula") {image_index=3 roomTo=rFactoryOutskirts warpX=2464 warpY=1072}
if (type="mother") {image_index=5 roomTo=rFactoryOutskirts warpX=928 warpY=3600}
if (type="bowser") {image_index=2 roomTo=rBowserBoss warpX=832 warpY=496}
if (type="dragon") {image_index=4 roomTo=rGuyRoad warpX=23392 warpY=496}
if (type="guy") {image_index=8 roomTo=rGuyTower warpX=736 warpY=416 if (!savedata("orb_guy")) instance_destroy()}
if (type="dev") {image_index=9 roomTo=rDev if (!unlocks("2")) y=-9999}

if (!savedata("orb_"+type) && type!="dev") image_index=0

nobug=1
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index) {
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
