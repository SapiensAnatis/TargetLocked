class("TL_Settings")

function TL_Settings:__init()
  print("Settings loaded!")
  self:SetSettings()
end

function TL_Settings:SetSettings()
  self.ScanRadius = 4000 -- the radius in which vehicles should be scanned for, in meters (1km = 1000m).
  -- Note: increasing this setting to extremely high values will slow down the script dramatically.
  -- It will not have an impact on the server, as it is a client-only script, but users will likely
  -- experience FPS drops.
  self.IndicatorSizeX = 96
  self.IndicatorSizeY = 96 -- how large the indicators on targets should be, in pixels
  
  self.TargetKey = string.byte("Y")
    
  self.ShowInfoOnlyIfDriverPresent = false
  
  self.DisplayOnlyForCertainVehicles = true
  
  self.CertainVehicles = { -- the model IDs of the vehicles you want. List available @ http://wiki.jc-mp.com/Model_ID
  -- Enter like this:
    ["11"] = 11,
    ["30"] = 30,-- Sivirkin 15 Havoc
  }
  
  --- DO NOT CHANGE THE FOLLOWING VARIABLES ---
  
  self.IndicatorSize = Vector2(self.IndicatorSizeX, self.IndicatorSizeY)

end

Settings = TL_Settings()