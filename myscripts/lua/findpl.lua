for _, player in ipairs(ents.FindByClass("player")) do
    print(player:Nick() .. "  " .. player:EntIndex())
end