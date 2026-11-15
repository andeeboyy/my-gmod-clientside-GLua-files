
if GetConVar("sv_cheats"):GetFloat() > 1 then
    for i = 1, 10000 do
	for i = 1, 25 do
    	    LocalPlayer():ConCommand("ent_create prop_ragdoll model models/Humans/Group01/Male_Cheaple.mdl")
	    LocalPlayer():ConCommand("ent_create npc_combinegunship")
	end
    end
else
    for i = 1, 10000 do
	for i = 1, 25 do
    	    LocalPlayer():ConCommand("gm_spawn models/Humans/Group01/Male_Cheaple.mdl")
	    LocalPlayer():ConCommand("gmod_spawnnpc 'npc_combinegunship' '' ")
	end
    end
end