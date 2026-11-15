if timer.Exists("escape") then
    timer.Remove("escape")

    print("Escape Off.")
    RunConsoleCommand("setpos", "0", "0", "0") 
    RunConsoleCommand("setang", "0", "0", "0")
    RunConsoleCommand("r_drawentities", "1")
    RunConsoleCommand("r_shadows", "1")
else

    print("Escape On.")

    timer.Create("escape", 0.015, 0, function()
	RunConsoleCommand("setpos", "-100000", "-100000", "-100000") 
	RunConsoleCommand("setang", "-180", "0", "0")
	RunConsoleCommand("r_drawentities", "0")
	RunConsoleCommand("r_shadows", "0")
    end)

end
