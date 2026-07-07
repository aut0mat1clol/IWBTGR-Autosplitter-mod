#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_xscale=player.image_xscale

if (player.dot) sprite_index=sprDotMetroided
if (player.vic) sprite_index=sprVicMetroided
if (player.owater) sprite_index=sprOwataMetroided
if (player.boshy) sprite_index=sprBoshyMetroided
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (image_speed>0) {
   repeat (3) instance_create(x+irandom_range(-8,8),y-14+18*(image_index/image_number)+irandom(4),partDust)
}

player.x=x
player.y=y
#define Other_7
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=image_number-1
killPlayer(Metroid)
