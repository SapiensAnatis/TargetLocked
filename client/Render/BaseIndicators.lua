class("BaseIndicators")

function BaseIndicators:__init()
  print("Indicator drawing dependency loaded sucessfully")
end

function BaseIndicators:Draw(Marker, pos, size)
  Marker:SetPosition(pos)
  Marker:SetSize(size)
  Marker:Draw()
end

function BaseIndicators:DrawIndicator(pos, size, colour, hostile)
  if hostile == "Hostile" then
    self:Draw(tMarker_hostile, pos, size)
  elseif hostile == "Friendly" then
    self:Draw(tMarker_friendly, pos, size)
  elseif hostile == "Target" then
    self:Draw(tMarker_target, pos, size)
  else
    self:Draw(tMarker, pos, size)
  end
end

function BaseIndicators:DrawAdditionalInfo(pos, size, colour, stringTable)
  Render:DrawText(pos + Vector2(0, 5), stringTable.Name, colour, size-2)
  Render:DrawText(pos + Vector2(0, 20), stringTable.Hostility, colour, size)
  Render:DrawText(pos + Vector2(0, 35), stringTable.Distance, colour, size-1)
end


BaseIndicators = BaseIndicators()