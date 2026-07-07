#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
state=0

image_speed=0

image_xscale=2
image_yscale=2
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=0) {
    if (inside_view()) {
        state=1
        play_sound("alarm")
    }
}
if (state=1) {
    visible=1
    f=min(7,f+0.25)
    if (f==7) {
        state=2
    }
}
if (state=2) {
    f=8
    timer+=1
    if (!(timer mod 4)) instance_create(x+irandom_range(-6,6)*2,y+irandom_range(-6,6)*2,KamekSparkle)
    if (timer>28) {
        f=9
        state=3
        timer=0
        instance_create(x,y,Playstation)
        play_sound("magic")
    }
}

if (state=3) {
    timer+=1
    f=9+(timer mod 16<8)
    if (timer=32) {
        state=4
        f=7
    }
}

if (state=4) {
    f=max(0,f-0.25)
    if (f==0) instance_destroy()
}

image_index=f
image_xscale=sign(global.px-x)*2
if (image_xscale=0) image_xscale=-2
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (state=1 || state=4) draw_set_blend_mode(bm_add)
draw_self()
if (state=1 || state=4) draw_set_blend_mode(0)
