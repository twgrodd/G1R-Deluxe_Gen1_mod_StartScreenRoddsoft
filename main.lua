-- RoddSoft Edition title-screen mod for G1R Deluxe / Gen1Recomp.
local LABEL = "RoddSoft Edition"

return function(mod)
  mod.content.field:patch("boot", { title = {
    versionRibbon = mod.path .. "/assets/roddsoft_edition.png"
  }})

  local TitleState = require("src.ui.TitleState")
  local glyph = {
    R={"110","101","110","101","101"}, o={"000","110","101","101","110"},
    d={"001","001","111","101","111"}, S={"111","100","111","001","111"},
    f={"011","010","111","010","010"}, t={"010","111","010","010","011"},
    E={"111","100","110","100","111"}, i={"010","000","010","010","010"},
    n={"000","110","101","101","101"}
  }

  local function word(s,y)
    local scale, advance = 2, 8
    local x = math.floor(80 - (#s * advance - scale) / 2)
    for c=1,#s do
      local rows=glyph[s:sub(c,c)]
      if rows then
        for gy=1,5 do
          for gx=1,3 do
            if rows[gy]:sub(gx,gx)=="1" then
              love.graphics.rectangle("fill",x+(gx-1)*scale,y+(gy-1)*scale,scale,scale)
            end
          end
        end
      end
      x=x+advance
    end
  end

  if not TitleState._roddsoftYellowDraw then
    local vanillaDraw=TitleState.draw
    TitleState.draw=function(self)
      vanillaDraw(self)
      if not (self.yellowLayout and self.versionFull) or self.menuOpen then return end

      local y=43-(self.scy or 0)
      -- Native-pixel Yellow-style badge: deep blue field, chunky yellow type.
      love.graphics.setColor(0.08,0.07,0.62,1)
      love.graphics.polygon("fill",
        42,y,118,y,120,y+2,120,y+20,118,y+22,42,y+22,40,y+20,40,y+2)
      love.graphics.setColor(1,0.94,0,1)
      word("RoddSoft",y+1)
      word("Edition",y+11)
      love.graphics.setColor(1,1,1,1)
    end
    TitleState._roddsoftYellowDraw=true
  end

  mod.log:info("%s title branding enabled for Gen 1",LABEL)
end
