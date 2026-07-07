#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
tile=tile_layer_find(900,x,y)
if (!tile) {
    show_error("blockTrapDestructible at "+string(x)+","+string(y)+" doesnt have a tile",0)
    instance_destroy()
}

coll=instance_create(x,y,blockNotMerge)
coll.owner=id
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
i=instance_create(x+16,y+16,DestroyedBlock)
i.l=tile_get_left(tile)
i.t=tile_get_top(tile)
i.hspeed=hspeed+random(hspeed)
i.vspeed=vspeed+random(vspeed)
tile_delete(tile)

with (instance_place(x,y,WalljumpR)) instance_destroy()
with (instance_place(x,y,WalljumpL)) instance_destroy()

instance_activate_object(coll)
with (coll) instance_destroy()
