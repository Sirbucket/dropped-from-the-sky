local draw_RoundedBox = draw.RoundedBox
local hook_Add = hook.Add
local draw_SimpleText = draw.SimpleText
local draw_SimpleTextOutlined = draw.SimpleTextOutlined

local Color = Color

local hud_elements = {
    ["CHudHealth"] = true,
    ["CHudBattery"] = true,
    ["CHudAmmo"] = true,
    ["CHudSecondaryAmmo"] = true,
}

local bgcoloroutline = Color(25, 25, 25, 200)
local function drawBarNoRadius(x, y, w, h, red, green, blue, alpha, tw, th, text, font)
    draw_RoundedBox(0, x, y, w, h, Color(red, green, blue, alpha))
    draw_SimpleTextOutlined(text, font, tw, th, Color( red, green, blue, 255), 0, 0, 1, bgcoloroutline)
end

local bgcolor = Color(50, 50, 50, 255)
function Hud(health)
    if not MySelf then return end
    
    local h = ScrH()
    local w = ScrW()
    local health = MySelf:Health()
    local healthMod = health/100
    local colorMod = health*10
    draw_RoundedBox(4, w/4.05, h - (h/19.5), w/1.95, h/25, bgcolor)
    if health > 60 then
        drawBarNoRadius(w/4, h - h/25, w/2*healthMod, h/ 50, 0, 255*healthMod, 0, 200, w/2, h - h/25.5, "Health: "..health, "DermaDefaultBold")
    else 
        drawBarNoRadius(w/4, h - h/25, w/2*healthMod, h/ 50, 5*colorMod, 255*healthMod, 0, 200, w/2, h - h/25.5, "Health: "..health, "DermaDefaultBold")
    end
end

hook_Add("HUDPaint", "TestHud", Hud)

function HideHud(name)
    if name == nil or hud_elements[name] then return end
end

hook_Add("HUDShouldDraw", "HideDefaultHud", HideHud)