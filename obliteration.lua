if timer.Exists("constant_boom") then
    timer.Remove("constant_boom")

    print("Obliteration Off.")

    else

    print("Obliteration On.")

    timer.Create("constant_boom", 0.1, 0, function() 
	RunConsoleCommand("ent_create", "grenade_ar2")
	LocalPlayer():ConCommand("ent_create prop_physics model models/props_c17/oildrum001_explosive.mdl")
    end)

end

