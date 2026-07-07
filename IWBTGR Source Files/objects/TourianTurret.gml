#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
c=130
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (active) {
    c+=1
    if (c==80) {
        if (instance_exists(player)) {
            i=(instance_create(x+lengthdir_x(28,pointing),y+lengthdir_y(28,pointing),TourianTurretBullet))
            i.direction=pointing
            i.speed=mmf_speed(50)
            i.image_index=image_index
            i.image_angle=image_angle
        }
    }
    if (c==140) {
        if (instance_exists(player)) pointing=round(point_direction(x,y,global.px,global.py)/45)*45
        else pointing=round(point_direction(x,y,view_xview[0]+400,view_yview[0]+304)/45)*45
        image_index=!!(pointing mod 90)
        image_angle=(pointing div 90)*90
        c=0
    }
} else if (inside_view()) active=1
