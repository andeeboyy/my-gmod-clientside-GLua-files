
if timer.Exists("click") then
    timer.Remove("click")
    LocalPlayer():ConCommand("-attack")
    print("Autoclicker Off.")

    else

    print("Autoclicker On.")
    local switch = 0
    timer.Create("click", 0, 0, function()
	if switch == 0 then
	    LocalPlayer():ConCommand("+attack")
	    switch = 1
	else
	    LocalPlayer():ConCommand("-attack")
	    switch = 0
	end
    end)

end