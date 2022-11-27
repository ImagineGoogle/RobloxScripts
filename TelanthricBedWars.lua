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

local invisibilityConnections = {}

GuiLibrary:CreateModule("Blatant", "KillAura", function(callback)
    
end)

GuiLibrary:CreateModule("Blatant", "Invisibility", function(callback)
    if callback then
        local function charAdded(character)
            local hrp = character:WaitForChild("HumanoidRootPart")
            local old = hrp.CFrame
            task.wait(0.3)

            local tag = hrp:FindFirstChildOfClass("BillboardGui")
            if tag then
                tag:Destroy()
            end

            local newroot = character.LowerTorso.Root:Clone()
            hrp.Parent = workspace
            character.PrimaryPart = hrp
            character:MoveTo(Vector3.new(old.X,9e9,old.Z))
            hrp.Parent = character
            task.wait(0.5)
            newroot.Parent = hrp
            hrp.CFrame = old
        end
        invisibilityConnections.characterAdded = lplr.CharacterAdded:Connect(charAdded)
    else
        for _, connection in ipairs(invisibilityConnections) do
            print("E")
            if typeof(connection) == "RBXScriptConnection" then
                connection:Disconnect()
            end
        end
    end
end)
