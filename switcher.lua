
if timer.Exists("switch") then
    timer.Remove("switch")
    print("Switcher Off.")

    else

    print("Switcher On.")

    timer.Create("switch", 0, 0, function() 
	LocalPlayer():ConCommand("lastinv")
    end)

end