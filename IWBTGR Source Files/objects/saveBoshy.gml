#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=604
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_index==6) instance_create(x+8,y+10,SaveSpit)
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
if (image_index==0 && instance_exists(player)) {
    image_speed=0.25
    saveGame(string(room)+"."+string(x)+"."+string(y))
}

play_sound_pitch("FuckYea (2)",random_range(0.95,1.15))
i=instance_create(player.x+32,player.y,BoshyQuote)
i.image_index=7
