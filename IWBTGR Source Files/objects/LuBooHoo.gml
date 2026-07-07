#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
FireGlow.visible=0
FireGlow.image_alpha=0
#define Collision_BowserFireClassic
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
visible=1
if (!settings("noparticles")) {
    Fire.visible=1
    FireGlow.visible=1
}
with (other) instance_destroy()
play_sound("dra_aghh")
play_sound("BOWSERFIRE")
