
if hook.GetTable()["Tick"]["smite"] then
    hook.Remove("Tick", "smite")

    print("Smite Off.")

    else

    print("Smite On.")

    hook.Add("Tick", "smite", function()
	LocalPlayer():ConCommand("ent_create mortarshell")
    end)

end

