AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("vgui/cl_health_hud.lua")
include("shared.lua")

function GM:PlayerSpawn(player)
    --loadouts
    player:SetGravity(1)
    player:SetMaxHealth(100)
    player:SetRunSpeed(500)
    player:SetWalkSpeed(200)
    player:Give("weapon_physcannon")
    player:Give("weapon_physgun")
end