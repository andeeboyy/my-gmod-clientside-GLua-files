if hook.GetTable()["PostDrawOpaqueRenderables"]["Forcedrawthings"] then
    hook.Remove("PostDrawOpaqueRenderables", "Forcedrawthings")
    print("Forcedraw Off.")
else
    print("Forcedraw On.")
    hook.Add("PostDrawOpaqueRenderables", "Forcedrawthings", function()
    	for _, ent in ipairs(ents.GetAll()) do
	    if IsValid(ent) and !ent == LocalPlayer():GetViewModel() then
	    	ent:DrawModel()
	    end
    	end
    end)
end