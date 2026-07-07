#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
life=400
nonstick=1
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
move_towards_point(global.px,global.py,mmf_speed(20))
repeat (3) instance_create(random_range(x-32,x+32),random_range(y-32,y+32),DracSplosion)
life-=1
if (life<=0) instance_destroy()
