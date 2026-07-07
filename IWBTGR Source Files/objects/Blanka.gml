#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=mmf_animspeed(50)
xspeed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index==13) xspeed=-mmf_speed(50)
if (floor(image_index)==15) mask_index=sprBlankaHitbox
if (x<200 && xspeed==-mmf_speed(50)) {
    play_sound("earthquaketest (2)")
    with (KraidgiefFallingSpike) if (irandom(23)==0) active=true
    instance_create(0,0,KraidgiefDebrisSpawner)
    xspeed=-mmf_speed(3)
}
x+=xspeed
xprevious=x
if (place_meeting(x,y,player)) killPlayer(id)
#define Other_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_index=15
