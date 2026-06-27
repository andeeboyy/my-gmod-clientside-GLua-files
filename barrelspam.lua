
if timer.Exists("props") then
    timer.Remove("props")

    print("Spam Off.")

    else

    print("Spam On.")

    timer.Create("props", 0.05, 0, function()
	if LocalPlayer():Alive() then
	    RunConsoleCommand("gm_spawn", "models/props_c17/oildrum001_explosive.mdl")
	else
	    if GetConVar("sv_cheats"):GetFloat() > 0 then
	        LocalPlayer():ConCommand("ent_create prop_physics model models/props_c17/oildrum001_explosive.mdl")
	    end
	end
    end)

end