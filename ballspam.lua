
if timer.Exists("ball") then
    timer.Remove("ball")

    print("Spam Off.")

    else

    print("Spam On.")

    timer.Create("ball", 0.05, 0, function() 
	RunConsoleCommand("gm_spawnsent", "sent_ball")
    end)

end