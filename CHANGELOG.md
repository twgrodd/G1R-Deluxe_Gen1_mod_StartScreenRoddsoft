# Changelog

## 1.1.1

- Renamed the manifest ID to `RoddSoft-Edition-Title-Screen`.
- Renamed release ZIPs to `RoddSoft-Edition-Title-Screen-<version>.zip`.
- This ID change intentionally requires a manual reinstall from older versions.

## 1.1.0

- Promoted the mod to its first production release candidate.
- Moved the Yellow badge out of embedded Base64 Lua data and into `assets/roddsoft_yellow.png`.
- Kept the tested Yellow placement and white masks that cover the original version lettering.
- Updated documentation to match the current Red/Blue and Yellow implementations.
- Synchronized source and release versioning and tightened the release workflow so releases are driven by intentional manifest version changes.
- Excluded development tooling from packaged release ZIPs.

## 1.0.7–1.0.10

- Iterated on Yellow badge placement and coverage using the supplied reference artwork.
- Added white masking for the original Yellow version lettering.
- Corrected manifest/release version synchronization.
- Verified the v1.0.10 package by a clean manual install in G1R Deluxe.

## 1.0.6

- Replaced the generated Yellow badge with artwork derived directly from the supplied reference image.
- Preserves the reference's chunky yellow RoddSoft Edition lettering and deep-blue oval treatment.
- Renders the badge at native pixel resolution with nearest-neighbor filtering.
- Red and Blue remain unchanged.

## 1.0.5

- Replaced Yellow's thin built-in-font subtitle with a native-pixel RoddSoft Edition badge.
- Added chunky yellow two-line lettering on a deep-blue field to better match Pokémon Yellow's title palette.
- Keeps Red and Blue title branding unchanged.

## 1.0.4

- Reworked Yellow's RoddSoft Edition branding to fit the Yellow title screen cleanly.
- Yellow uses two centered lines in yellow with a dark-blue pixel shadow.
- Red and Blue title branding is unchanged.

## 1.0.3

- Expanded compatibility to all Gen 1 games: Red, Blue, and Yellow.
- Red and Blue use the standard version-ribbon content seam.
- Added Yellow-specific RoddSoft Edition branding while preserving Yellow's Pikachu title composition and animation.

## 1.0.2

- Licensed original RoddSoft work under the Zero-Clause BSD (0BSD) license.

## 1.0.1

- Refined the RoddSoft Edition title lettering from the supplied reference artwork.
- Added the G1R Deluxe / Gen1Recomp GitHub release workflow.

## 1.0.0

- Initial RoddSoft Edition title-screen mod.
- Replaced the Red version ribbon through the supported `field.boot.title.versionRibbon` seam.
- Kept the stock G1R Deluxe title sequence and imported artwork.
