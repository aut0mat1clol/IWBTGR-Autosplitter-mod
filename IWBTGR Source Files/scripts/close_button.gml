if (game_started) {
    with (ErrorTrap) {
        if (inside_view()) {
            event_user(0)
            exit
        }
    }

    with (OptsCtrl) {
        if (setcontrols=2) {
            setcontrols=0
            sel=0
            exit
        }
    }

    save_settings()
    update_deathtime()
    commit_save()
}
game_end()
