repeat task.wait() until game:IsLoaded()

local queueTeleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
queueTeleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/RobloxScripts/main/TelanthricBedWars.lua", true))()')

local RunService = game:GetService("RunService")
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
        72384463,
        1331206578,
        1874945531,
        1806776213,
        3449929636,
        1663033062,
        3905268304,
        3101357928,
        1129645697,
        102885721,
        1668757721
    }
}

local function createStaffNotif(title, text)
    local bindableFunction = Instance.new("BindableFunction")
    bindableFunction.OnInvoke = function()
        game:GetService("TeleportService"):Teleport(10255454029, lplr)
    end

    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = title,
        Text = text,
        Duration = 8,
        Button1 = "Lobby",
        Callback = bindableFunction
    })
end

local function checkStaff(id)
    local player = Players:GetPlayerByUserId(id)
    local rank = player:GetRankInGroup(15022320)

    if table.find(staff.Moderators, id) or rank == 167 or rank == 197 then
        createStaffNotif("Moderator Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
    elseif rank == 10 then
        createStaffNotif("Tester Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
    elseif rank == 137 then
        createStaffNotif("YouTuber Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
    elseif rank == 147 then
        createStaffNotif("Investor Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
    elseif rank == 157 then
        createStaffNotif("Contributor Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
    elseif rank == 254 then
        createStaffNotif("Developer Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
    elseif rank == 255 then
        createStaffNotif("Owner Detected", Players:GetNameFromUserIdAsync(id) .. " is in your game")
    end
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

local function getBedByTeamColour(teamColour)
    local placedItems = workspace:FindFirstChild("PlacedItems")
    if not placedItems then return end

    for _, item in pairs(placedItems:GetDescendants()) do
        if item:IsA("Model") and item.Name == "bed" then
            local bedColour = item.bed.ColorPart.BrickColor
            if bedColour == teamColour then
                return item
            end
        end
    end
end

Invisibility = GuiLibrary.CreateModule("Blatant", "Invisibility", function(callback)
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
        charAddedConnection = lplr.CharacterAdded:Connect(charAdded)
    else
        charAddedConnection:Disconnect()
    end
end)

BedTP = GuiLibrary.CreateModule("Blatant", "BedTP", function(callback)
    if callback then      
        for _, team in pairs(game:GetService("Teams"):GetTeams()) do
            if #team:GetPlayers() ~= 0 and team ~= lplr.Team then
                local bed = getBedByTeamColour(team.TeamColor)
                if bed and isAlive() then
                    lplr.Character.HumanoidRootPart.CFrame = bed.bed.ColorPart.CFrame + Vector3.new(0, 5, 0)
                end
                break
            end
        end
        BedTP.Toggle(false)
    end
end)

LongJump = GuiLibrary.CreateModule("Blatant", "LongJump", function(callback)
    if callback then
        if isAlive() then
            local hrp = lplr.Character.HumanoidRootPart
            hrp.AssemblyLinearVelocity += (hrp.CFrame.LookVector * 200) + Vector3.new(0, 60, 0)
        end
        task.wait(0.4)
        LongJump.Toggle(false)
    end
end)

RemoveNameTag = GuiLibrary.CreateModule("Utility", "RemoveNameTag", function(callback)
    if callback then
        local function charAdded(character)
            local head = character:WaitForChild("Head")
            local nametag = head:FindFirstChildOfClass("BillboardGui")
            if nametag then
                nametag:Destroy()
            end
        end
        if lplr.Character then
            charAdded(lplr.Character)
        end
        charAddedConnection = lplr.CharacterAdded:Connect(charAdded)
    else
        charAddedConnection:Disconnect()
    end
end)

TPToEmeralds = GuiLibrary.CreateModule("Utility", "TPToEmeralds", function(callback)
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
            TPToEmeralds.Toggle(false)
        end
    end
end)

CollectAllDrops = GuiLibrary.CreateModule("Utility", "CollectAllDrops", function(callback)
    if callback then
        RunService:BindToRenderStep("CollectAllDrops", 4, function()
            local drops = workspace:FindFirstChild("Drops")
            if drops then
                for _, drop in pairs(drops:GetDescendants()) do
                    if drop:IsA("Model") and drop:FindFirstChild("DropBox") then
                        if isAlive() then
                            drop.DropBox.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(math.random(0, 2), math.random(0, 2), math.random(0, 2))
                        end
                    end
                end
            end
        end)
    else
        RunService:UnbindFromRenderStep("CollectAllDrops")
    end
end)

StaffDetector = GuiLibrary.CreateModule("Utility", "StaffDetector", function(callback)
    if callback then
        for _, player in ipairs(Players:GetPlayers()) do
            checkStaff(player.UserId)
        end
        playerAddedConnection = Players.PlayerAdded:Connect(function(player)
            checkStaff(player.UserId)
        end)
    else
        playerAddedConnection:Disconnect()
    end
end)
