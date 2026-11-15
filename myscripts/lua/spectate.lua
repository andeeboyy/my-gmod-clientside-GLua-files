local plr = LocalPlayer()
if hook.GetTable()["CalcView"]["spectate"] then
    hook.Remove("CalcView", "spectate")
    print("Spectate off.")

    else
    
    print("Spectate on.")
    local speed = 30
    local specpos = plr:EyePos()
    hook.Add("CalcView", "spectate", function(plrspec, origin, angles, fov)
	if plr:Alive() then 
	    specpos = plr:EyePos()
	    return
	end
	if plr:KeyDown(IN_FORWARD) then
	    specpos = specpos + plr:GetAimVector() * speed
	end
	if plr:KeyDown(IN_BACK) then
	    specpos = specpos + plr:GetAimVector() * speed * -1
	end
	if plr:KeyDown(IN_MOVERIGHT) then
	    specpos = specpos + plr:EyeAngles():Right() * speed
	end
	if plr:KeyDown(IN_MOVELEFT) then
	    specpos = specpos + plr:EyeAngles():Right() * speed * -1
	end
	if plr:KeyDown(IN_SPEED) then
	    speed = 30
	else
	    if plr:KeyDown(IN_DUCK) then
	        speed = 3
	    else
	        speed = 10
	    end
	end

	local view = {}
	view.origin = specpos
	view.angles = angles
	view.fov = fov
	view.drawviewer = true

	return view

    end)

end