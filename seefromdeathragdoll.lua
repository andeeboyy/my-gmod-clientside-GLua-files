local plr = LocalPlayer()
if hook.GetTable()["CalcView"]["seefromragdoll"] then
    hook.Remove("CalcView", "seefromragdoll")
    hook.Remove("DrawOverlay", "DeathScreenFade")
    hook.Remove("Tick", "trackdmghealth")
    print("Death effects off.")

    else
    
    print("Death effects on.")
    local speed = 30
    local specpos = plr:EyePos()
    local alpha = 0
    local time = CurTime()
    local timepassed = CurTime()
    local activation = 0
    local damagetaken = plr:Health()
    local timetofade = 0
    local activation2 = 0
    local timerecovery = CurTime()
    local dps = 0
    local lasthurt = CurTime()
    local curhurt = CurTime()
    hook.Add("Tick", "trackdmghealth", function()
	local health = plr:Health()
	if lasttickhealth != nil then
	    if health < lasttickhealth then
	        damagetaken = lasttickhealth - health
		curhurt = CurTime()
		dps = dps + damagetaken / (curhurt - lasthurt)
		lasthurt = CurTime()
	    end
	end
	lasttickhealth = health
    end)
    hook.Add("DrawOverlay", "DeathScreenFade", function()
	if !plr:Alive() then
	    if activation == 0 then
		alpha = 255
		time = CurTime()
		activation = 1
	    end
	    activation2 = 1
	    timepassed = CurTime() - time
	    local progress = timepassed * math.Clamp(dps * 0.01, 0.1, 10)
	    alpha = math.Clamp(progress * 255, 0, 255)
	    if progress < 0.75 and IsValid(plr:GetRagdollEntity()) then
	    	plr:SetDSP(27)
	    else
		if progress == 1 then
		    plr:SetDSP(31)
		else
		    plr:SetDSP(30)
		end
	    end
	    if IsValid(plr:GetRagdollEntity()) then
	    	local color1 = Color(0, 0, 0, alpha)
	    	local color2 = Color(dps * progress, 0, 0, alpha)
		surface.SetDrawColor(color1:Lerp(color2, 0.5))
	    else
		plr:SetDSP(31)
	    	local color = Color(0, 0, 0)
		surface.SetDrawColor(color)
	    end
	    surface.DrawRect(0, 0, ScrW(), ScrH())
	else
	    if activation2 == 1 then
		damagetaken = plr:GetMaxHealth()
		dps = 0
		plr:SetDSP(1)
		curhurt = CurTime()
		lasthurt = CurTime()
		activation2 = 0
	    end
	    activation = 0
	end
    end)
    hook.Add("CalcView", "seefromragdoll", function(plr, origin, angles, fov)
	if IsValid(plr:GetViewEntity()) and plr:GetViewEntity() ~= plr then 
	    return
	end

	if !plr:Alive() then
	    local ragdoll = plr:GetRagdollEntity()
	    if IsValid(ragdoll) then
	    	local head = ragdoll:LookupBone("ValveBiped.Bip01_Head1")
	    	local headmatrix = ragdoll:GetBoneMatrix(head)
	    	ragdoll:SetupBones()
	    	if headmatrix then

	            local headang = headmatrix:GetAngles()
	            headang:RotateAroundAxis(headang:Up(), -90)
	            headang:RotateAroundAxis(headang:Forward(), -90)

	            local headmatpos = headmatrix:GetTranslation()

	    	    local view = {}
	    	    view.origin = (headmatpos + (headang:Up() * 5) + (headang:Forward() * 6.5)) + (plr:GetVelocity() * FrameTime())
	    	    view.angles = headang
	    	    view.fov = fov
	    	    view.drawviewer = true

	    	    return view
	        else
		    return
	        end
	    end
	else
	    return
	end
    end)
end
