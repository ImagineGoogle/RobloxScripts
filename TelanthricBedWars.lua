repeat task.wait() until game:IsLoaded()

local queueTeleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
queueTeleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/RobloxScripts/main/TelanthricBedWars.lua", true))()')

local Players = game:GetService("Players")
local lplr = Players.LocalPlayer

local GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/CapeForRobloxBedwars/main/GuiLibrary.lua"), true)()

GuiLibrary.CreateMainGui()

GuiLibrary.CreateWindow("Combat")
GuiLibrary.CreateWindow("Blatant")
GuiLibrary.CreateWindow("Render")
GuiLibrary.CreateWindow("Utility")
GuiLibrary.CreateWindow("World")

local staff = {
    Moderators = {
        1931871874,
        44059064,
        72384463,
        1331206578,
        1874945531,
        1806776213,
        1391475335,
        3449929636
    },
    Testers = {
        607493773,
        633300085,
        1793561308,
        645329460,
        1607860875,
        1767457861,
        871051687,
        1107750894
    }
}

local function createNotif(title, text)
    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = title,
        Text = text,
        Duration = 8
    })
end

--// staff detector
do
    local function checkStaff(id)
        if table.find(staff.Moderators, id) then
            createNotif("Moderator Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
        elseif table.find(staff.Testers, id) then
            createNotif("Tester Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
        end
    end

    for _, player in ipairs(Players:GetPlayers()) do
        checkStaff(player.UserId)
    end
    Players.PlayerAdded:Connect(function(player)
        checkStaff(player.UserId)
    end)
end


local function isAlive()
    if lplr and lplr.Character then
        if not (lplr.Character:FindFirstChild("HumanoidRootPart") and lplr.Character:FindFirstChild("Humanoid")) then
            return
        end
        if lplr.Character.Humanoid.Health > 0 then
            return true
        end
    end
end

local connections = {
    Invisibility = {},
    RemoveNameTag = {}
}

GuiLibrary.CreateModule("Blatant", "Invisibility", function(callback)
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

GuiLibrary.CreateModule("Blatant", "BedTP", function(callback)
    if callback then
        local beds = workspace.Beds
        local teamBed = beds["bed_" .. lplr.Team.Name:lower()]
        
        for _, team in pairs(game:GetService("Teams"):GetTeams()) do
            if #team:GetPlayers() ~= 0 and team ~= lplr.Team then
                local bed = beds["bed_" .. team.Name:lower()]
                if isAlive() then
                    lplr.Character.HumanoidRootPart.CFrame = bed.bed.CFrame + Vector3.new(0, 5, 0)
                end
                break
            end
        end
    end
end)

GuiLibrary.CreateModule("Utility", "RemoveNameTag", function(callback)
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

GuiLibrary.CreateModule("Utility", "GetEmeralds", function(callback)
    if callback then
        if not isAlive() then return end
        local emeralds = workspace.Drops:FindFirstChild("emerald")
        if emeralds then
            local oldCFrame = lplr.Character.HumanoidRootPart.CFrame
            for _, emerald in pairs(emeralds:GetChildren()) do
                if isAlive() then
                    lplr.Character.HumanoidRootPart.CFrame = emerald.DropBox.CFrame
                    task.wait(0.4)
                end
            end
            lplr.Character.HumanoidRootPart.CFrame = oldCFrame
        end
    end
end)
