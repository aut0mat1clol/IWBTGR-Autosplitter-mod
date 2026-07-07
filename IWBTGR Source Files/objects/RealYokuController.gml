#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sequence="012345"
sequel="31302945"
use_sequel=false
pos=0
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
var blok;
var seq;
if (use_sequel) seq=sequel
else seq=sequence

pos=pos+1
if (pos > string_length(seq)) {
    pos=1
}

blok=real(string_char_at(seq,pos))
if (blok == 9) {
    with (RealYoku) {
        if (my_id == 2 || my_id == 3) {
            event_user(0)
        }
    }
} else {
    with (RealYoku) {
        if (my_id == blok) {
            event_user(0)
        }
    }
}

play_sound("megamanappear")

alarm[0]=100
#define Collision_player
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (pos == 5 && !use_sequel) {
    use_sequel=true
    pos=0
}
