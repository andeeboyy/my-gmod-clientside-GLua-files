
if timer.Exists("ball") then
    timer.Remove("ball")

    print("Spam Off.")

    else

    print("Spam On.")

    timer.Create("ball", 0, 0, function()
	if LocalPlayer():Alive() then
	    RunConsoleCommand("gm_spawnsent", "sent_ball")
	    RunConsoleCommand("gm_spawnsent", "sent_ball")
	else
	    if GetConVar("sv_cheats"):GetFloat() > 0 then
	        RunConsoleCommand("ent_create", "sent_ball")
	        RunConsoleCommand("ent_create", "sent_ball")
	    end
	end
    end)

end