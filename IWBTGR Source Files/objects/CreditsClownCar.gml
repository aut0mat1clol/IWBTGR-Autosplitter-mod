#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase==0) {
    eyes=-1
    driver_image=5
} else if (phase==1) {
    eyes=-1
} else if (phase==2) {
    eyes=1
    driver_image=8
}
image_xscale=3
image_yscale=3
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
prop+=0.5
if (phase==2) {
    if (floor(prop)!=floor(prop-0.5)) driver_image+=1
    if (driver_image>=10) driver_image-=2
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
vspeed=mmf_speed(10)
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (phase == 1 && driver_image >= 0) {
    draw_sprite_ext(sprWart,driver_image,x,y,image_xscale,image_yscale,image_angle,c_white,1)
}
draw_self()
if (phase < 2) {
    draw_sprite_ext(sprPropeller,prop,x,y,image_xscale,image_yscale,image_angle,c_white,1)
} else {
    draw_sprite_ext(sprBowserRocket,prop,x,y,image_xscale,image_yscale,image_angle,c_white,1)
}
if (eyes >= 0) {
    draw_sprite_ext(sprClownCarEyes,eyes,x,y,image_xscale,image_yscale,image_angle,c_white,1)
}
if (driver_image >= 0) {
    if (phase == 0) {
        draw_sprite_ext(sprBowser,driver_image,x,y,image_xscale,image_yscale,image_angle,c_white,1)
    } else if (phase == 2) {
        draw_sprite_ext(sprWily,driver_image,x,y,image_xscale,image_yscale,image_angle,c_white,1)
    }
}
