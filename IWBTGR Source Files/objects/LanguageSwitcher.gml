#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
image_speed=0
image_index=global.language
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
if (mouse_check_button_pressed(mb_left) && instance_position(global.mx,global.my,id)) {
    play_sound("switch")
    global.language=(global.language+1) mod 3
    image_index=global.language
    settings("language",global.language)

    load_lang()

    with (OptsCtrl) {
        ds_list_clear(dips)
        load_dips()
    }
    with (FilesDataHolder) event_perform(ev_create,0)

    with (FilesCursor) selected=0

    with (FilesCtrl) event_user(0)
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
draw_self()
draw_set_halign(2)
global.halign=2
draw_text_lang(x-8,y,lang("languagepick"))
draw_set_halign(0)
global.halign=0
