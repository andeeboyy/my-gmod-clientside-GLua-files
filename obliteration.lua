if timer.Exists("constant_boom") then
    timer.Remove("constant_boom")

    print("Obliteration Off.")

    else

    print("Obliteration On.")

    timer.Create("constant_boom", 0, 0, function() 
	LocalPlayer():ConCommand("ent_create prop_physics model models/props_junk/garbage_glassbottle003a.mdl physdamagescale 100000 ExplodeDamage 1000000 ExplodeRadius 500 massScale 10000; ent_create grenade_ar2")
    end)

end

