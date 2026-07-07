#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile_layer_delete_at(1000,x,y)
tile_layer_delete_at(999,x,y)
tile_layer_delete_at(999,x+16,y)
tile_layer_delete_at(999,x,y+16)
tile_layer_delete_at(999,x+16,y+16)
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
play_sound("megamanappear")
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
with (block) if (place_meeting(x,y,other.id)) instance_destroy()
