#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!dead) {
    if (aggressive) killPlayer(id)
    else {
        dead=1
        play_sound("tysonhitted")
        image_angle=270
        x-=16
        y+=16
        direction=270
        with (other) {
            onPlatform=1
            playerJump(1)
        }
    }
}
#define Collision_Snifit
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (other) {
    play_sound("break")
    instance_create(x,y+32,SnifitDead)
    instance_destroy()
}
#define Other_40
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
