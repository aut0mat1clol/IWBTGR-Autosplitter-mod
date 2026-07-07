with (musicChanger) if (inside_view()) return song

switch (room) {
    case rFiles:            return "saveselect"
    case rGuy1:             return "12"
    case rZelda:            return "zeldamusic (2)"
    case rGraveyard:        return "ghoulsandgoblins (2)"
    case rKraidgiefLair:    return "kirby"
    case rMegaman:          return "001 megaman2"
    case rMetroid:          return "tourian"
    case rBowserBoss:       return "001 megaman2"
    case rFactoryOutskirts: return "001 BionicCommando (2)"
    case rCastlevania:      return "castlevania"
    case rGuyEntrance:      return "castleenterance"
    case rGuyRoad:          return "DuckTales"
    case rGuyFortress1:
    case rGuyLabyrinth:
    case rGuyFortress2:     return "montyontherun (2)"
    case rGuyTower:         return "bolbox"
    case rGuyBoss:          return "bolbox"
    case rEnding:           return "mariofall"
    case rDev:              return "WiiShop"
}

return ""
