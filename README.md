# G1R Deluxe — RoddSoft Edition Start Screen

A **G1R Deluxe / Gen1Recomp Mod API 2** graphics mod for Pokémon Red, Blue, and Yellow.

The mod replaces the version branding on the Gen 1 title screen with **RoddSoft Edition** while retaining each game's normal title composition and behavior.

## Compatibility

- G1R Deluxe / Gen1Recomp Mod API 2
- Pokémon Red
- Pokémon Blue
- Pokémon Yellow
- Engine range: `>=0.0.0-0 <2.0.0`

## How it works

### Red and Blue

Red and Blue use Gen1Recomp's supported `field.boot.title.versionRibbon` content seam. The mod replaces that ribbon with:

`assets/roddsoft_edition.png`

The stock title-screen animation, Pokémon/trainer graphics, menu, and copyright graphics remain handled by G1R Deluxe.

### Yellow

Pokémon Yellow uses a different title layout and does not render the Red/Blue version ribbon. For Yellow, the mod uses the `engine_internals` permission to extend `TitleState.draw` after the normal Yellow title composition is drawn.

The Yellow path:

- covers the stock left/right version lettering with small background patches;
- draws `assets/roddsoft_yellow.png`, derived from the supplied RoddSoft reference artwork;
- uses nearest-neighbor filtering so the badge remains pixel-sharp;
- leaves Yellow's normal Pikachu/title behavior and menu flow intact.

Because this path hooks an internal title renderer, Yellow compatibility is more sensitive to future G1R Deluxe renderer changes than Red/Blue.

## Assets

- `assets/roddsoft_edition.png` — Red/Blue RoddSoft Edition version ribbon.
- `assets/roddsoft_yellow.png` — Yellow-specific RoddSoft badge artwork.

Original RoddSoft code and artwork in this repository are covered by the included 0BSD license. Third-party trademarks, game data, and other materials remain the property of their respective owners.

## Install

Download the release ZIP and import it through **MODS > Import mod .zip** in G1R Deluxe, then enable **RoddSoft Edition Title Screen**.

A valid import for the Gen 1 game being played is still required by G1R Deluxe.

## Updating

The manifest includes this GitHub repository so G1R Deluxe can discover GitHub releases. G1R Deluxe may cache release information for several hours, so a newly published update may not appear immediately.

## Repository

`twgrodd/G1R-Deluxe_Gen1_mod_StartScreenRoddsoft`
