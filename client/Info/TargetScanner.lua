class("TargetScanner")

function TargetScanner:__init()
  print("Indicator target analyzer loaded sucessfully")
end

function TargetScanner:ScanTarget(vehicle)
  self.ReturnArgument = {}
  
  if IsValid(vehicle:GetDriver()) then self.driver = vehicle:GetDriver():GetName() else self.driver = "Nobody" end
  self.ReturnArgument.Name = self.driver .. " / " .. vehicle:GetName()
  self.ReturnArgument.Hostility = self:CalculateHostility(vehicle)
  --print(self.ReturnArgument.Hostility)
  self.distance = tostring(round(Vector3.Distance(LocalPlayer:GetVehicle():GetPosition(), vehicle:GetPosition()), 1)) .. "m"
  self.ReturnArgument.Distance = self.distance .. " / " .. tostring(round(vehicle:GetLinearVelocity():Length() * 3.6, 1)) .. " km/h"
  return self.ReturnArgument
  
end
  

function TargetScanner:CalculateHostility(vehicle) -- you may wish to modify this function
  if vehicle ~= LocalPlayer:GetVehicle() then
    if IsValid(vehicle:GetDriver()) then
      if vehicle:GetId() == LocalPlayer:GetValue("TL_Target") then
        return "Target"
      else
        return "Friendly"
      end
    else
      if vehicle:GetId() == LocalPlayer:GetValue("TL_Target") then
        return "Target"
      else
        return "Passive"
      end
    end
  else
    return "Friendly"
  end
end

TargetScanner = TargetScanner()