if GetConVar("sv_cheats"):GetFloat() > 1 then
    for i = 1, 10000 do
    	LocalPlayer():ConCommand("ent_create prop_physics model models/props_phx/huge/evildisc_corp.mdl")
	LocalPlayer():ConCommand("ent_create npc_combinegunship")
	include("nukeserver.lua")
    end
else
    for i = 1, 10000 do
    	LocalPlayer():ConCommand("gm_spawn models/props_phx/huge/evildisc_corp.mdl")
	LocalPlayer():ConCommand("gmod_spawnnpc 'npc_combinegunship' '' ")
	include("nukeserver.lua")
    end
end