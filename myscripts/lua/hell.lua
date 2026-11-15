
if hook.GetTable()["Tick"]["hell"] then
    hook.Remove("Tick", "hell")

    print("Nothing Off.")

    else

    print("Nothing On.")

    hook.Add("Tick", "hell", function()
	 include('barren.lua')
    end)

end

