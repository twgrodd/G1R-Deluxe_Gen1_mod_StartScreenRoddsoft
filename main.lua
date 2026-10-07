-- RoddSoft Edition title-screen mod for G1R Deluxe / Gen1Recomp.
local LABEL = "RoddSoft Edition"

return function(mod)
  -- Red/Blue use the supported title version-ribbon seam.
  mod.content.field:patch("boot", {
    title = {
      versionRibbon = mod.path .. "/assets/roddsoft_edition.png",
    },
  })

  -- Yellow has a different title composition and does not draw versionRibbon.
  local TitleState = require("src.ui.TitleState")
  local badge

  local function getYellowBadge()
    if badge then return badge end
    badge = love.graphics.newImage(mod.path .. "/assets/roddsoft_yellow.png")
    badge:setFilter("nearest", "nearest")
    return badge
  end

  if not TitleState._roddsoftYellowDraw then
    local originalDraw = TitleState.draw
    TitleState.draw = function(self)
      originalDraw(self)
      if not (self.yellowLayout and self.versionFull) or self.menuOpen then
        return
      end

      local dy = -(self.scy or 0)

      -- Cover Yellow's original left/right version lettering.
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.rectangle("fill", 27, 55 + dy, 25, 10)
      love.graphics.rectangle("fill", 108, 55 + dy, 25, 10)

      -- Draw the supplied RoddSoft artwork at native pixel resolution.
      local img = getYellowBadge()
      local x = math.floor((160 - img:getWidth()) / 2)
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.draw(img, x, 38 + dy)
    end
    TitleState._roddsoftYellowDraw = true
  end

  mod.log:info("%s title branding enabled for Gen 1", LABEL)
end
