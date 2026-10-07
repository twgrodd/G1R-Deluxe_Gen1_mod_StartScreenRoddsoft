-- RoddSoft Edition title-screen mod for G1R Deluxe / Gen1Recomp.
local LABEL="RoddSoft Edition"
local YELLOW_BADGE="iVBORw0KGgoAAAANSUhEUgAAAEgAAAAcCAYAAADC8vmmAAABoElEQVR42u2ZSxKDIAyGC+PSGT2A1/NUXK8HsDPd25UdTBMCmGB0ysoHKvnIH2Jwj4Zt6MMq8Z7Xe3atxuysQrACz10ZRgtoyQfX5UECGKewO1+eM3rdUtvG+DV+5B0ki2wMyjKAUkA5kNwdJKQpQXcWHEqS8Ho865reS0HqLHsNJgntFASC6q4gqZZxb+jDGkPqJOBIyYDymJIVUmI1jSH5I3CW5/xjFCcL7BnqOSo+1X67RnJeMz5sRsC+4xR2xqdmHfbFQKXAUhOS27xE3OGMyDmn+lAGUpDj46MeNfRh9UegYLMEQWHnmEdxx5xncDGnFpaTCs5woCkI0ikA/GaufLMkJr38wgFh8iuRAnVve692CuClygNUgC2NSbF0SmVBwaqF+HrPrtNK6EqMozyxpmIg7VFeo8ikLYUSbzviPbsYVAuJMx6uNlSCRwV1CCAV96QSxZiFz/3tl4xP0r8jkh4KGXisgySoLe/hsl8ORCo/kgKD2a1aMEvJxlJlsqpgZrlOpA2lCtBdQJWGj/+2jyYgi9BMbRyeBa/l1vMHY9ZZNyPjPUkAAAAASUVORK5CYII="

return function(mod)
  mod.content.field:patch("boot",{title={versionRibbon=mod.path.."/assets/roddsoft_edition.png"}})
  local TitleState=require("src.ui.TitleState")
  local badge

  local function getBadge()
    if badge then return badge end
    local bytes=love.data.decode("string","base64",YELLOW_BADGE)
    local file=love.filesystem.newFileData(bytes,"roddsoft_yellow_badge.png")
    badge=love.graphics.newImage(file)
    badge:setFilter("nearest","nearest")
    return badge
  end

  if not TitleState._roddsoftYellowDraw then
    local old=TitleState.draw
    TitleState.draw=function(self)
      old(self)
      if not (self.yellowLayout and self.versionFull) or self.menuOpen then return end
      local img=getBadge()
      local x=math.floor((160-img:getWidth())/2)
      local y=42-(self.scy or 0)
      love.graphics.setColor(1,1,1,1)
      love.graphics.draw(img,x,y)
    end
    TitleState._roddsoftYellowDraw=true
  end
  mod.log:info("%s title branding enabled for Gen 1",LABEL)
end
