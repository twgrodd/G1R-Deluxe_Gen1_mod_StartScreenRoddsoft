# G1R Deluxe — RoddSoft Edition Start Screen

A small **G1R Deluxe / Gen1Recomp API 2** graphics mod for the Gen 1 games.

It changes the Red/Blue title-screen version ribbon to **RoddSoft Edition**.
On Yellow, which has no normal version ribbon, it adds the same branding to
the existing Pikachu title composition while preserving Yellow's logo,
Pikachu, speech bubble, blinking animation, cries, menu, and copyright art.

## Compatibility

- G1R Deluxe / Gen1Recomp Mod API 2
- Pokémon Red
- Pokémon Blue
- Pokémon Yellow
- Engine range: `>=0.0.0-0 <2.0.0`

## How it works

Red and Blue use Gen1Recomp's supported `field.boot.title.versionRibbon`
content seam. The mod supplies:

```lua
mod.content.field:patch("boot", {
  title = {
    versionRibbon = mod.path .. "/assets/roddsoft_edition.png",
  },
})
```

Yellow's stock title renderer intentionally does not draw a version ribbon.
For Yellow only, the mod uses the `engine_internals` permission to extend
`TitleState:draw()` after the normal Yellow composition has rendered, adding
the authored RoddSoft artwork beneath the Pokémon logo. The rest of Yellow's
title behavior remains the stock G1R Deluxe implementation.

## Asset

`assets/roddsoft_edition.png` is original mod artwork: a transparent
128×16 image containing “RoddSoft Edition”. It is not extracted from the
game ROM.

## Install

Install the release ZIP using G1R Deluxe's normal mod workflow and enable
**RoddSoft Edition Title Screen**.

A valid import for the Gen 1 game being played is still required by G1R
itself.

## Repository

`twgrodd/G1R-Deluxe_Gen1_mod_StartScreenRoddsoft`
