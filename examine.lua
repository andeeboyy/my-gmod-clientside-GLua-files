
if hook.GetTable()["HUDPaint"]["examine"] then
    hook.Remove("HUDPaint", "examine")
    print("Examine Off.")

    else
    local health = 0
    local loop = 1
    local setvar = 1
    local setvar2 = 1
    local timerloop = 0
    local maketimer = 1
    local ent = Entity(1)
    local pastent = Entity(1)
    local healthdisplay = 0
    local function checkdamageloop()
    	if loop == 1 then
	    health = ent:Health()
	    loop = 0
	end
	if health == ent:Health() then return end
	if timerloop == 1 then return end
	if setvar == 1 then
	    timerloop = 1
	    setvar = 0
	end
	timer.Simple(1, function()
	    timerloop = 0
	    loop = 1
	    setvar = 1
	end)
    end
    print("Examine On.")
    hook.Add("HUDPaint", "examine", function()
	local plr = LocalPlayer()
	local trace = plr:GetEyeTrace()
	ent = plr:GetEyeTrace().Entity
	surface.SetFont("CloseCaption_Bold")
	if isentity(ent) and IsValid(ent) then

	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:GetClass())) / 2 - 10, ScrH() / 2 + 75, surface.GetTextSize(tostring(ent:GetClass())) + 20, 30, Color(0, 0, 0))
	    draw.SimpleText(tostring(ent:GetClass()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 90, Color(255, 180, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:GetModel())) / 2 - 5, ScrH() / 2 + 105, surface.GetTextSize(tostring(ent:GetModel())) + 10, 30, Color(0, 0, 0))
	    draw.SimpleText(tostring(ent:GetModel()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 120, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	    draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:EntIndex())) / 2 - 5, ScrH() / 2 + 135, surface.GetTextSize(tostring(ent:EntIndex())) + 10, 30, Color(0, 0, 0))
	    draw.SimpleText(tostring(ent:EntIndex()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 150, Color(0, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	    if ent:GetMaxHealth() > 1 then
	    	draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(ent:Health())) / 2 - 5, ScrH() / 2 + 195, surface.GetTextSize(tostring(ent:Health())) + 10, 30, Color(0, 0, 0))
	    	draw.SimpleText(tostring(ent:Health()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 210, Color(0, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end

	    if ent:IsScripted() then
	    	draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize("Scripted") / 2 - 5, ScrH() / 2 + 225, surface.GetTextSize("Scripted") + 10, 30, Color(0, 0, 0))
	    	draw.SimpleText("Scripted", "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 240, Color(0, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end
	    checkdamageloop()

	    if health ~= ent:Health() then
		draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(health - ent:Health())) / 2 - 5, ScrH() / 2 + 255, surface.GetTextSize(tostring(health - ent:Health())) + 10, 30, Color(0, 0, 0))
	    	draw.SimpleText(tostring(health - ent:Health()), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 270, Color(255, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end
	    if ent:GetMaxHealth() > 1 then
	    	healthdisplay = health - ent:Health()
	    end
	    maketimer = 1
	else
	    loop = 1
	end

	if ent:GetMaxHealth() < 1 then
	    if healthdisplay ~= nil and healthdisplay > 1 then
		if maketimer == 1 then
		    maketimer = 0
		    timer.Simple(1, function()
			healthdisplay = nil
		    end)
		end
	    	draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(tostring(healthdisplay)) / 2 - 5, ScrH() / 2 + 255, surface.GetTextSize(tostring(healthdisplay)) + 10, 30, Color(0, 0, 0))
	   	draw.SimpleText(tostring(healthdisplay), "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 270, Color(255, 0, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	    end
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
	draw.RoundedBox(10, ScrW() / 2 - surface.GetTextSize(string) / 2 - 5, ScrH() / 2 + 165, surface.GetTextSize(string) + 10, 30, Color(0, 0, 0))
	draw.SimpleText(string, "CloseCaption_Bold", ScrW() / 2, ScrH() / 2 + 180, Color(255, 255, 0), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end)
end