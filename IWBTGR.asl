// I Wanna Be The Guy Remastered 1.5.3 - selectable file-state autosplitter
// Requires the patched GM8.2 build that writes save/autosplitter.txt.

state("IWBTGR")
{
}

startup
{
    refreshRate = 20;

    // General
    settings.Add("start", true, "Start on New Game");
    settings.Add("reset_title", false, "Reset when returning to title");

    // Orb / boss split settings
    settings.Add("orbs", true, "Orb / Boss Splits");
    settings.Add("orb_tyson", true, "Tyson", "orbs");
    settings.Add("orb_mother", true, "Mother Brain", "orbs");
    settings.Add("orb_bowser", true, "Bowser", "orbs");
    settings.Add("orb_birdo", true, "Mecha Birdo", "orbs");
    settings.Add("orb_dracula", true, "Dracula", "orbs");
    settings.Add("orb_kraidgief", true, "Kraidgief", "orbs");
    settings.Add("orb_dragon", true, "Dragon", "orbs");
    settings.Add("orb_guy", true, "The Guy / Ending", "orbs");

    // Room split settings. Disabled by default because most normal routes split by boss/orb.
    settings.Add("rooms", false, "Room Entry Splits");
    settings.Add("room_once", true, "Split each selected room only once per run", "rooms");
    settings.Add("room_rInit", false, "rInit (Startup Logo)", "rooms");
    settings.Add("room_rTitle", false, "rTitle", "rooms");
    settings.Add("room_rFiles", false, "rFiles", "rooms");
    settings.Add("room_rBossRush", false, "rBossRush", "rooms");
    settings.Add("room_rGuy1", false, "rGuy1", "rooms");
    settings.Add("room_rZelda", false, "rZelda", "rooms");
    settings.Add("room_rGraveyard", false, "rGraveyard", "rooms");
    settings.Add("room_rMechaBirdoBoss", false, "rMechaBirdoBoss", "rooms");
    settings.Add("room_rKraidgiefLair", false, "rKraidgiefLair", "rooms");
    settings.Add("room_rKraidgiefBoss", false, "rKraidgiefBoss", "rooms");
    settings.Add("room_rMegaman", false, "rMegaman", "rooms");
    settings.Add("room_rBowserBoss", false, "rBowserBoss", "rooms");
    settings.Add("room_rMetroid", false, "rMetroid", "rooms");
    settings.Add("room_rFactoryOutskirts", false, "rFactoryOutskirts", "rooms");
    settings.Add("room_rCastlevania", false, "rCastlevania", "rooms");
    settings.Add("room_rDraculaBoss", false, "rDraculaBoss", "rooms");
    settings.Add("room_rGuyEntrance", false, "rGuyEntrance", "rooms");
    settings.Add("room_rGuyRoad", false, "rGuyRoad", "rooms");
    settings.Add("room_rGuyFortress1", false, "rGuyFortress1", "rooms");
    settings.Add("room_rGuyLabyrinth", false, "rGuyLabyrinth", "rooms");
    settings.Add("room_rGuyFortress2", false, "rGuyFortress2", "rooms");
    settings.Add("room_rGuyTower", false, "rGuyTower", "rooms");
    settings.Add("room_rGuyBoss", false, "rGuyBoss", "rooms");
    settings.Add("room_rDev", false, "rDev", "rooms");
    settings.Add("room_rEnding", false, "rEnding", "rooms");
    settings.Add("room_rCredits", false, "rCredits", "rooms");
    settings.Add("room_rUnlocks", false, "rUnlocks", "rooms");

    vars.currentEventId = -1;
    vars.previousEventId = -1;
    vars.currentEvent = "";
    vars.currentDetail = "";
    vars.currentRoom = "";
    vars.oldRoom = "";
    vars.currentDeaths = 0;
    vars.previousDeaths = 0;
    vars.changed = false;
    vars.statePath = "";
    vars.splitRooms = new System.Collections.Generic.HashSet<string>();

    vars.GetValue = (Func<string, string, string>)((text, key) => {
        var prefix = key + "=";
        foreach (var rawLine in text.Split('\n')) {
            var line = rawLine.Trim('\r', '\n', ' ');
            if (line.StartsWith(prefix)) {
                return line.Substring(prefix.Length);
            }
        }
        return "";
    });

    vars.GetInt = (Func<string, string, int, int>)((text, key, fallback) => {
        int value;
        var raw = vars.GetValue(text, key);
        return Int32.TryParse(raw, out value) ? value : fallback;
    });
}

init
{
    vars.currentEventId = -1;
    vars.previousEventId = -1;
    vars.currentEvent = "";
    vars.currentDetail = "";
    vars.currentRoom = "";
    vars.oldRoom = "";
    vars.currentDeaths = 0;
    vars.previousDeaths = 0;
    vars.changed = false;
    vars.splitRooms.Clear();

    vars.statePath = System.IO.Path.Combine(
        System.IO.Path.GetDirectoryName(modules.First().FileName),
        "save",
        "autosplitter.txt"
    );

    print("IWBTGR autosplitter state path: " + vars.statePath);
}

update
{
    vars.changed = false;

    try {
        if (!System.IO.File.Exists(vars.statePath)) {
            return true;
        }

        var text = System.IO.File.ReadAllText(vars.statePath);
        var eventId = vars.GetInt(text, "event_id", -1);

        if (eventId != vars.currentEventId) {
            vars.previousEventId = vars.currentEventId;
            vars.previousDeaths = vars.currentDeaths;

            // Store the previous room before reading the new event.
            vars.oldRoom = vars.currentRoom;

            vars.currentEventId = eventId;
            vars.currentEvent = vars.GetValue(text, "event");
            vars.currentDetail = vars.GetValue(text, "detail");
            vars.currentRoom = vars.GetValue(text, "room_name");
            vars.currentDeaths = vars.GetInt(text, "deaths", vars.currentDeaths);
            vars.changed = true;

            print("IWBTGR ASL event " + eventId + ": " + vars.currentEvent + " / " + vars.currentDetail + " / " + vars.currentRoom + " / old room " + vars.oldRoom + " / deaths " + vars.currentDeaths);
        }
    } catch (Exception e) {
        print("IWBTGR ASL read error: " + e.Message);
    }

    return true;
}

start
{
    return settings["start"] && vars.changed && vars.currentRoom == "rGuy1";
}

onStart
{
    vars.splitRooms.Clear();
    vars.oldRoom = "";
}

onReset
{
    vars.splitRooms.Clear();
    vars.oldRoom = "";
}

reset
{
    return settings["reset_title"] && vars.changed && vars.currentEvent == "room" && vars.currentRoom == "rTitle";
}

split
{
    if (!vars.changed) {
        return false;
    }

    // Selectable orb / boss splits.
    if (settings["orbs"] && vars.currentEvent == "orb") {
        var settingId = vars.currentDetail; // e.g. orb_tyson, orb_guy
        if (settings.ContainsKey(settingId) && settings[settingId]) {
            return true;
        }
    }

    // Selectable room-entry splits.
    if (settings["rooms"] && vars.currentEvent == "room") {
        var roomSettingId = "room_" + vars.currentRoom; // e.g. room_rGuy1

        if (!settings.ContainsKey(roomSettingId) || !settings[roomSettingId]) {
            return false;
        }

        if (vars.oldRoom == vars.currentRoom) {
            print("IWBTGR ASL ignored room split because old room == current room: " + vars.currentRoom);
            return false;
        }

        if (vars.currentDeaths > vars.previousDeaths) {
            print("IWBTGR ASL ignored room split after death/reset: " + vars.currentRoom);
            return false;
        }

        if (settings["room_once"]) {
            if (vars.splitRooms.Contains(vars.currentRoom)) {
                print("IWBTGR ASL ignored repeated room split: " + vars.currentRoom);
                return false;
            }

            vars.splitRooms.Add(vars.currentRoom);
        }

        return true;
    }

    return false;
}
