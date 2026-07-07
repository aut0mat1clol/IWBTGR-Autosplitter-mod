#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (y+vspeed>448 || y+vspeed<160) {
    with (FallingCeiling) vspeed=-vspeed
    with (FallingCeilingSpike) vspeed=-vspeed
    with (spikeDown) if (vspeed!=0) vspeed=-vspeed
}
