if timer.Exists("death") then
    timer.Remove("death")

    print("Disconnect on death off.")

    else

    print("Disconnect on death on.")

    timer.Create("death", 0.1, 0, function()
	if LocalPlayer():Health() < 1 then
	    RunConsoleCommand("disconnect")
	    print("You are dead, not big suprise.")
	end
    end)

end