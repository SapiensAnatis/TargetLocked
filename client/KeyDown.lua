class("TL_Input")

function TL_Input:__init()
  lowest = 9999999
  Events:Subscribe("KeyDown", self, self.KeyDown)
  print("Input handler loaded sucessfully")
end

function TL_Input:KeyDown(args)
  if args.key == Settings.TargetKey then
    if LocalPlayer:InVehicle() then
      self.results = LocalPlayer:GetAimTarget()
      if IsValid(self.results.entity) then 
        self.type = self.results.entity.__type
      else
        self.type = "dog"
      end
      if self.type ~= "Vehicle" then
        for vehicle in Client:GetVehicles() do
          if IsValid(vehicle) then
            if vehicle:GetHealth() > 0 then
              if Vector3.Distance(LocalPlayer:GetPosition(), vehicle:GetPosition()) < Settings.ScanRadius then
                if Vector2.Distance(Render:WorldToScreen(vehicle:GetPosition()), Render.Size/2) < lowest then
                  lowest = Vector2.Distance(Render:WorldToScreen(vehicle:GetPosition()), Render.Size/2)
                  lowestV = vehicle
                end
              end
            end
          end
        end
        
        if IsValid(lowestV) then
          if lowestV:GetId() == LocalPlayer:GetValue("TL_Target") then
            LocalPlayer:SetValue("TL_Target", nil)
          else
            LocalPlayer:SetValue("TL_Target", lowestV:GetId())
          end
        end
      else
        if LocalPlayer:GetAimTarget().entity:GetId() == LocalPlayer:GetValue("TL_Target") then
          LocalPlayer:SetValue("TL_Target", nil)
        else
          LocalPlayer:SetValue("TL_Target", LocalPlayer:GetAimTarget().entity:GetId())
        end
      end
      
    end
  end
end

TL_Input = TL_Input()