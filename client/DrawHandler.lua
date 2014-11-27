
class("TL_DrawHandler")

function TL_DrawHandler:__init()
  print("Indicator drawing control loaded sucessfully")
  Events:Subscribe("Render", self, self.SelectivelyDraw)
  Information = {}
  HostileColours = {["Hostile"] = Color.Red, ["Friendly"] = Color(157, 255, 0), ["Passive"] = Color.White, ["Target"] = Color.Orange}
  
  
end

function TL_DrawHandler:CheckAndDraw(vehicle)
  if vehicle:GetHealth() > 0 then
    if vehicle ~= LocalPlayer:GetVehicle() then
      if Vector3.Distance(vehicle:GetPosition(), LocalPlayer:GetPosition()) < Settings.ScanRadius then
        vehicle.ScreenPos = {Render:WorldToScreen(vehicle:GetCenterOfMass())}
        if vehicle.ScreenPos[2] then -- the vehicle would be visible
          vehicle.MarkerPosition = vehicle.ScreenPos[1] - Vector2(48, 48)
          Information = TargetScanner:ScanTarget(vehicle)
          vehicle.IsHostile = Information.Hostility
          BaseIndicators:DrawIndicator(vehicle.ScreenPos[1] - Vector2(48, 48), Settings.IndicatorSize, Color.White, vehicle.IsHostile)
          if Settings.ShowInfoOnlyIfDriverPresent then
            if IsValid(vehicle:GetDriver()) then 
              BaseIndicators:DrawAdditionalInfo((vehicle.MarkerPosition) + Vector2(0, Settings.IndicatorSize.y), 14, HostileColours[vehicle.IsHostile], Information)
            end
          else
            BaseIndicators:DrawAdditionalInfo((vehicle.MarkerPosition) + Vector2(0, Settings.IndicatorSize.y), 14, HostileColours[vehicle.IsHostile], Information)
          end
        else
          --print("Vehicle would be invisible")
        end
      else
        --print("Vehicle found - too far away")
      end
    end
  end
end

function TL_DrawHandler:SelectivelyDraw()
  if LocalPlayer:InVehicle() then
    for vehicle in Client:GetVehicles() do
      if IsValid(vehicle) and vehicle:GetPosition() ~= null then
        if not Settings.DisplayOnlyForCertainVehicles then
          TL_DrawHandler:CheckAndDraw(vehicle)
        else
          if table.find(Settings.CertainVehicles, vehicle:GetModelId()) == nil then 
            return
          else
            TL_DrawHandler:CheckAndDraw(vehicle)
          end
        end
      end
    end
  end
end

TL_DrawHandler = TL_DrawHandler()