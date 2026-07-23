CreateClientConVar("cl_3Dmodel_crosshair_red", 255)
CreateClientConVar("cl_3Dmodel_crosshair_green", 255)
CreateClientConVar("cl_3Dmodel_crosshair_blue", 255)

CreateClientConVar("cl_3Dmodel_crosshair_size", 4)

CreateClientConVar("cl_3Dmodel_crosshair", 1)

CreateClientConVar("cl_3Dmodel_fov_override", 0)

CreateClientConVar("cl_3Dmodel_fov", 140)

CreateClientConVar("cl_3Dmodel_crosshair_outline", 1)

CreateClientConVar("cl_3Dmodel_crosshair_outline_red", 0)
CreateClientConVar("cl_3Dmodel_crosshair_outline_green", 0)
CreateClientConVar("cl_3Dmodel_crosshair_outline_blue", 0)

CreateClientConVar("cl_3Dmodel_crosshair_outline_size", 8)
CreateClientConVar("cl_3Dmodel_crosshair_outline_inverse", 1)

local plr = LocalPlayer()
if hook.GetTable()["CalcView"]["thirdpersonmodel"] then
    hook.Remove("CalcView", "thirdpersonmodel")
    hook.Remove("HUDPaint", "crosshair")

    print("3D model off.")

    else
    
    print("3D model on.")
    local speed = 30
    local specpos = plr:EyePos()
    hook.Add("CalcView", "thirdpersonmodel", function(plr, origin, angles, fov)
	if IsValid(plr:GetViewEntity()) and plr:GetViewEntity() ~= plr then 
	    return
	end

	if plr:Alive() then

	    plr:ShouldDrawLocalPlayer(true)

	    local head = plr:LookupBone("ValveBiped.Bip01_Head1")
	    local headmatrix = plr:GetBoneMatrix(head)

	    local override = GetConVar("cl_3Dmodel_fov_override"):GetFloat()

	    local ofov = GetConVar("cl_3Dmodel_fov"):GetFloat()

	    plr:SetupBones()
	    if headmatrix then

	        local headang = headmatrix:GetAngles()
	        headang:RotateAroundAxis(headang:Up(), -90)
	        headang:RotateAroundAxis(headang:Forward(), -90)

	        local headmatpos = headmatrix:GetTranslation()
	        if headmatpos == headmatpos then
	    	    local view = {}
	    	    view.origin = (headmatpos + (headang:Up() * 6.6) + (headang:Forward() * 6.5)) + (plr:GetVelocity() * FrameTime())
	    	    view.angles = headang
	    	    
	    	    view.drawviewer = true
		    if override > 0 then
			view.fov = ofov
		    else
		    	view.fov = fov
		    end
	    	    return view
	        else
		    return
	        end
	    end
	else
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
	end
    end)
    hook.Add("HUDPaint", "crosshair", function()
	local trace = plr:GetEyeTrace()
	local hitpos = trace.HitPos:ToScreen()

	local size = GetConVar("cl_3Dmodel_crosshair_size"):GetFloat()

	local on = GetConVar("cl_3Dmodel_crosshair"):GetFloat()
	local olon = GetConVar("cl_3Dmodel_crosshair_outline"):GetFloat()
	local olsize = GetConVar("cl_3Dmodel_crosshair_outline_size"):GetFloat()

	local red = GetConVar("cl_3Dmodel_crosshair_red"):GetFloat()
	local green = GetConVar("cl_3Dmodel_crosshair_green"):GetFloat()
	local blue = GetConVar("cl_3Dmodel_crosshair_blue"):GetFloat()

	local olred = GetConVar("cl_3Dmodel_crosshair_red"):GetFloat()
	local olgreen = GetConVar("cl_3Dmodel_crosshair_green"):GetFloat()
	local olblue = GetConVar("cl_3Dmodel_crosshair_blue"):GetFloat()

	local olinverse = GetConVar("cl_3Dmodel_crosshair_outline_inverse"):GetFloat()

	if on > 0 then
		
	    if olon > 0 then

	    	if olinverse > 0 then
		    draw.RoundedBox(olsize, hitpos.x - olsize * 0.5, hitpos.y - olsize * 0.5, olsize, olsize, Color(255 - red, 255 - green, 255 - blue))
	    	else
		    draw.RoundedBox(olsize, hitpos.x - olsize * 0.5, hitpos.y - size * 0.5, size, size, Color(olred, olgreen, olblue))
	    	end
	    end

	    draw.RoundedBox(size, hitpos.x - size * 0.5, hitpos.y - size * 0.5, size, size, Color(red, green, blue))
	end
    end)
end