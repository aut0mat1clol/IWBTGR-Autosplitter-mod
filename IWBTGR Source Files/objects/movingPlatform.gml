#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (
    bbox_right>view_xview[0]+800+800 ||
    bbox_left<view_xview[0]-800 ||
    bbox_top<view_yview[0]-608 ||
    bbox_bottom>view_yview[0]+608+608
) {
    x-=hspeed
    y-=vspeed
}

if (object_index!=metroidPlatform && object_index!=OwataPlatform && !(object_index==LongForm && room==rGuyTower) && object_index!=FallingBrick && object_index!=FactoryPlatform && object_index!=EggPlatform && object_index!=FallingFort && object_index!=OutskirtPlatform && object_index!=AscentPlatform) {
    if (!place_free(x+hspeed,y)) {
        hspeed=-hspeed;
        if (stopper) hspeed=0
    }
    if (!place_free(x,y+vspeed+yspeed)) {
        if (vspeed!=0) {
            yspeed=-vspeed;
            vspeed=0;
        }
        else {
            vspeed=-yspeed;
            yspeed=0;
        }
        if (stopper) {vspeed=0 yspeed=0}
    }
}

y+=yspeed;

a=instance_place(x,y-2,player)
with (a) {
    y+=other.yspeed;
    if (!other.nopush || onPlatform) if (place_free(x+other.hspeed,y)) x+=other.hspeed;
}

if (vspeed<0) {
    yspeed=vspeed;
    vspeed=0;
}

if (yspeed>0) {
    vspeed=yspeed;
    yspeed=0;
}
#define Collision_blockNise
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=113
applies_to=self
invert=0
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=114
applies_to=self
invert=0
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_sprite(sprite_index,image_index,floor(x),floor(y))
