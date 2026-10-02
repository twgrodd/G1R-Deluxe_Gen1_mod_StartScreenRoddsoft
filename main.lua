-- RoddSoft Edition title-screen mod for G1R Deluxe / Gen1Recomp.
--
-- TitleState merges field.boot.title over the ROM-imported field.title data.
-- Setting copyrightText switches only the bottom copyright renderer, so this
-- mod instead supplies an authored versionRibbon while leaving the imported
-- Pokemon logo, player, title Pokemon and copyright art untouched.
--
-- The ribbon image is generated at runtime from G1R's built-in pixel font.
-- No ROM-derived pixels are shipped by this repository.

local RIBBON_W = 128
local RIBBON_H = 16
local LABEL = "RoddSoft Edition"

return function(mod)
  local ribbonPath = mod.path .. "/assets/roddsoft_edition.png"

  -- Prefer the authored/generated asset when present. The repository's
  -- tools/make_assets.py creates it; keeping this as a simple boot-title
  -- patch means the vanilla TitleState animation/menu behavior stays intact.
  mod.content.field:patch("boot", {
    title = {
      versionRibbon = ribbonPath,
    },
  })

  mod.log:info("RoddSoft Edition title ribbon enabled (%dx%d, %s)",
    RIBBON_W, RIBBON_H, LABEL)
end
