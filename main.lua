-- RoddSoft Edition title-screen mod for G1R Deluxe / Gen1Recomp.
--
-- Red and Blue already expose field.boot.title.versionRibbon through the
-- supported content API. Yellow intentionally has no version ribbon, so for
-- Yellow we add the same authored artwork to its existing Pikachu title
-- composition with a very small TitleState draw extension.
--
-- No ROM-derived pixels are shipped by this repository.

local RIBBON_W = 128
local RIBBON_H = 16
local LABEL = "RoddSoft Edition"

return function(mod)
  local ribbonPath = mod.path .. "/assets/roddsoft_edition.png"

  -- Red/Blue use this directly. Yellow still loads it into TitleState, which
  -- lets the Yellow-specific draw extension below reuse exactly the same art.
  mod.content.field:patch("boot", {
    title = {
      versionRibbon = ribbonPath,
    },
  })

  -- Yellow's original title screen deliberately has no Red/Blue-style version
  -- ribbon. Keep its logo, fixed Pikachu, speech bubble, blink, cries and
  -- copyright untouched, and add only our branding beneath the logo.
  --
  -- This is intentionally guarded by versionFull: if the mod is disabled
  -- after loading, vanilla Yellow's unused Blue-version graphic will not be
  -- drawn by the wrapper.
  local TitleState = require("src.ui.TitleState")
  if not TitleState._roddsoftYellowDraw then
    local vanillaDraw = TitleState.draw
    TitleState.draw = function(self)
      vanillaDraw(self)

      if not (self.yellowLayout and self.versionFull and self.version)
         or self.menuOpen then
        return
      end

      local iw = self.version:getWidth()
      local scale = 0.75
      local x = math.floor((160 - iw * scale) / 2)
      local y = 52 - (self.scy or 0)

      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.draw(self.version, x, y, 0, scale, scale)
    end
    TitleState._roddsoftYellowDraw = true
  end

  mod.log:info("RoddSoft Edition title branding enabled (%dx%d, %s)",
    RIBBON_W, RIBBON_H, LABEL)
end
