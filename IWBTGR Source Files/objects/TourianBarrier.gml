#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sprite_index=sprGuySpikeTrapBarrier
image_speed=0
image_index=image_number-1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (!instance_exists(OrbMother)) image_index=max(0,image_index-0.25)
