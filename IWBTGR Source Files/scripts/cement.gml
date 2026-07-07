///cement(object)
//This coalesces large rows of colliders into very long blocks to reduce instance count
var coll;

//each pass reduces instance count by almost half so with 2 passes we should have around 25% of instances
repeat (2) {
    with (argument[0]) {
        if (object_index=argument[0]) {
            coll=instance_place(x+1,y,argument[0])
            if (coll) if (!place_meeting(x,y,coll)) if (!coll.owner && sign(image_xscale)=sign(coll.image_xscale) && y=coll.y && image_yscale=coll.image_yscale && coll.object_index=argument[0]) {
                image_xscale+=coll.image_xscale
                with (coll) instance_destroy()
            }
        }
    }
    with (argument[0]) {
        if (object_index=argument[0]) {
            coll=instance_place(x,y+1,argument[0])
            if (coll) if (!place_meeting(x,y,coll)) if (!coll.owner && sign(image_yscale)=sign(coll.image_yscale) && x=coll.x && image_xscale=coll.image_xscale && coll.object_index=argument[0]) {
                image_yscale+=coll.image_yscale
                with (coll) instance_destroy()
            }
        }
    }
}
