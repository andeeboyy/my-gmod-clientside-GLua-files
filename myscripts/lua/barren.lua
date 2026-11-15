for _, ent in ents.Iterator() do
    RunConsoleCommand("ent_remove_all", ent:GetClass())
end

local list = {
    "worldspawn",
    "soundent",
    "player_manager",
    "gmod_gamerules",
    "network",
    "scene_manager",
    "point_spotlight",
    "info_ladder_dismount",
    "info_player_start",
    "light",
    "lua_run",
    "path_corner",
    "func_reflective_glass",
    "func_button",
    "path_track",
    "logic_case",
    "func_vehicleclip",
    "water_lod_control",
    "hint",
    "shadow_control",
    "sky_camera",
    "light_environment",
    "env_fog_controller",
    "env_sun",
    "env_soundscape",
    "prop_dynamic",
    "env_tonemap_controller",
    "spotlight_end",
    "player",
    "predicted_viewmodel",
}

for _, ent in ipairs(list) do
    RunConsoleCommand("ent_remove_all", ent)
end