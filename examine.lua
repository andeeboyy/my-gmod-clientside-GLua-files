
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
	

        for _, prop in ipairs(ents.FindByClass("prop_physics")) do
	    if prop ~= ent then
		if IsValid(prop) then
	    	    local proppos = prop:WorldSpaceCenter()
	    	    local propmarker = proppos:ToScreen()
	    	    draw.SimpleText("Prop" .. " " .. prop:GetModel(), "DefaultFixedDropShadow", propmarker.x, propmarker.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	    end
	end
        for _, rag in ipairs(ents.FindByClass("prop_ragdoll")) do
	    if rag ~= ent then
		if IsValid(rag) then
	    	    local ragpos = rag:WorldSpaceCenter()
	    	    local ragmarker = ragpos:ToScreen()
	    	    draw.SimpleText("Ragdoll" .. " " .. rag:GetModel(), "DefaultFixedDropShadow", ragmarker.x, ragmarker.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	    end
	end
        for _, npc in ipairs(ents.GetAll()) do
	    if npc ~= ent then
		if npc:IsNPC() then
		    if IsValid(npc) then
	    	    	local npcpos = npc:WorldSpaceCenter()
	    	    	local npcmarker = npcpos:ToScreen()
	    	    	draw.SimpleText("NPC" .. " " .. npc:GetClass(), "DefaultFixedDropShadow", npcmarker.x, npcmarker.y, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		    end
	    	end
	    end
	end
        for _, player in ipairs(ents.FindByClass("player")) do
	    if player ~= LocalPlayer() then
		if player ~= ent then
		    if IsValid(player) then
	    	    	local pos = player:WorldSpaceCenter()
	    	    	local marker = pos:ToScreen()
		    	local pmaxhealth = player:GetMaxHealth()
		    	local phealth = player:Health()
		    	if player:GetMaxHealth() < 0 then 
			    pmaxhealth = 100
		    	end
		    	local phealthfraction = math.Clamp(phealth / pmaxhealth, 0, 1)
		    	local phgreen = math.Round(phealthfraction * 255)
		    	local phred = math.Round((1 - phealthfraction) * 255)
			local phtextwhite = 255
			if player:Alive() then
			    phtextwhite = 255
			else
			    phtextwhite = 0
			end
	    	    	draw.RoundedBox(10, marker.x - surface.GetTextSize(player:Nick()) / 2 - 5, marker.y - 15, surface.GetTextSize(player:Nick()) + 10, 30, Color(phred, phgreen, 0))
	    	    	draw.SimpleText(player:Nick(), "CloseCaption_Bold", marker.x, marker.y, Color(phtextwhite, phtextwhite, phtextwhite), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		    end
		end
	    end
	end
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