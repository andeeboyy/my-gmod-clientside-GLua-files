
if GetConVar("sv_cheats"):GetFloat() > 1 then
    for i = 1, 1000 do
	for i = 1, 300 do
	    LocalPlayer():ConCommand("ent_create env_fire spawnflags 269 firesize 100000 fireattack 1000")
	end
    end
end
