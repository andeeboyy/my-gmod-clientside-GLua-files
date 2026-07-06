
if timer.Exists("ban") then
    timer.Remove("ban")

    print("Ban Off.")

    else

    print("Ban On.")

    timer.Create("ban", 0, 0, function() 

	-- Put names in the "NONE" spot to kill someone.

	RunConsoleCommand("kill", "NONE")

    end)

end

