
if timer.Exists("toolban") then
    timer.Remove("toolban")

    print("Toolgun Ban Off.")

    else

    print("Toolgun Ban On.")

    timer.Create("toolban", 0, 0, function() 
	-- Set target variable to entindex of target to restrict toolgun.
	local target = Entity(1)
	if target:Alive() then
	    local tool = target:GetWeapon("gmod_tool")
            if IsValid(tool) then
	        RunConsoleCommand("ent_remove", tool:EntIndex())
	    end
	end
    end)

end

