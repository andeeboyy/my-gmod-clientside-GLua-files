CreateClientConVar("cl_aimer_keycancel", "x")
CreateClientConVar("cl_aimer_bodyshot", "0")
local plr = LocalPlayer()
if hook.GetTable()["Tick"]["aim"] then
    hook.Remove("Tick", "aim")
    print("Aimer Off.")

    else

    print("Aimer On.")

    local foundent = 0
    local target = plr:GetEyeTrace().Entity
    local find = plr:GetEyeTrace()
    hook.Add("Tick", "aim", function()
	local key = input.GetKeyCode(GetConVar("cl_aimer_keycancel"):GetString())
	
	foundent = 0
	if isentity(target) and IsValid(target) then
	    if IsValid(target) and target:IsPlayer() or target:IsNPC() then
		local head = target:LookupBone("ValveBiped.Bip01_Head1")
		if head ~= nil and GetConVar("cl_aimer_bodyshot"):GetFloat() < 1 then
		    local shootpoint = target:GetBonePosition(head) + Vector(0, 0, 1)
		    local shootangles = (shootpoint - plr:GetShootPos()):Angle()
		    plr:SetEyeAngles(shootangles)
		else
		    local shootpoint = target:WorldSpaceCenter()
		    local shootangles = (shootpoint - plr:GetShootPos()):Angle()
		    plr:SetEyeAngles(shootangles)
		end
		foundent = 1
	    end
	end
	if input.IsKeyDown(key) then
	    foundent = 0
	end
	if foundent == 1 then return end
    	target = plr:GetEyeTrace().Entity
    end)

end