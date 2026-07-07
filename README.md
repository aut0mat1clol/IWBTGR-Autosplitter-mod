# IWBTGR Autosplitter Room Reference

This is a short reference for the selectable room/orb splits in `IWBTGR.asl`.

## Important note

In IWBTGR, a **room** is not the same as a screen.

- **Room** = a GameMaker room, usually a large area like `rGuy1`, `rMegaman`, or `rFactoryOutskirts`.
- **Screen** = one camera screen inside a room, usually `800x608`.

The current autosplitter supports **room entry splits**, not individual screen splits.

Room splits happen when entering a room. They do **not** mean the section was completed.

Example:

```text
room_rCastlevania = split when entering Castlevania area
orb_dracula      = split when Dracula is cleared / orb is awarded
```

## Main room order

Approximate normal progression:

```text
rGuy1
→ rZelda
→ rGraveyard
→ rMechaBirdoBoss
→ rMegaman
→ rBowserBoss
→ rMetroid
→ rFactoryOutskirts
→ rCastlevania
→ rDraculaBoss
→ rGuyEntrance
→ rGuyRoad
→ rGuyFortress1
→ rGuyLabyrinth
→ rGuyFortress2
→ rGuyTower
→ rGuyBoss
→ rEnding
→ rCredits
```

The route is somewhat non-linear, so some rooms can be entered in different orders.

## Room splits

| Room | Meaning |
|---|---|
| `rGuy1` | Starting gameplay area with Tyson bossfight. Usually not needed if you already start on New Game. |
| `rZelda` | Zelda section. |
| `rGraveyard` | Graveyard / path to Mecha Birdo. |
| `rMechaBirdoBoss` | Mecha Birdo boss room. Use `orb_birdo` for the clear. |
| `rKraidgiefLair` | Kraidgief lair (From Tetris to Kraidgief enterence). |
| `rKraidgiefBoss` | Kraidgief boss room. Use `orb_kraidgief` for the clear. |
| `rMegaman` | Mega Man area (After Kraidgief Fight, leads to Bowser and Metroid). |
| `rBowserBoss` | Bowser boss room. Use `orb_bowser` for the clear. |
| `rMetroid` | Metroid / Motherbrain area. Use `orb_mother` for the clear. |
| `rFactoryOutskirts` | Factory/outskirts hub area (After Metroid and MechaBirdo fights, leads to `rGuyEnterance`). |
| `rCastlevania` | Castlevania section before `rDraculaBoss`. |
| `rDraculaBoss` | Dracula boss room. Use `orb_dracula` for the clear. |
| `rGuyEntrance` | Palace entrance and warps to beginning. |
| `rGuyRoad` | Trolley / Dragon section. Use `orb_dragon` for the clear. |
| `rGuyFortress1` | Guy Fortress 1 (before Labyrinth). |
| `rGuyLabyrinth` | Guy Labyrinth. |
| `rGuyFortress2` | Guy Fortress 2 (after Labyrinth). |
| `rGuyTower` | Final tower. |
| `rGuyBoss` | The Guy boss room. Use `orb_guy` for the clear. |
| `rEnding` | Ending sequence. |
| `rCredits` | Credits. |

## Menu / special rooms

Usually do not use these for normal runs:

| Room | Meaning |
|---|---|
| `rInit` | Startup logo. |
| `rTitle` | Title screen. |
| `rFiles` | File select. |
| `rBossRush` | Boss Rush hub. |
| `rDev` | Dev/secret room. |
| `rUnlocks` | Unlock screen after ending. |

## Orb / boss splits

Orb splits are usually better than boss-room entry splits, because they happen when the boss/progression is actually cleared.

| ASL setting | Meaning |
|---|---|
| `orb_tyson` | Tyson clear / orb awarded. |
| `orb_mother` | Mother Brain clear / orb awarded. |
| `orb_bowser` | Bowser clear / orb awarded. |
| `orb_birdo` | Mecha Birdo clear / orb awarded. |
| `orb_dracula` | Dracula clear / orb awarded. |
| `orb_kraidgief` | Kraidgief clear / orb awarded. |
| `orb_dragon` | Dragon section cleared. |
| `orb_guy` | The Guy / ending clear. Recommended final split. |

## Recommended setup

For a normal run, use mostly orb splits:

```text
orb_tyson
orb_mother
orb_bowser
orb_birdo
orb_dracula
orb_kraidgief
orb_dragon
orb_guy
```

Optional room-entry splits for major late-game sections:

```text
rGuyRoad
rGuyFortress1
rGuyTower
rGuyBoss
rEnding
```

Avoid these unless you specifically need them:

```text
rInit
rTitle
rFiles
```
