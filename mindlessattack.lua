hook.Remove("Think, "MindlessAttack")
local plr = LocalPlayer()
hook.Add("Think", "MindlessAttack", function()
     local enemies = ents.FindByClass("player")
	 for _, enemy in pairs(enemies) do
	     if IsValid(enemy) then
		 if enemy:Alive() == True then
		     if enemy ~= plr then
		     	local target = enemy:HeadTarget
		     	local aim = (target - plr:GetShootPos()):Angle()
		     	plr:SetViewAngles(aim)
		     	RunConsoleCommand("+attack1")
			RunConsoleCommand("+forward")
		     end
		 
		 if enemy:Death()
		     RunConsoleCommand("-attack1")
		     RunConsoleCommand("-forward")
		 end
	     end
	 end
     end
end)

		 
	
		     
		     
		     
		 
		 