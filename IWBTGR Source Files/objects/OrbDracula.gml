#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
event_inherited()

defeat_bossrush("dracula")
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(player))instance_create(3040,960,player)
player.x=3040
player.y=960
global.save_on_room_change=1
global.orb_on_room_change="orb_dracula"
room_goto(rFactoryOutskirts)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (visible) {
    play_important("itemget")
    visible=0
    alarm[0]=50*3.7
}
