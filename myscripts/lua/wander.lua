local velocity = LocalPlayer():GetVelocity()
local random = 0
local plr = LocalPlayer()
local vel = plr:GetVelocity()
local randang = Angle(math.Rand(-70, 70), math.Rand(0, 360), 0)

if timer.Exists("Wander") then
    timer.Remove("Wander")
    RunConsoleCommand("-forward")
    RunConsoleCommand("-speed")
    print("Wander Off")

else
    print("Wander On, Mayamode thirdperson recommended")

    timer.Create("Wander", 0.1, 0, function()

	timer.Adjust("Wander", math.Rand(0.01, 10), nil, nil)

	random = math.random(1, 3)

	if random == 3 then
	    RunConsoleCommand("+speed")
	else
	    RunConsoleCommand("-speed")
	end
	
    	randang = Angle(math.Rand(-70, 70), math.Rand(0, 360), 0)
    	plr:SetEyeAngles(randang)
    	RunConsoleCommand("+forward")

    end)

end

local leastvel = 100

if timer.Exists("Bounce") then
    timer.Remove("Bounce")

else
    timer.Create("Bounce", 0.25, 0, function()
    	velocity = LocalPlayer():GetVelocity()
    	if velocity:Length() < leastvel then
    	    randang = Angle(math.Rand(-70, 70), math.Rand(0, 360), 0)
    	    plr:SetEyeAngles(randang)
	end
    end)
end


if timer.Exists("Jump") then
    timer.Remove("Jump")
else
    timer.Create("Jump", 0.1, 0, function()
	timer.Adjust("Jump", math.Rand(0.01, 5), nil, nil)
	RunConsoleCommand("+jump")

	timer.Simple(0.05, function()
	    RunConsoleCommand("-jump")
	end)

    end)
end


