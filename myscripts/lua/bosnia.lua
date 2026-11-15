
if timer.Exists("mines") then
    timer.Remove("mines")

    print("Mines Off.")

    else

    print("Mines On.")

    timer.Create("mines", 0.1, 0, function()
	if LocalPlayer():Alive() then
	    RunConsoleCommand("gm_spawnsent", "combine_mine")
	else
	    if GetConVar("sv_cheats"):GetFloat() > 0 then
	        LocalPlayer():ConCommand("ent_create combine_mine")
	    end
	end
    end)

end