#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
saveTimer=-1
if (global.diff>2) instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
saveTimer=max(0,saveTimer-1)
#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var valid;

valid=1
with (player) if (place_meeting(x,y,SoftlockBlocker) || place_meeting(x,y,playerKiller)) valid=0

if (!valid) {
    play_sound("click")
    other.direction=mmf_direction(irandom(31))
} else event_user(0)

if (global.char==4) instance_destroy_other()
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (settings("evilsaves")) instance_change(saveVeryEvil,1)
if (global.char==4) {
    instance_create(x+8,y+8,saveBoshy)
    instance_destroy()
}
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=0
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!saveTimer && instance_exists(player)) {
    saveTimer=50
    image_index=1
    image_speed=1/50
    saveGame(string(room)+"."+string(x)+"."+string(y))
}
