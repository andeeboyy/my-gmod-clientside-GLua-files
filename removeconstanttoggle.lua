
if hook.GetTable()["Tick"]["constant_cleanup"] then
    hook.Remove("Tick", "constant_cleanup")

    print("Cleanup Off.")

    else

    print("Cleanup On.")

    hook.Add("Tick", "constant_cleanup", function()
	 RunConsoleCommand("gmod_admin_cleanup") 
    end)

end

