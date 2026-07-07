#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
damage=1

hspeed=16

if (instance_exists(player)) {
    hspeed=player.image_xscale*16
    if (player.vic) {
        sprite_index=sprVicBullet
        image_xscale=player.image_xscale
    }
}

if (instance_exists(FilesCursor)) {
    if (FilesCursor.char=2) {
        sprite_index=sprVicBullet
    }
    if (FilesCursor.char=3) {
        sprite_index=sprOwataBullet
        image_speed=0
    }
}

alarm[0]=42
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (sprite_index=sprOwataBullet) {
    if (vspeed!=0) {
        image_xscale=1
        image_angle=direction
    } else {
        if (hspeed<0) image_xscale=-1
        else image_xscale=1
    }
}
#define Collision_block
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (other.solid) instance_destroy()
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
instance_destroy()
#define Collision_blockPush
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=203
applies_to=self
invert=0
*/
