repeat task.wait() until game:IsLoaded()

local queueTeleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
queueTeleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/RobloxScripts/main/TelanthricBedWars.lua", true))()')

local lplr = game:GetService("Players").LocalPlayer

local GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/CapeForRobloxBedwars/main/GuiLibrary.lua"), true)()

GuiLibrary:CreateMainGui()

GuiLibrary:CreateWindow("Combat")
GuiLibrary:CreateWindow("Blatant")
GuiLibrary:CreateWindow("Render")
GuiLibrary:CreateWindow("Utility")
GuiLibrary:CreateWindow("World")

local connections = {
    Invisibility = {},
    RemoveNameTag = {}
}

GuiLibrary:CreateModule("Blatant", "Invisibility", function(callback)
    if callback then
        local function charAdded(character)
            local hrp = character:WaitForChild("HumanoidRootPart")
            local old = hrp.CFrame
            task.wait(1)

            local tag = hrp:FindFirstChildOfClass("BillboardGui")
            if tag then
                tag:Destroy()
            end

            hrp.Parent = workspace
            character.PrimaryPart = hrp
            character:MoveTo(Vector3.new(old.X,9e9,old.Z))
            hrp.Parent = character
            task.wait(0.5)
            hrp.CFrame = old
        end
        if lplr.Character then
            charAdded(lplr.Character)
        end
        connections.Invisibility.characterAdded = lplr.CharacterAdded:Connect(charAdded)
    else
        for _, connection in pairs(connections.Invisibility) do
            if typeof(connection) == "RBXScriptConnection" then
                connection:Disconnect()
            end
        end
    end
end)

GuiLibrary:CreateModule("Utility", "RemoveNameTag", function(callback)
    if callback then
        local function charAdded(character)
            character:WaitForChild("Head"):WaitForChild("NametagBillboard"):Destroy()
        end
        if lplr.Character then
            charAdded(lplr.Character)
        end
        connections.RemoveNameTag.characterAdded = lplr.CharacterAdded:Connect(charAdded)
    else
        for _, connection in pairs(connections.RemoveNameTag) do
            if typeof(connection) == "RBXScriptConnection" then
                connection:Disconnect()
            end
        end
    end
end)
