#define Collision_bullet
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var b;
b=other.id
with (Dracula) {
    if (hp>0) {
        if (hp mod 6 == 0 || b.damage>1) play_sound("dra_aghh")
        hp-=b.damage
        play_sound("thud")
        if (hp <= 23 && !instance_exists(DractoPlasm)) {
            instance_create(107,398,DractoPlasm)
            instance_create(687,416,DractoPlasm)
            play_sound("dra_play")
        }
        if (hp <= 9) {
            with (DractoPlasm) speed=mmf_speed(13)
        }
        if (hp <= 0) {
            with (DraculasFace) instance_destroy()
            with (DracDeathSpiral) instance_destroy()
            with (DracHomingApple) instance_destroy()
            with (DractoPlasm) instance_destroy()
            with (DracMoon) instance_destroy()
            with (DracHorizApple) instance_destroy()
            with (DracOrbiter) instance_destroy()
            with (DracSpiralApple) instance_destroy()
            with (DracFireball) instance_destroy()
            with (WilyFirePillar) instance_destroy()
            with (instance_create(x,y,Deadcula)) {
                image_xscale=other.image_xscale
                image_index=other.image_index
            }
            instance_destroy()
        }
    }
}
with (other) instance_destroy()
