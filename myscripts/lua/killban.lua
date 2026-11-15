
if timer.Exists("ban") then
    timer.Remove("ban")

    print("Ban Off.")

    else

    print("Ban On.")

    timer.Create("ban", 0, 0, function() 
	-- Set NONE to name of target to kill them.
	RunConsoleCommand("kill", "NONE")
    end)

end

