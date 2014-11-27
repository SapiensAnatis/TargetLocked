function ModulesLoad()
	Events:Fire("HelpAddItem",
		{
			name = "Target Locked",
			text =
			"This is a script that allows for the targeting of other vehicles while in a vehicle yourself.\n"..
			"Target indicators can turn several colours - red indicates hostile, green indicates friendly,\n"..
			"and grey indicates passive, while yellow indicates that this vehicle is your target.\n\n"..
			"Press (default) Y to select a new target - after which they will appear yellow.\n\n"..
			"This script was developed by Lord Noob."
		}
	)
end
		
function ModuleUnload()
	Events:Fire("HelpRemoveItem",
		{
			name = "Target Locked"
		}
	)
end

Events:Subscribe("ModulesLoad", ModulesLoad)
Events:Subscribe("ModuleUnload", ModuleUnload)