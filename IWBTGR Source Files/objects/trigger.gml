#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///readme

/*
HOW TO USE TRIGGERS

put the trap in the room, note its instance id

put down a trigger, add creation code:

(set scale idk)
i=trap id
o="code that runs only once"
t="code that runs once every touch"
c="code that runs every frame while touching"

code is ran on the trap's scope, and sets "active" to 1 on the trap instance for 1 frame

if you need to activate multiple objects, use with() blocks in the appropriate code point
*/


alarm[1]=1
lock=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
active=0

instance_activate_object(i)
i.active=0
#define Alarm_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (is_real(t)) t=""
if (is_real(c)) c=""
if (is_real(o)) o=""
if (t="" && c="" && o="" && i=0) {
    //empty trigger...
    visible=1
}
#define Trigger_post-movement
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (instance_place(x,y,player)) {
    if (!active) {
        active=1
        alarm[0]=2
        instance_activate_object(i)
        with (i) {active=1 if (other.t!="") execute_string(other.t)}
    }

    if (!lock && o!="") {
        lock=1
        instance_activate_object(i)
        with (i) execute_string(other.o)
    }

    if (c!="") {
        instance_activate_object(i)
        with (i) execute_string(other.c)
    }
}
