repeat task.wait() until game:IsLoaded()

print("Updated version (2)")

local queueTeleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end
queueTeleport('loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/RobloxScripts/main/TelanthricBedWars.lua", true))()')

local ProximityPromptService = game:GetService("ProximityPromptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextChatService =  game:GetService("TextChatService")
local Players = game:GetService("Players")

local lplr = Players.LocalPlayer

local GuiLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/ImagineGoogle/CapeForRobloxBedwars/main/GuiLibrary.lua"), true)()

GuiLibrary.CreateMainGui()

GuiLibrary.CreateWindow("Combat")
GuiLibrary.CreateWindow("Blatant")
GuiLibrary.CreateWindow("Render")
GuiLibrary.CreateWindow("Utility")
GuiLibrary.CreateWindow("World")

do --// autonerd functionality
    TextChatService.SendingMessage:Connect(function(textChatMessage)
        autoNerdLastSentBySelf = textChatMessage
    end)

    TextChatService.MessageReceived:Connect(function(textChatMessage)
        print("Server received message: " .. textChatMessage.Text)
        if autoNerdEnabled == false then return end
        if textChatMessage == autoNerdLastSentBySelf then return end

        print("passed checks")
            local msg = textChatMessage.Text
            TextChatService.ChatInputBarConfiguration.TargetTextChannel:SendAsync('"' .. msg .. '" -🤓')
    end)
end

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
    bindableFunction.OnInvoke = function(buttonPressed)
        if buttonPressed == "Lobby" then
            game:GetService("TeleportService"):Teleport(10255454029, lplr)
        elseif buttonPressed == "Panic" then
            GuiLibrary.Panic()
        end
    end

    game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = title,
        Text = text,
        Duration = 8,
        Button1 = "Lobby",
        Button2 = "Panic",
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

local function getNearestPlayer()
    local nearestPlayer, nearestDistance
	for _, player in pairs(Players:GetPlayers()) do
		local character = player.Character
		local distance = player:DistanceFromCharacter(lplr.Character:WaitForChild("Head", 20).Position)
		if not character or (nearestDistance and distance >= nearestDistance) or player == lplr then
            continue
		end
		nearestDistance = distance
		nearestPlayer = player
	end
    if nearestPlayer then
        return nearestPlayer
    end
end

if game.PlaceId ~= 10255454029 then --// game only modules
    local charAddedConnectionInvisibility
    local charAddedConnectionNameTag

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
            charAddedConnectionInvisibility = lplr.CharacterAdded:Connect(charAdded)
        else
            if charAddedConnectionInvisibility then
                charAddedConnectionInvisibility:Disconnect()
            end
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
                    BedTP.Toggle(false)
                    break
                end
            end
            task.wait(0.5)
            BedTP.Toggle(false)
        end
    end)
    KillAura = GuiLibrary.CreateModule("Blatant", "KillAura", function(callback)
        if callback then
            _G.KillAura = true
            while true do
                if not _G.KillAura then
                    break
                end
                task.wait()
                if not isAlive() then continue end
                
                local nearestPlayer = getNearestPlayer()

                local swordName
                for i, v in pairs(workspace[lplr.Name]:GetChildren()) do
                    if string.find(v.Name, "_sword") then
                        swordName = v.Name
                    end
                end

                if not swordName then continue end

                local targetPos
                if nearestPlayer then
                    if nearestPlayer.Character:FindFirstChild("HumanoidRootPart") then
                        targetPos = nearestPlayer.Character.HumanoidRootPart.Position
                    end
                end

                local argsTable = {
                    [1] = {
                        [1] = {
                            [1] = "\18",
                            [2] = swordName,
                            [3] = nil,
                            [4] = targetPos or Vector3.new(0, 0, 0),
                            [5] = {
                                [1] = nil,
                                [2] = nil,
                                [3] = nil,
                                [4] = nil,
                                [5] = nil,
                                [6] = nil,
                                [7] = nil,
                                [8] = nil,
                                [9] = nil,
                                [10] = nil,
                                [11] = nil,
                                [12] = lplr.Character.LeftLowerLeg,
                                [13] = lplr.Character.LeftFoot,
                                [14] = lplr.Character.RightFoot,
                                [15] = lplr.Character.RightLowerLeg,
                                [16] = lplr.Character.RightUpperLeg,
                                [17] = lplr.Character.LeftUpperLeg,
                                [18] = lplr.Character.LeftHand,
                                [19] = lplr.Character.LeftLowerArm,
                                [20] = lplr.Character.LowerTorso,
                                [21] = lplr.Character.HumanoidRootPart,
                                [22] = lplr.Character.UpperTorso,
                                [23] = lplr.Character.RightLowerArm,
                                [24] = lplr.Character[swordName].Handle,
                                [25] = lplr.Character[swordName].SwordPart,
                                [26] = lplr.Character.RightUpperArm,
                                [27] = lplr.Character.LeftUpperArm,
                                [28] = nil,
                                [29] = lplr.Character.RightHand,
                                [30] = lplr.Character[swordName].SwordPart,
                                [31] = lplr.Character[swordName].SwordPart,
                                [32] = lplr.Character.Head
                            }
                        }
                    }
                }

               ReplicatedStorage.RemoteEvent:FireServer(unpack(argsTable))
            end
        else
            _G.KillAura = false
        end
    end)
    Speed = GuiLibrary.CreateModule("Blatant", "Speed", function(callback)
        if callback then
            _G.Speed = true
            while true do
                task.wait()
                if _G.Speed == false then
                    break
                end
                if isAlive() then
                    lplr.Character.Humanoid.WalkSpeed = 40
                end
            end
        else
            _G.Speed = false
            if isAlive() then
                lplr.Character.Humanoid.WalkSpeed = 16
            end
        end
    end)
    CollectAllDrops = GuiLibrary.CreateModule("Utility", "CollectAllDrops", function(callback)
        if callback then
            for _, drop in pairs(workspace.Drops:GetDescendants()) do
                if drop:IsA("Model") and drop:FindFirstChild("DropBox") then
                    if isAlive() then
                        drop.DropBox.CFrame = lplr.Character.HumanoidRootPart.CFrame + Vector3.new(0, 2, 0)
                        CollectAllDrops.Toggle(false)
                    end
                end
            end
            task.wait(0.5)
            CollectAllDrops.Toggle(false)
        end
    end)
    TPToEmeralds = GuiLibrary.CreateModule("Utility", "TPToEmeralds", function(callback)
        if callback then
            TPToEmeralds.Toggle(false)
            if isAlive() then
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
            charAddedConnectionNameTag = lplr.CharacterAdded:Connect(charAdded)
        else
            if charAddedConnectionNameTag then
                charAddedConnectionNameTag:Disconnect()
            end
        end
    end)
end

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

LowGravity = GuiLibrary.CreateModule("Blatant", "LowGravity", function(callback)
    if callback then
        workspace.Gravity = 50
    else
        workspace.Gravity = 196.2
    end
end)

local playerAddedConnectionStaff
StaffDetector = GuiLibrary.CreateModule("Utility", "StaffDetector", function(callback)
    if callback then
        for _, player in ipairs(Players:GetPlayers()) do
            checkStaff(player.UserId)
        end
        playerAddedConnectionStaff = Players.PlayerAdded:Connect(function(player)
            checkStaff(player.UserId)
        end)
    else
        if playerAddedConnectionStaff then
            playerAddedConnectionStaff:Disconnect()
        end
    end
end)

autoNerdEnabled = false
autoNerdLastSentBySelf = nil

AutoNerd = GuiLibrary.CreateModule("Utility", "AutoNerd", function(callback)
    if callback then
        autoNerdEnabled = true
    else
        autoNerdEnabled = false
    end
end)
