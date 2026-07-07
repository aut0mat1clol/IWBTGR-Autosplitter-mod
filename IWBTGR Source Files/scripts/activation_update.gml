if (room=rGuyLabyrinth) exit

instance_deactivate_object(playerKiller)
instance_deactivate_object(block)
instance_deactivate_object(trigger)
instance_deactivate_object(decoParent)
instance_deactivate_object(platform)
instance_deactivate_object(Eggplant)

instance_activate_region(view_xview[0]-800+4,view_yview[0]-608+4,800*3-8,608*3-8,1)

instance_activate_object(WheelTrap)
instance_activate_object(MoonBigFall)
instance_activate_object(TysonFist)
instance_activate_object(KillPill)
instance_activate_object(DumbBugz)
instance_activate_object(Dracform)
instance_activate_object(FunnyRenexPainting)
instance_activate_object(ClownCar)

with (movingPlatform) instance_activate_region(bbox_left-8,bbox_top-8,bbox_right-bbox_left+16,bbox_bottom-bbox_top+16,1)
