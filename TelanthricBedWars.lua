repeat task.wait() until game:IsLoaded()

local queueTeleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
queueTeleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/RobloxScripts/main/TelanthricBedWars.lua", true))()')

local GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/CapeForRobloxBedwars/main/GuiLibrary.lua"), true)()

GuiLibrary:CreateMainGui()

GuiLibrary:CreateWindow("Combat")
GuiLibrary:CreateWindow("Blatant")
GuiLibrary:CreateWindow("Render")
GuiLibrary:CreateWindow("Utility")
GuiLibrary:CreateWindow("World")

GuiLibrary:CreateModule("Blatant", "KillAura", function(callback)
    if callback then
        print("Enabled")
    else
        print("Disabled")
    end
end)
