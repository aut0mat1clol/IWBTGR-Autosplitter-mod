# IWBTGR Autosplitter Mod

A **modified build** of [I Wanna Be The Guy Remastered](https://cherry-treehouse.itch.io/iwbtgr) (v1.5.3) with built-in autosplitter support for [LiveSplit](https://livesplit.org/).

This repository contains:

- **`IWBTGR.exe`** — patched GM8.2 build that writes live game state to `save/autosplitter.txt` at runtime.
- **`IWBTGR.asl`** — LiveSplit script that reads that file and triggers start / reset / split events.
- **`IWBTGR Source Files/`** — modified GameMaker source files used to produce the patched build.

---

## Installation

### 1. Game

Replace your original `IWBTGR.exe` with the patched one from this repository (or use it as a separate install). The patched build is identical to the original except it writes `save/autosplitter.txt` during gameplay.

### 2. LiveSplit

1. In LiveSplit, right-click → **Edit Splits…** and set the game name to **I Wanna Be The Guy Remastered**.
2. Right-click → **Edit Layout…** → **Add** → **Control** → **Scriptable Auto Splitter**.
3. In the Scriptable Auto Splitter settings, browse to `IWBTGR.asl`.
4. Check/uncheck the splits you want under the auto splitter settings panel.

---

## Important note

In IWBTGR, a **room** is not the same as a screen.

- **Room** = a GameMaker room, usually a large area like `rGuy1`, `rMegaman`, or `rFactoryOutskirts`.
- **Screen** = one camera screen inside a room, usually `800×608`.

The current autosplitter supports **room entry splits**, not individual screen splits.

Room splits happen when entering a room. They do **not** mean the section was completed.

Example:

```text
room_rCastlevania = split when entering Castlevania area
orb_dracula       = split when Dracula is cleared / orb is awarded
```

---

## Settings

| Setting | Default | Description |
|---|---|---|
| `start` | ✅ | Auto-start the timer on New Game (entering `rGuy1`). |
| `reset_title` | ✅ | Auto-reset when returning to the title screen. |
| `orbs` | ✅ | Enable orb / boss splits (see below). |
| `rooms` | ❌ | Enable room-entry splits (see below). |
| `room_once` | ✅ | Split each selected room only once per run. |

---

## Room splits

| Room | Meaning |
|---|---|
| `rGuy1` | Starting gameplay area with Tyson boss fight. Usually not needed if you auto-start on New Game. |
| `rZelda` | Zelda section. |
| `rGraveyard` | Graveyard / path to Mecha Birdo. |
| `rMechaBirdoBoss` | Mecha Birdo boss room. Use `orb_birdo` for the clear. |
| `rKraidgiefLair` | Kraidgief lair (from Tetris to Kraidgief entrance). |
| `rKraidgiefBoss` | Kraidgief boss room. Use `orb_kraidgief` for the clear. |
| `rMegaman` | Mega Man area (after Kraidgief fight, leads to Bowser and Metroid). |
| `rBowserBoss` | Bowser boss room. Use `orb_bowser` for the clear. |
| `rMetroid` | Metroid / Mother Brain area. Use `orb_mother` for the clear. |
| `rFactoryOutskirts` | Factory/outskirts hub area (after Metroid and Mecha Birdo fights, leads to `rGuyEntrance`). |
| `rCastlevania` | Castlevania section before `rDraculaBoss`. |
| `rDraculaBoss` | Dracula boss room. Use `orb_dracula` for the clear. |
| `rGuyEntrance` | Palace entrance and warps to beginning. |
| `rGuyRoad` | Trolley / Dragon section. Use `orb_dragon` for the clear. |
| `rGuyFortress1` | Guy Fortress 1 (before Labyrinth). |
| `rGuyLabyrinth` | Guy Labyrinth. |
| `rGuyFortress2` | Guy Fortress 2 (after Labyrinth). |
| `rGuyTower` | Final tower. |
| `rGuyBoss` | The Guy boss room. Use `orb_guy` for the clear. |

---

## Menu / special rooms

Usually do **not** use these for normal runs:

| Room | Meaning |
|---|---|
| `rInit` | Startup logo. |
| `rTitle` | Title screen. |
| `rFiles` | File select. |
| `rBossRush` | Boss Rush hub. |
| `rDev` | Dev/secret room. |
| `rUnlocks` | Unlock screen after ending. |
| `rEnding` | Ending sequence. |
| `rCredits` | Credits. |

---

## Orb / boss splits

Orb splits are usually **better** than boss-room entry splits, because they fire when the boss/progression is actually cleared.

| ASL setting | Meaning |
|---|---|
| `orb_tyson` | Tyson clear / orb awarded. |
| `orb_birdo` | Mecha Birdo clear / orb awarded. |
| `orb_kraidgief` | Kraidgief clear / orb awarded. |
| `orb_bowser` | Bowser clear / orb awarded. |
| `orb_mother` | Mother Brain clear / orb awarded. |
| `orb_dracula` | Dracula clear / orb awarded. |
| `orb_dragon` | Dragon section cleared. |
| `orb_guy` | The Guy / ending clear. Recommended final split. |

---

## Recommended setup

For a normal run, use mostly orb splits (ordered by progression):

```text
orb_tyson
orb_birdo
orb_kraidgief
orb_bowser
orb_mother
orb_dracula
orb_dragon
orb_guy
```

Optional room-entry splits for major late-game sections:

```text
rGuyRoad
rGuyFortress1
rGuyLabyrinth
rGuyTower
rEnding
```

---

## How it works

The patched `IWBTGR.exe` writes live game state to `save/autosplitter.txt` with fields like:

```text
event_id=42
event=orb
detail=orb_dracula
room_name=rDraculaBoss
deaths=17
```

The `IWBTGR.asl` script polls this file at ~20 Hz and triggers LiveSplit start / reset / split based on the configured settings. Room-entry splits are deduplicated (each room splits at most once per run when `room_once` is enabled).

The modifications to the game source can be found in the `IWBTGR Source Files/` directory.
