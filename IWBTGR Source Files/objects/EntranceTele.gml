#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_xscale=370/16
roomTo=rGuyRoad
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
repeat (5) instance_create(irandom_range(bbox_left,bbox_right),bbox_bottom,partEntrance)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (
    savedata("orb_tyson") &&
    savedata("orb_mother") &&
    savedata("orb_bowser") &&
    savedata("orb_birdo") &&
    savedata("orb_dracula") &&
    savedata("orb_kraidgief")
) {
    with (player) {
        instance_destroy()
    }
    room_goto(rGuyRoad)
} else killPlayer(EntranceTele)
#define Collision_bloodEmitter
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (
    savedata("orb_tyson") &&
    savedata("orb_mother") &&
    savedata("orb_bowser") &&
    savedata("orb_birdo") &&
    savedata("orb_dracula") &&
    savedata("orb_kraidgief")
) {
    event_inherited()
}
