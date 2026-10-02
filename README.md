# G1R Deluxe — RoddSoft Edition Start Screen

A small **G1R Deluxe / Gen1Recomp API 2** graphics mod for Pokémon Red.

It changes the title-screen version ribbon from **Red Version** to
**RoddSoft Edition**, while keeping the normal Pokémon logo, animated title
Pokémon, trainer art, title-screen sequence, menu, and copyright art.

## Compatibility

- G1R Deluxe / Gen1Recomp Mod API 2
- Pokémon Red
- Engine range: `>=0.0.0-0 <2.0.0`

## How it works

Current Gen1Recomp's `src/ui/TitleState.lua` reads title branding from
`field.title`, then overlays values supplied through `field.boot.title`.
The `versionRibbon` key is specifically supported as a continuous title
ribbon and is centered by the stock title renderer.

This mod patches only:

```lua
mod.content.field:patch("boot", {
  title = {
    versionRibbon = mod.path .. "/assets/roddsoft_edition.png",
  },
})
```

That means it does **not** replace the whole title state and does not need to
ship any graphics extracted from a Pokémon ROM.

## Asset

`assets/roddsoft_edition.png` is original mod artwork: a transparent
128×16 pixel ribbon containing “RoddSoft Edition” in a compact retro
pixel style. It is not extracted from the game ROM.

The source generator is included as `tools/make_assets.py`.

## Install

Place the mod folder in G1R Deluxe's `mods` directory (or install it using
the launcher's normal mod workflow), then enable **RoddSoft Edition Title
Screen**.

A valid Pokémon Red import is still required by G1R itself.

## Repository

`twgrodd/G1R-Deluxe_Gen1_mod_StartScreenRoddsoft`
