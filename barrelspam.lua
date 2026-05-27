
if timer.Exists("props") then
    timer.Remove("props")

    print("Spam Off.")

    else

    print("Spam On.")

    timer.Create("props", 0.05, 0, function() 
	RunConsoleCommand("gm_spawn", "models/props_c17/oildrum001_explosive.mdl")
    end)

end