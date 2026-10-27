# Deep Space Station Alpha

**A Commodore 64 BASIC V2 sci-fi horror text adventure**, made for the VICE C64SC emulator.

Inspired by my childhood love of Commodore 64 word games and text adventures—especially the Spider-Man game I remember playing. I wanted to recapture that feeling of typing commands, solving puzzles, discovering traps, and laughing at over-the-top 1980s action-movie dialogue.

## Play

1. Open **VICE C64SC**.
2. Drag `deep_space_station_alpha_v29.prg` into the emulator.
3. If needed, type `RUN` at the BASIC prompt.

The `.prg` is the ready-to-run Commodore 64 program. The `.bas` is the readable BASIC source code; it is not itself a directly executable C64 disk image.

## Commands

- `look` — describe the current room
- `go n`, `go s`, `go e`, `go w` — move between rooms
- `get <item>` — pick up an item
- `use <item>` — use a tool or console
- `search <thing>` — investigate a feature
- `inv` — inspect inventory
- `help` — repeat the commands
- `quit` — exit

For the console prompts, **press Y or N directly (no Enter)**.

## The adventure

You are a lone black-ops agent sent to investigate a derelict space station. A tentacled alien attacks your ship during docking. Explore the station, find all **three distinct crystals** (red, blue, and green), and reach the escape pod—if you survive the traps.

The game has seven locations: Docking Bay, Corridor, Control Room, Laboratory, Storage, Living Quarters, and Escape Pod Bay.

## Development notes

- Language: Commodore 64 BASIC V2
- Emulator target: VICE C64SC
- Program load address: `$0801`
- BASIC V2 does **not** support `ELSE`, and variable names are significant only in their first two characters.
- The `.prg` has tokenized BASIC and PETSCII display encoding.
- Packaged game version: **v29**.

**Code-only release.** No artwork or sketches are included.
