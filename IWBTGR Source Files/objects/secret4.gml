#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (unlocks("secret4")) instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
f=(f+mmf_animspeed(20)) mod 6
y=ystart-3+round(abs(3-f))
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
unlocks("secret4",1)
verify_unlocks()
save_settings()
play_sound("item")
instance_destroy()
