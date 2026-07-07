image_xscale=72/32
image_yscale=99/32
i=id
o="instance_create(128,896,Kraidgief)"

if (savedata("orb_kraidgief")) {
    cameraKraid.locked=false
    with (blockTrapDestructible) instance_destroy()
    with (KraidgiefCeiling) instance_destroy()
    with (DestroyedBlock) instance_destroy()
    with (spikeUp) instance_destroy()
    instance_destroy()
}
