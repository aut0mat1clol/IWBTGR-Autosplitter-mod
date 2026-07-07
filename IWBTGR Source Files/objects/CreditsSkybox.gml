#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (view_xview[0]==room_width-800 && view_yview[0]==0) exit

draw_clear(0)

//forest room 1 & 2
rect(0,768,1600,608,$f7d7c4,1)

//tyson
rect(0,1408,800,608,$651903,1)
draw_rectangle_color(0,304+1408,800-1,560-1+1408,$641902,$641902,$F7D7C3,$F7D7C3,0)
draw_rectangle_color(0,560+1408,800-1,608-1+1408,$F7D7C3,$F7D7C3,$F7D7C3,$F7D7C3,0)

//sky room
rect(0,768,800,608,$f7d7c4,1)

//guy1
rect(832,1376,800,608,$becad6,1)

//castlevania
draw_rectangle_color(1664,2880,1664+799,2880+607,0,0,$640000,$640000,0)
draw_background_stretched(bgDracula,64,2880,800,608)

//graveyard
draw_rectangle_color(1760,768+608,1760+1600-1,768+1216-1,0,0,$8b0000,$8b0000,0)

//kraid
draw_rectangle_color(1792,2112,1792+800-1,2112+608-1,$ffffff,$ffffff,$c38282,$c38282,0)
draw_rectangle_color(1792+800,2112,1792+1600-1,2112+608-1,$244e7D,$244e7D,0,0,0)

//road
draw_rectangle_color(64,3968,64+2400-1,3968+228-1,0,0,$ff0000,$ff0000,0)

//factory
draw_rectangle_color(3168,3680,3168+800-1,3680+608-1,0,0,$750000,$750000,0)
draw_rectangle_color(3168,3680+608,3168+800-1,3680+608+163-1,$750000,$750000,$ff,$ff,0)
