local ply = LocalPlayer()
local pos = ply:GetPos()
local speed = 5
if timer.Exists("noclip") then
    timer.Remove("noclip")

    print("Noclip off")

    else

    print("Noclip on")

    timer.Create("noclip", 0.015, 0, function()
	if ply:KeyDown(IN_FORWARD) then
	    pos = pos + ply:GetAimVector() * speed
	end
	if ply:KeyDown(IN_BACK) then
	    pos = pos + ply:GetAimVector() * speed * -1
	end
	if ply:KeyDown(IN_MOVERIGHT) then
	    pos = pos + ply:EyeAngles():Right() * speed
	end
	if ply:KeyDown(IN_MOVELEFT) then
	    pos = pos + ply:EyeAngles():Right() * speed * -1
	end
	if ply:KeyDown(IN_JUMP) then
	    pos = pos + Vector(0, 0, speed)
	end
	if ply:KeyDown(IN_SPEED) then
	    speed = 50
	else
	    speed = 15
	end
	RunConsoleCommand("setpos_exact", tostring(pos.x), tostring(pos.y), tostring(pos.z))
	if ply:GetMoveType() ~= MOVETYPE_NOCLIP then
	    RunConsoleCommand("noclip")
	end
    end)

end

