
if hook.GetTable()["HUDPaint"]["examine"] then
    hook.Remove("HUDPaint", "examine")

    print("Examine Off.")

    else

    print("Examine On.")
    hook.Add("HUDPaint", "examine", function()
	local plr = LocalPlayer()
	local trace = plr:GetEyeTrace()
	local ent = plr:GetEyeTrace().Entity
	if ent:IsWorld() then
	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize("World") / 2 - 10, ScrH() / 1.875, surface.GetTextSize("World") + 20, 30, Color(0, 0, 0))
	    draw.SimpleText("World", "CloseCaption_Bold", ScrW() / 2, ScrH() / 1.85, Color(255, 0, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	if isentity(ent) and IsValid(ent) then
	    surface.SetFont("CloseCaption_Bold")

	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:GetClass())) / 2 - 10, ScrH() / 1.875, surface.GetTextSize(tostring(ent:GetClass())) + 20, 30, Color(0, 0, 0))
	    draw.SimpleText(tostring(ent:GetClass()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 1.85, Color(255, 180, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	    if ent:GetMaxHealth() > 1 then
	    	draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:Health())) / 2 - 5, ScrH() / 1.75, surface.GetTextSize(tostring(ent:Health())) + 10, 30, Color(0, 0, 0))
	    	draw.SimpleText(tostring(ent:Health()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 1.725, Color(0, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end

	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:GetModel())) / 2 - 5, ScrH() / 1.625, surface.GetTextSize(tostring(ent:GetModel())) + 10, 30, Color(0, 0, 0))
	    draw.SimpleText(tostring(ent:GetModel()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 1.6, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
    end)

end