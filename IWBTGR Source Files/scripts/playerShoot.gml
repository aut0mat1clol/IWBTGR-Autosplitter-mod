if (room!=rCredits) {
    if (vic) {
        if (bullet_number()<3) {
            instance_create(x,y,bullet)
            play_sound("vicshoot")
        }
    } else if (owater) {
        if (charnge>75) {
            i=instance_create(x,y-4,bullet)
            i.sprite_index=sprOwataBullet
            i.image_speed=0
            i.image_index=1
            i.mask_index=-1
            i.damage=8
            play_sound("fire4")
            settings("owataseen",1)
        } else if (!charnge || charnge>50 || global.autofire) if (instance_number(bullet)<3) {
            i=instance_create(x,y-4,bullet)
            i.sprite_index=sprOwataBullet
            i.image_speed=0
            play_sound("fire3")
        }
    } else  {
        if (bullet_number()<4) {
            instance_create(x,y-2,bullet)
            play_sound("fire2")
        }
    }

    owatershot=20
    with (Gastly) fire=1

    if (!place_meeting(x,y,SoftlockBlocker) && !place_meeting(x,y,playerKiller)) {
        //contact saves
        with (saveBoshy) if (place_meeting(x,y,player)) event_user(0)
        with (saveVeryHard) if (place_meeting(x,y,player)) event_user(0)
        with (PlatformReset) if (place_meeting(x,y,player)) event_user(0)
        with (RyuButton) if (place_meeting(x,y,player)) event_user(1)
        with (TextBlock) if (place_meeting(x,y,player)) event_user(0)
    }
}
