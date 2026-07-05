
if hook.GetTable()["HUDPaint"]["examine"] then
    hook.Remove("HUDPaint", "examine")

    print("Examine Off.")

    else

    print("Examine On.")
    hook.Add("HUDPaint", "examine", function()
	local plr = LocalPlayer()
	local trace = plr:GetEyeTrace()
	local ent = plr:GetEyeTrace().Entity
	surface.SetFont("CloseCaption_Bold")
	if isentity(ent) and IsValid(ent) then

	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:GetClass())) / 2 - 10, ScrH() / 2 + 50, surface.GetTextSize(tostring(ent:GetClass())) + 20, 30, Color(0, 0, 0))
	    draw.SimpleText(tostring(ent:GetClass()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 65, Color(255, 180, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	    if ent:GetMaxHealth() > 1 then
	    	draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:Health())) / 2 - 5, ScrH() / 2 + 100, surface.GetTextSize(tostring(ent:Health())) + 10, 30, Color(0, 0, 0))
	    	draw.SimpleText(tostring(ent:Health()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 115, Color(0, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end

	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:GetModel())) / 2 - 5, ScrH() / 2 + 150, surface.GetTextSize(tostring(ent:GetModel())) + 10, 30, Color(0, 0, 0))
	    draw.SimpleText(tostring(ent:GetModel()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 165, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:EntIndex())) / 2 - 5, ScrH() / 2 + 200, surface.GetTextSize(tostring(ent:EntIndex())) + 10, 30, Color(0, 0, 0))
	    draw.SimpleText(tostring(ent:EntIndex()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 215, Color(0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
	local string = "a string"
	if ent:IsNextBot() then
	    string = "NextBot"
	elseif ent:IsNPC() then
	    string = "NPC"
	elseif ent:IsRagdoll() then
	    string = "Ragdoll"
	elseif ent:IsVehicle() then
	    string = "Vehicle"
	elseif ent:IsWeapon() then
	    string = "Weapon"
	elseif ent:IsWorld() then
	    string = "World"
	elseif trace.Hit == false then
	    string = "Nothing?"
	else
	    return
	end
	draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(string) / 2 - 5, ScrH() / 2 + 250, surface.GetTextSize(string) + 10, 30, Color(0, 0, 0))
	draw.SimpleText(string, "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 265, Color(255, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end)

end