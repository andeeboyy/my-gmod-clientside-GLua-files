
if hook.GetTable()["Tick"]["click"] then
    hook.Remove("Tick", "click")
    LocalPlayer():ConCommand("-attack")
    print("Autoclicker Off.")

    else

    print("Autoclicker On.")
    local switch = 0
    hook.Add("Tick", "click", function()
	if switch == 0 then
	    LocalPlayer():ConCommand("+attack")
	    switch = 1
	else
	    LocalPlayer():ConCommand("-attack")
	    switch = 0
	end
    end)

end