//envelope renderer
//version 3
//renex 2020

//we create these at runtime to make sure that their events will
//always execute last, which prevents "mystery gm8 issues".
//depth 15999 is countermeasure for d3d8 culling which happens at 16k.
o=object_add()
object_event_add(o,ev_step,ev_step_end,"with (world) screen_finish()")
object_event_add(o,ev_draw,0,"with (world) screen_compose()")
object_set_persistent(o,1)
object_set_depth(o,-15999)
instance_create(0,0,o)

globalvar clickX,clickY,clickM;

global.screen_manager=o

screen_prepare()
