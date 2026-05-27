if timer.Exists("constant_boom") then
    timer.Remove("constant_boom")

    print("Obliteration Off.")

    else

    print("Obliteration On.")

    timer.Create("constant_boom", 0.1, 0, function() 
	RunConsoleCommand("ent_create", "grenade_ar2")
	RunConsoleCommand("ent_create", "npc_grenade_frag")
    end)

end

