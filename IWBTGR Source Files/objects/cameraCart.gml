#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (Dragon.active) {
    if (!Dragon.phase) {
        view_xview[0]=floor(Dragon.x)+150-400
    }
    with (player) if (!inside_view()) killPlayer(cameraCart)
} else if (instance_exists(player)) if (Cart.dead) {
    view_xview[0]=max(min(view_xview[0],22368+32),player.x-400)
} else {
    view_xview[0]=Cart.x+54-400
    if (view_xview[0]>player.x) killPlayer(cameraCart)
}

if (savedata("orb_dragon")) view_xview[0]=min(view_xview[0],21856)

gameOver.x=view_xview[0]+400

if (abs(view_xview[0]-ox)>32) {
    ox=view_xview[0]
    activation_update()
    instance_activate_object(RoadBulletBill)
    instance_activate_object(RoadCheep)
}

with (RoadSkybox) event_user(0)
