local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local Teams = game:GetService("Teams")

local localPlayer = game:GetService("Players").LocalPlayer
local config = getgenv().MinecraftifyBedWarsConfig
local mouse = localPlayer:GetMouse()
local folderName = "BedWarsUI/"
local guiObjects = {}
local cachedAssets = {}
local cachedAssets2 = {}
local mainScreenGui
local betterTeamColours = {
    Green = Color3.fromRGB(83, 211, 51)
}

local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport
local getasset = getsynasset or getcustomasset

if config.ExecuteOnTeleport ~= false then
    queueteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/ImagineGoogle/RobloxScripts/main/MinecraftifyBedWars/NewMainScript.lua'))()")
end

if not game:IsLoaded() then
    game.Loaded:Wait()
end

local Knit = require(ReplicatedStorage["rbxts_include"]["node_modules"]["@easy-games"]["knit"]["src"]).KnitClient

local modules = {
    ["CameraPerspectiveController"] = Knit.Controllers.CameraPerspectiveController,
    ["WeldTable"] = require(ReplicatedStorage.TS.util["weld-util"]).WeldUtil
}

local function betterisfile(path)
    if cachedAssets2[path] == nil then
        cachedAssets2[path] = isfile(folderName .. path)
    end
    return cachedAssets2[path]
end

local function getcustomassetfunc(path)
	if not isfile(folderName .. path) then
		local req = requestfunc({
			Url = "https://raw.githubusercontent.com/ImagineGoogle/RobloxScripts/main/MinecraftifyBedWars/" .. path,
			Method = "GET"
		})
		writefile(folderName .. path, req.Body)
	end
    if cachedAssets[folderName .. path] == nil then
        cachedAssets[folderName .. path] = getasset(folderName .. path)
    end
	return cachedAssets[folderName .. path]
end

local function downloadassets(path)
    local json = requestfunc({
        Url = "https://api.github.com/repos/ImagineGoogle/RobloxScripts/contents/MinecraftifyBedWars/".. path,
        Method = "GET"
    })
    local decodedjson = game:GetService("HttpService"):JSONDecode(json.Body)
    for i, v in pairs(decodedjson) do
        if v["type"] == "file" then
			getcustomassetfunc(path.."/"..v["name"])
		end
    end
end

if not isfolder("BedWarsUI") then
    makefolder("BedWarsUI")
end
if not isfolder("BedWarsUI/textures") then
    makefolder("BedWarsUI/textures")
end
downloadassets("BedWarsUI/textures")

local function createMainGui()
    mainScreenGui = Instance.new("ScreenGui")
    mainScreenGui.Name = "BedWarsUI"
    mainScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    mainScreenGui.DisplayOrder = 999999999
    mainScreenGui.ResetOnSpawn = false
    guiObjects.BedWarsUI = mainScreenGui

    if gethui and (not KRNL_LOADED) then
        mainScreenGui.Parent = gethui()
    elseif not is_sirhurt_closure and syn and syn.protect_gui then
        syn.protect_gui(mainScreenGui)
        mainScreenGui.Parent = game:GetService("CoreGui")
    else
        mainScreenGui.Parent = game:GetService("CoreGui")
    end
end

local function createScoreboard()

    local Scoreboard = Instance.new("Frame")
    local wwweasygg = Instance.new("TextLabel")
    local MainObjects = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")
    local BEDWARS = Instance.new("TextLabel")
    local GameInfoFrame = Instance.new("Frame")
    local Date = Instance.new("TextLabel")
    local Game = Instance.new("TextLabel")
    local NextEventFrame = Instance.new("Frame")
    local NextEventTimer = Instance.new("TextLabel")
    local NextEvent = Instance.new("TextLabel")

    --Properties:

    Scoreboard.Name = "Scoreboard"
    Scoreboard.Parent = mainScreenGui
    Scoreboard.AnchorPoint = Vector2.new(0.99000001, 0.5)
    Scoreboard.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Scoreboard.BackgroundTransparency = 0.600
    Scoreboard.BorderColor3 = Color3.fromRGB(27, 42, 53)
    Scoreboard.Position = UDim2.new(0.99000001, 0, 0.5, 0)
    Scoreboard.Size = UDim2.new(0, 234, 0, 157)

    wwweasygg.Name = "www.easy.gg"
    wwweasygg.Parent = Scoreboard
    wwweasygg.AnchorPoint = Vector2.new(0, 1)
    wwweasygg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    wwweasygg.BackgroundTransparency = 1.000
    wwweasygg.BorderSizePixel = 0
    wwweasygg.Position = UDim2.new(0.051282052, 0, 1, 0)
    wwweasygg.Size = UDim2.new(0.948717952, 0, 0.119227365, 0)
    wwweasygg.Font = Enum.Font.SourceSans
    wwweasygg.Text = "www.easy.gg"
    wwweasygg.TextColor3 = Color3.fromRGB(252, 255, 75)
    wwweasygg.TextSize = 27.000
    wwweasygg.TextXAlignment = Enum.TextXAlignment.Left
    wwweasygg.TextYAlignment = Enum.TextYAlignment.Bottom

    MainObjects.Name = "MainObjects"
    MainObjects.Parent = Scoreboard
    MainObjects.AnchorPoint = Vector2.new(0.99000001, 0.5)
    MainObjects.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    MainObjects.BackgroundTransparency = 1.000
    MainObjects.BorderColor3 = Color3.fromRGB(27, 42, 53)
    MainObjects.Position = UDim2.new(0.99000001, 0, 0.5, 0)
    MainObjects.Size = UDim2.new(1, 0, 1, 0)

    UIListLayout.Parent = MainObjects
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

    BEDWARS.Name = "BEDWARS"
    BEDWARS.Parent = MainObjects
    BEDWARS.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    BEDWARS.BackgroundTransparency = 1.000
    BEDWARS.BorderSizePixel = 0
    BEDWARS.Size = UDim2.new(1, 0, 0.0746753216, 0)
    BEDWARS.Font = Enum.Font.SourceSans
    BEDWARS.Text = "BED WARS"
    BEDWARS.TextColor3 = Color3.fromRGB(252, 255, 75)
    BEDWARS.TextSize = 27.000

    GameInfoFrame.Name = "GameInfoFrame"
    GameInfoFrame.Parent = MainObjects
    GameInfoFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    GameInfoFrame.BackgroundTransparency = 1.000
    GameInfoFrame.Position = UDim2.new(0.051282052, 0, 0.0746752992, 0)
    GameInfoFrame.Size = UDim2.new(0, 222, 0, 26)

    Date.Name = "Date"
    Date.Parent = GameInfoFrame
    Date.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Date.BackgroundTransparency = 1.000
    Date.Position = UDim2.new(0, 0, 0.0746753365, 0)
    Date.Size = UDim2.new(0.440171152, 0, 1, 0)
    Date.Font = Enum.Font.SourceSans
    Date.Text = "DD/MM/YY"
    Date.TextColor3 = Color3.fromRGB(173, 173, 173)
    Date.TextSize = 27.000
    Date.TextWrapped = true
    Date.TextXAlignment = Enum.TextXAlignment.Left

    Game.Name = "Game"
    Game.Parent = GameInfoFrame
    Game.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Game.BackgroundTransparency = 1.000
    Game.Position = UDim2.new(0.440171093, 0, 0.0746753365, 0)
    Game.Size = UDim2.new(0.47863245, 0, 1, 0)
    Game.Font = Enum.Font.SourceSans
    Game.Text = "m451P"
    Game.TextColor3 = Color3.fromRGB(152, 152, 152)
    Game.TextSize = 27.000
    Game.TextWrapped = true
    Game.TextXAlignment = Enum.TextXAlignment.Left

    NextEventFrame.Name = "NextEventFrame"
    NextEventFrame.Parent = MainObjects
    NextEventFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NextEventFrame.BackgroundTransparency = 1.000
    NextEventFrame.Position = UDim2.new(0.051282052, 0, 0.168538123, 0)
    NextEventFrame.Size = UDim2.new(0, 222, 0, 41)

    NextEventTimer.Name = "NextEventTimer"
    NextEventTimer.Parent = NextEventFrame
    NextEventTimer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NextEventTimer.BackgroundTransparency = 1.000
    NextEventTimer.Position = UDim2.new(0.266, 0,0, 0)
    NextEventTimer.Size = UDim2.new(0.135, 0,1, 0)
    NextEventTimer.Font = Enum.Font.SourceSans
    NextEventTimer.Text = "00:00"
    NextEventTimer.TextColor3 = Color3.fromRGB(63, 255, 53)
    NextEventTimer.TextSize = 27.000
    NextEventTimer.TextXAlignment = Enum.TextXAlignment.Left
    NextEventTimer.TextYAlignment = Enum.TextYAlignment.Bottom
    NextEventTimer.AutomaticSize = Enum.AutomaticSize.X

    NextEvent.Name = "NextEvent"
    NextEvent.Parent = NextEventFrame
    NextEvent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    NextEvent.BackgroundTransparency = 1.000
    NextEvent.Size = UDim2.new(0, 1, 1, 0)
    NextEvent.Font = Enum.Font.SourceSans
    NextEvent.Text = "Time : "
    NextEvent.TextColor3 = Color3.fromRGB(255, 255, 255)
    NextEvent.TextSize = 27.000
    NextEvent.TextXAlignment = Enum.TextXAlignment.Left
    NextEvent.TextYAlignment = Enum.TextYAlignment.Bottom
    NextEvent.AutomaticSize = Enum.AutomaticSize.X

    local currentDate = DateTime.now():ToLocalTime()
    Date.Text = string.format("%s/%s/%s", currentDate.Day, currentDate.Month, currentDate.Year)

    task.spawn(function() --timer

        pcall(function()
            if not localPlayer.Character then
                repeat task.wait() until localPlayer.Character
            end
            repeat task.wait() until localPlayer.Character.PrimaryPart.Position.Y <= 140 or workspace:FindFirstChild("spawn_cage")
    
            local minutes = 0
            local seconds = 0
    
            while true do
                task.wait(1)
                seconds += 1
                if seconds == 60 then
                    seconds = 0
                    minutes += 1
                end
                NextEventTimer.Text = string.format("%02i:%02i", minutes, seconds)
            end
        end)
    end)
end

local function createTeamsFrame()
    local Teams = Instance.new("Frame")
    local TeamContainer = Instance.new("Frame")
    local UIListLayout = Instance.new("UIListLayout")

    Teams.Name = "Teams"
    Teams.Parent = game:GetService("CoreGui").BedWarsUI.Scoreboard or nil
    Teams.AnchorPoint = Vector2.new(0, 0.5)
    Teams.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Teams.BackgroundTransparency = 1.000
    Teams.BorderSizePixel = 0
    Teams.Position = UDim2.new(0.051282052, 0, 0.5, 0)
    Teams.Size = UDim2.new(0, 222, 1, 0)

    guiObjects.Teams = Teams

    TeamContainer.Name = "TeamContainer"
    TeamContainer.Parent = Teams
    TeamContainer.AnchorPoint = Vector2.new(0, 0.5)
    TeamContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TeamContainer.BackgroundTransparency = 1.000
    TeamContainer.Position = UDim2.new(0, 0, 0.600000024, 0)
    TeamContainer.Size = UDim2.new(1, 0, 0.41155234, 0)

    UIListLayout.Parent = TeamContainer
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
end

local function createTeam(name, team)
    -- Instances:

    local Red = Instance.new("Frame")
    local YOU = Instance.new("TextLabel")
    local Players = Instance.new("TextLabel")
    local Label = Instance.new("TextLabel")
    local OneLetterLabel = Instance.new("TextLabel")
    local UIListLayout = Instance.new("UIListLayout")

    --Properties:

    Red.Name = name
    Red.Parent = guiObjects.Teams.TeamContainer
    Red.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Red.BackgroundTransparency = 1.000
    Red.BorderSizePixel = 0
    Red.Position = UDim2.new(0, 0, 0, 26)
    Red.Size = UDim2.new(0, 222, 0, 26)

    UIListLayout.Name = "UIListLayout"
    UIListLayout.Parent = Red
    UIListLayout.FillDirection = Enum.FillDirection.Horizontal
    UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
    UIListLayout.SortOrder = Enum.SortOrder.Name

    OneLetterLabel.Name = "!!!!OneLetterLabel"
    OneLetterLabel.Parent = Red
    OneLetterLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    OneLetterLabel.BackgroundTransparency = 1.000
    OneLetterLabel.BorderSizePixel = 0
    OneLetterLabel.Size = UDim2.new(0, 18, 0, 26)
    OneLetterLabel.Font = Enum.Font.SourceSans
    OneLetterLabel.Text = string.sub(name, 1, 1)
    OneLetterLabel.TextColor3 = team.TeamColor.Color
    OneLetterLabel.TextSize = 27.000
    OneLetterLabel.TextXAlignment = Enum.TextXAlignment.Left
    OneLetterLabel.LayoutOrder = 1
    --OneLetterLabel.AutomaticSize = Enum.AutomaticSize.X

    --// better team colours

    for i, v in pairs(betterTeamColours) do
        if name == i then
            OneLetterLabel.TextColor3 = v
        end
    end

    Label.Name = "!!!Label"
    Label.Parent = Red
    Label.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Label.BackgroundTransparency = 1.000
    Label.BorderSizePixel = 0
    --Label.Position = UDim2.new(0, Label.Size.X.Offset, 0, 0)
    Label.Size = UDim2.new(0, 46, 0, 26)
    Label.Font = Enum.Font.SourceSans
    Label.Text = name .. ":"
    Label.TextColor3 = Color3.fromRGB(255, 255, 255)
    Label.TextSize = 27.000
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.AutomaticSize = Enum.AutomaticSize.X
    Label.LayoutOrder = 2

    Players.Name = "!!Players"
    Players.Parent = Red
    Players.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    Players.BackgroundTransparency = 1.000
    Players.BorderSizePixel = 0
    --Players.Position = UDim2.new(0, Label.Size.X.Offset, 0, 0) + UDim2.new(0, OneLetterLabel.Size.X.Offset, 0, 0) + UDim2.new(0, 5, 0, 0)
    Players.Size = UDim2.new(0, 18, 0, 26)
    Players.Font = Enum.Font.SourceSans
    Players.Text = "✓"
    Players.TextColor3 = Color3.fromRGB(63, 255, 53)
    Players.TextSize = 27.000
    Players.TextXAlignment = Enum.TextXAlignment.Left
    Players.LayoutOrder = 3
    Players.AutomaticSize = Enum.AutomaticSize.X
    if Label.Text ~= "Red:" then
        Players.Text = " ✓"
    end

    YOU.Name = "!YOU"
    YOU.Parent = Red
    YOU.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    YOU.BackgroundTransparency = 1.000
    YOU.BorderSizePixel = 0
    --YOU.Position = UDim2.new(0, Label.Size.X.Offset, 0, 0) + UDim2.new(0, OneLetterLabel.Size.X.Offset, 0, 0) + UDim2.new(0, YOU.Size.X.Offset, 0, 0) + UDim2.new(0, 3, 0, 0)
    YOU.Size = UDim2.new(0, 47, 0, 26)
    YOU.Visible = false
    YOU.Font = Enum.Font.SourceSans
    YOU.Text = "YOU"
    YOU.TextColor3 = Color3.fromRGB(173, 173, 173)
    YOU.TextSize = 27.000
    YOU.LayoutOrder = 4

    guiObjects.BedWarsUI.Scoreboard.Size = guiObjects.BedWarsUI.Scoreboard.Size + UDim2.new(0, 0, 0, 26)

    task.spawn(function()
        local function updateBoard()
            if localPlayer.TeamColor.Color == OneLetterLabel.TextColor3 then
                YOU.Visible = true
            else
                YOU.Visible = false
            end

            local teamplrs = #team:GetPlayers()
            local teamnobed = 0
    
            for _, player in ipairs(team:GetPlayers()) do
                if player:FindFirstChild("leaderstats") then
                    if player.leaderstats.Bed.Value ~= "✅" then
                        teamnobed += 1
                    end
                end
            end
    
            if teamplrs ~= 0 and teamnobed ~= 0 then
                Players.Text = tostring(teamplrs)
                if Label.Text ~= "Red:" then
                    Players.Text = " " .. tostring(teamplrs)
                end
                Players.TextColor3 = Color3.fromRGB(255, 255, 0)
            elseif teamplrs ~= 0 and teamnobed == 0 then
                Players.Text = "✓"
                if Label.Text ~= "Red:" then
                    Players.Text = " ✓"
                end
                Players.TextColor3 = Color3.fromRGB(63, 255, 53)
            elseif teamplrs == 0 then
                Players.Text = "x"
                if Label.Text ~= "Red:" then
                    Players.Text = " x"
                end
                Players.TextColor3 = Color3.fromRGB(255, 0, 0)
            end
        end
        RunService.RenderStepped:Connect(updateBoard)
    end)
end

createMainGui()
createScoreboard()
createTeamsFrame()

for _, team in ipairs(Teams:GetTeams()) do
    if team.Name ~= "Spectators" and team.Name ~= "Neutral" then
        createTeam(team.Name, team)
    end
end

do -- crosshair
    RunService.RenderStepped:Connect(function()
        local character = localPlayer.Character
        if character then
            local head = character:FindFirstChild("Head")
            if head then
                if (head.CFrame.Position - workspace.CurrentCamera.CFrame.Position).Magnitude < 1 then
                    mouse.Icon = getcustomassetfunc("textures/crosshair.png")
                end
            end
        end
    end)
end

do -- block textures
    local textures = {
        grass = {"grass_top", "dirt", "grass_side"},
        wool_white = "wool_white",
        wool_red = "wool_red",
        wool_orange = "wool_orange",
        wool_yellow = "wool_yellow",
        wool_green = "wool_green",
        wool_cyan = "wool_cyan",
        wool_blue = "wool_blue",
        wool_purple = "wool_purple",
        wool_pink = "wool_pink",
        dirt = "dirt",
        stone = "stone"
    }

    local function updateBlockTextures(block)
        local textureTable = textures[block.Name]
        if textureTable then
            if type(textureTable) == "table" then
                for _, texture in ipairs(block:GetDescendants()) do
                    if texture:IsA("Texture") then
                        if texture.Name == "Top" then
                            texture.Texture = getcustomassetfunc("textures/" .. textureTable[1] .. ".png")
                        elseif texture.Name == "Bottom" then
                            texture.Texture = getcustomassetfunc("textures/" .. textureTable[2] .. ".png")
                        else
                            texture.Texture = getcustomassetfunc("textures/" .. textureTable[3] .. ".png")
                        end
                    end
                end
            else
                for _, texture in ipairs(block:GetDescendants()) do
                    if texture:IsA("Texture") then
                        texture.Texture = getcustomassetfunc("textures/" .. textureTable .. ".png")
                    end
                end
            end
        end
    end
    task.spawn(function()
        for _, block in ipairs(CollectionService:GetTagged("block")) do
            updateBlockTextures(block)
        end
    end)
    game:GetService("CollectionService"):GetInstanceAddedSignal("block"):Connect(function(block)
        updateBlockTextures(block)
        block.DescendantAdded:Connect(function(texture)
            local textureTable = textures[block.Name]
            if not textureTable then return end
            if texture:IsA("Texture") then
                if type(textureTable) == "table" then
                    if texture.Name == "Top" then
                        texture.Texture = getcustomassetfunc("textures/" .. textureTable[1] .. ".png")
                    elseif texture.Name == "Bottom" then
                        texture.Texture = getcustomassetfunc("textures/" .. textureTable[2] .. ".png")
                    else
                        texture.Texture = getcustomassetfunc("textures/" .. textureTable[3] .. ".png")
                    end
                else
                    texture.Texture = getcustomassetfunc("textures/" .. textureTable .. ".png")
                end
            end
        end)
    end)
    local oldWeld = modules.WeldTable.weldCharacterAccessories
    modules.WeldTable.weldCharacterAccessories = function(self, model, ...)
        for _, block in ipairs(model:GetChildren()) do
            local textureTable = textures[block.Name]
            if textureTable then
                task.spawn(function()
                    updateBlockTextures(block)
                    block.DescendantAdded:Connect(function(texture)
                        if texture:IsA("Texture") then
                            if type(textureTable) == "table" then
                                if texture.Name == "Top" then
                                    texture.Texture = getcustomassetfunc("textures/" .. textureTable[1] .. ".png")
                                elseif texture.Name == "Bottom" then
                                    texture.Texture = getcustomassetfunc("textures/" .. textureTable[2] .. ".png")
                                else
                                    texture.Texture = getcustomassetfunc("textures/" .. textureTable[3] .. ".png")
                                end
                            else
                                texture.Texture = getcustomassetfunc("textures/" .. textureTable .. ".png")
                            end
                        end
                    end)
                end)
            end
        end
        return oldWeld(self, model, ...)
    end
end

do -- bottom chat
    if config.BottomChat ~= false then
        local chatWindowSize = StarterGui:GetCore("ChatWindowSize")
        StarterGui:SetCore("ChatWindowPosition", UDim2.new(0,0, 1 - chatWindowSize.Y.Scale), 0 - chatWindowSize.Y.Offset)
    end
end

-- local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- local BattlePassUtils = require(ReplicatedStorage["TS"]["battle-pass"]["battle-pass-utils"]).BattlePassUtils

-- print("Level :", BattlePassUtils.getLevelFromExperience(game.Players.LocalPlayer:GetAttribute("BattlePassXP")))
