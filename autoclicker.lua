
if timer.Exists("click") then
    timer.Remove("click")
    RunConsoleCommand("-attack")
    print("Autoclicker Off.")

    else

    print("Autoclicker On.")

    timer.Create("click", 0.03, 0, function() 
	RunConsoleCommand("+attack")
	timer.Simple(0, function()
	    RunConsoleCommand("-attack")
	end)
    end)

end