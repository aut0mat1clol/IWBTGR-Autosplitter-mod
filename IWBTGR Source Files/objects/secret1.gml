#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (unlocks("secret1")) instance_destroy()
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(ErrorTrap))
f=(f+mmf_animspeed(20)) mod 6
y=ystart-3+round(abs(3-f))
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
unlocks("secret1",1)
verify_unlocks()
save_settings()
play_sound("item")
instance_destroy()
