#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
blk=rFactoryOutskirts_002D80B8
blk_spd=0
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var now_blk, next_blk;
if (blk.object_index==FactoryYoku) {
    now_blk=floor(blk)
    next_blk=floor(blk+blk_spd)
    blk+=blk_spd
    if (now_blk!=next_blk) {
        play_sound("megamanappear")
        blk=floor(blk) // evade potential floating point inaccuraccies
        if (next_blk.object_index==FactoryYoku) {
            next_blk.img_spd=-mmf_animspeed(50)
        } else {
            now_blk.img_spd=mmf_animspeed(50)
        }
    }
}
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (blk_spd==0) {
    blk_spd=1/100
    // in the original these run on a global timer
    // waiting the full 2 seconds feels a bit slow due to animations
    // and the fact that you would rarely have to wait that long in the original
    // so advance by how long the animation takes
    blk+=2*2*7*blk_spd
}
