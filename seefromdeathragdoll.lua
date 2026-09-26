local plr = LocalPlayer()
if hook.GetTable()["CalcView"]["seefromragdoll"] then
    hook.Remove("CalcView", "seefromragdoll")
    hook.Remove("DrawOverlay", "DeathScreenFade")
    hook.Remove("player_hurt", "trackdmghealth")
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
    gameevent.Listen("player_hurt")
    hook.Add("player_hurt", "trackdmghealth", function(data)
	local health = plr:Health()
	damagetaken = health - data.health
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
	    local progress = math.Clamp(timepassed / 5, 0, 1)
	    alpha = progress * 255
	    local color1 = Color(0, 0, 0, alpha)
	    local color2 = Color(damagetaken * alpha, 0, 0, alpha)
	    surface.SetDrawColor(color1:Lerp(color2, 0.5))
	    surface.DrawRect(0, 0, ScrW(), ScrH())
	else
	    if activation2 == 1 then
		damagetaken = plr:GetMaxHealth()
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
