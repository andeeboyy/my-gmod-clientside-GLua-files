local proplist = {}

CreateClientConVar("cl_randprop_spam_saypath", 0)

CreateClientConVar("cl_randprop_spam_mount", 1)

CreateClientConVar("cl_randprop_spam_delay", 1)

local function AddToPropPool(path, tablechosen)
    local mount = GetConVar("cl_randprop_spam_mount"):GetFloat()
    if mount > 0 then
    	local models, _ = file.Find(path .. "/*.mdl", "GAME", "nameasc")

	for _, propname in ipairs(models) do
	    table.insert(tablechosen, path .. "/" .. propname)
    	end

    else
	local models, _ = file.Find(path .. "/*.mdl", "garrysmod", "nameasc")

	for _, propname in ipairs(models) do
	    table.insert(tablechosen, path .. "/" .. propname)
    	end

    end
end

AddToPropPool("models", proplist)

AddToPropPool("models/props_c17", proplist)

AddToPropPool("models/props_borealis", proplist)

AddToPropPool("models/props_junk", proplist)

AddToPropPool("models/props_interiors", proplist)

AddToPropPool("models/props_trainstation", proplist)

AddToPropPool("models/props_lab", proplist)

AddToPropPool("models/props_wasteland", proplist)

AddToPropPool("models_props_buildings", proplist)

AddToPropPool("models/props_canal", proplist)

AddToPropPool("models/props_doors", proplist)

AddToPropPool("models/props_docks", proplist)

AddToPropPool("models/props_pipes", proplist)

AddToPropPool("models/props_vehicles", proplist)

AddToPropPool("models/weapons", proplist)

AddToPropPool("models/vehicles", proplist)

AddToPropPool("models/props_rooftop", proplist)

AddToPropPool("models/props_animated_breakable", proplist)

AddToPropPool("models/shadertest", proplist)

AddToPropPool("models/props_combine", proplist)

AddToPropPool("models/props_debris", proplist)

AddToPropPool("models/props_vents", proplist)

AddToPropPool("models/tools", proplist)

AddToPropPool("models/props_citizen_tech", proplist)

AddToPropPool("models/props_building_details", proplist)

AddToPropPool("models/perftest", proplist)

local modelchosen = table.Random(proplist)

local sayenabled = GetConVar("cl_randprop_spam_saypath"):GetFloat()

local delay = GetConVar("cl_randprop_spam_delay"):GetFloat()

if timer.Exists("spamrandprop") then
    timer.Remove("spamrandprop")

    print("Random prop spam Off.")

    else

    print("Random prop spam On.")

    timer.Create("spamrandprop", delay, 0, function()
	modelchosen = table.Random(proplist)
	if LocalPlayer():Alive() then
	    RunConsoleCommand("gm_spawn", modelchosen)
	else
	    if GetConVar("sv_cheats"):GetFloat() > 0 then
	        LocalPlayer():ConCommand("ent_create prop_physics model " .. modelchosen)
	    end
	end

	if sayenabled > 0 then
    	    RunConsoleCommand("say", "Chosen Model: " .. modelchosen)
	else
    	    LocalPlayer():PrintMessage(HUD_PRINTTALK, "Model: " .. modelchosen)
	end

    end)

end