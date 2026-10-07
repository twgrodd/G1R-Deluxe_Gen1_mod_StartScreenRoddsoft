-- RoddSoft Edition title-screen mod for G1R Deluxe / Gen1Recomp.
local LABEL = "RoddSoft Edition"

return function(mod)
  local ribbonPath = mod.path .. "/assets/roddsoft_edition.png"
  mod.content.field:patch("boot", { title = { versionRibbon = ribbonPath } })

  local TitleState = require("src.ui.TitleState")
  local Font = require("src.render.Font")

  if not TitleState._roddsoftYellowDraw then
    local vanillaDraw = TitleState.draw

    local function shadowText(text, y)
      local x = math.floor((160 - Font.width(text)) / 2)
      love.graphics.setColor(0.08, 0.08, 0.62, 1)
      Font.draw(text, x + 1, y + 1)
      love.graphics.setColor(1, 0.93, 0, 1)
      Font.draw(text, x, y)
    end

    TitleState.draw = function(self)
      vanillaDraw(self)
      if not (self.yellowLayout and self.versionFull) or self.menuOpen then return end
      local dy = -(self.scy or 0)
      shadowText("RoddSoft", 48 + dy)
      shadowText("Edition", 56 + dy)
      love.graphics.setColor(1, 1, 1, 1)
    end

    TitleState._roddsoftYellowDraw = true
  end

  mod.log:info("%s title branding enabled for Gen 1", LABEL)
end
