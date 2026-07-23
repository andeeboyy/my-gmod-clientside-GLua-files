
if hook.GetTable()["Tick"]["staydead"] then
    hook.Remove("Tick", "staydead")

    print("Stay-Dead Off.")

    else

    print("Stay-Dead On.")

    hook.Add("Tick", "staydead", function()
	if GetConVar("sv_cheats"):GetFloat() > 1 then
	    if LocalPlayer():Alive() then
	    	LocalPlayer():ConCommand("give mortarshell")
	    	LocalPlayer():ConCommand("give mortarshell")
	    end
	else
	    if LocalPlayer():Alive() then
	    	LocalPlayer():ConCommand("kill")
	    end
	end
    end)

end

