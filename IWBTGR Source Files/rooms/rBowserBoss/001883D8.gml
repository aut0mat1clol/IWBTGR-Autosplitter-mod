image_yscale=260/32
i=id
o="with (FallingCeiling) vspeed=mmf_speed(7)
with (spikeDown) if (collision_rectangle(832,192,1568,224,id,false,false)) vspeed=mmf_speed(7)
with (FallingCeilingSpike) vspeed=mmf_speed(7)
instance_create(808,448,FallingCeilingWall)
play_sound('metal2short')
"
