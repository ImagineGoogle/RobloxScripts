-- Gui to Lua
-- Version: 3.2

-- Instances:

repeat task.wait() until game:IsLoaded()

local Executor = Instance.new("ScreenGui")
local Container = Instance.new("Frame")
local Main = Instance.new("Frame")
local Scripts = Instance.new("Frame")
local UIListLayout = Instance.new("UIListLayout")
local Side = Instance.new("Frame")
local ScaledFrame = Instance.new("ScrollingFrame")
local TextBox = Instance.new("TextBox")
local Drafts = Instance.new("Frame")
local Draft = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local TextLabel_2 = Instance.new("TextLabel")
local UIListLayout_2 = Instance.new("UIListLayout")
local Draft_2 = Instance.new("Frame")
local TextLabel_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local Bottom = Instance.new("Frame")
local UIListLayout_3 = Instance.new("UIListLayout")
local Execute = Instance.new("TextButton")
local Clear = Instance.new("TextButton")
local OpenFile = Instance.new("TextButton")
local ExecuteFile = Instance.new("TextButton")
local SaveFile = Instance.new("TextButton")
local BottomExtra = Instance.new("Frame")
local Attach = Instance.new("TextButton")
local UIListLayout_4 = Instance.new("UIListLayout")
local ScriptHub = Instance.new("TextButton")
local AddScript = Instance.new("TextButton")
local ImageLabel = Instance.new("ImageLabel")
local Close = Instance.new("TextButton")
local Maximize = Instance.new("TextButton")
local Minimize = Instance.new("TextButton")
local Logo = Instance.new("Frame")
local ImageLabel_2 = Instance.new("ImageLabel")
local Version = Instance.new("TextLabel")

--Properties:

Executor.Name = "Executor"
Executor.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Executor.DisplayOrder = 999999999
Executor.ResetOnSpawn = false

if gethui and (not KRNL_LOADED) then
	Executor.Parent = gethui()
elseif not is_sirhurt_closure and syn and syn.protect_gui then
	syn.protect_gui(Executor)
	Executor.Parent = game:GetService("CoreGui")
else
	Executor.Parent = game:GetService("CoreGui")
end

Container.Name = "Container"
Container.Parent = Executor
Container.AnchorPoint = Vector2.new(0.5, 0.5)
Container.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
Container.BorderSizePixel = 0
Container.Position = UDim2.new(0.5, 0, 0.25, 0)
Container.Size = UDim2.new(0, 764, 0, 36)
Container.Active = true
Container.Visible = false
Container.Draggable = true

Main.Name = "Main"
Main.Parent = Container
Main.BackgroundColor3 = Color3.fromRGB(56, 52, 52)
Main.BorderSizePixel = 0
Main.Position = UDim2.new(0, 0, 1, 0)
Main.Size = UDim2.new(0, 764, 0, 345)

Scripts.Name = "Scripts"
Scripts.Parent = Main
Scripts.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
Scripts.BorderSizePixel = 0
Scripts.Position = UDim2.new(0.832460761, 0, 0.0173913036, 0)
Scripts.Size = UDim2.new(0.160984293, 0, 0.860869586, 0)

UIListLayout.Parent = Scripts
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

Side.Name = "Side"
Side.Parent = Main
Side.BackgroundColor3 = Color3.fromRGB(40, 36, 36)
Side.BorderSizePixel = 0
Side.Position = UDim2.new(0.00654450245, 0, 0.0753623173, 0)
Side.Size = UDim2.new(0, 42, 0, 277)

ScaledFrame.Name = "ScaledFrame"
ScaledFrame.Parent = Main
ScaledFrame.Active = true
ScaledFrame.BackgroundColor3 = Color3.fromRGB(48, 44, 44)
ScaledFrame.BorderSizePixel = 0
ScaledFrame.Position = UDim2.new(0.061999999, 0, 0.075000003, 0)
ScaledFrame.Size = UDim2.new(0, 582, 0, 277)
ScaledFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
ScaledFrame.ScrollBarThickness = 0

TextBox.Parent = ScaledFrame
TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextBox.BackgroundTransparency = 1.000
TextBox.Position = UDim2.new(0.0171821304, 0, 0, 0)
TextBox.Size = UDim2.new(0, 572, 0, 277)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.Nunito
TextBox.MultiLine = true
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(255, 115, 0)
TextBox.TextSize = 20.000
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top

Drafts.Name = "Drafts"
Drafts.Parent = Main
Drafts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Drafts.BackgroundTransparency = 1.000
Drafts.BorderSizePixel = 0
Drafts.Position = UDim2.new(0.00654450245, 0, 0, 0)
Drafts.Size = UDim2.new(0, 624, 0, 25)

Draft.Name = "Draft"
Draft.Parent = Drafts
Draft.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Draft.BorderSizePixel = 0
Draft.Position = UDim2.new(0, 0, 0.119999997, 0)
Draft.Size = UDim2.new(0, 91, 0, 19)

TextLabel.Parent = Draft
TextLabel.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
TextLabel.BorderColor3 = Color3.fromRGB(86, 86, 86)
TextLabel.BorderSizePixel = 0
TextLabel.Size = UDim2.new(0, 70, 0, 19)
TextLabel.Font = Enum.Font.Gotham
TextLabel.Text = "Script 1"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 14.000

TextLabel_2.Parent = Draft
TextLabel_2.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
TextLabel_2.BorderColor3 = Color3.fromRGB(86, 86, 86)
TextLabel_2.BorderSizePixel = 0
TextLabel_2.Position = UDim2.new(0.769230783, 0, 0, 0)
TextLabel_2.Size = UDim2.new(0, 21, 0, 19)
TextLabel_2.Font = Enum.Font.GothamBold
TextLabel_2.Text = "x"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextSize = 14.000

UIListLayout_2.Parent = Drafts
UIListLayout_2.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_2.VerticalAlignment = Enum.VerticalAlignment.Center

Draft_2.Name = "Draft"
Draft_2.Parent = Drafts
Draft_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Draft_2.BorderSizePixel = 0
Draft_2.Position = UDim2.new(0, 0, 0.119999997, 0)
Draft_2.Size = UDim2.new(0, 91, 0, 19)

TextLabel_3.Parent = Draft_2
TextLabel_3.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
TextLabel_3.BorderColor3 = Color3.fromRGB(105, 105, 105)
TextLabel_3.BorderSizePixel = 0
TextLabel_3.Size = UDim2.new(0, 70, 0, 19)
TextLabel_3.Font = Enum.Font.Gotham
TextLabel_3.Text = "Script 2"
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 14.000

TextLabel_4.Parent = Draft_2
TextLabel_4.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
TextLabel_4.BorderColor3 = Color3.fromRGB(105, 105, 105)
TextLabel_4.BorderSizePixel = 0
TextLabel_4.Position = UDim2.new(0.769230783, 0, 0, 0)
TextLabel_4.Size = UDim2.new(0, 21, 0, 19)
TextLabel_4.Font = Enum.Font.GothamBold
TextLabel_4.Text = "x"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextSize = 14.000

Bottom.Name = "Bottom"
Bottom.Parent = Main
Bottom.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bottom.BackgroundTransparency = 1.000
Bottom.BorderSizePixel = 0
Bottom.Position = UDim2.new(0.00654450245, 0, 0.898550749, 0)
Bottom.Size = UDim2.new(0, 494, 0, 29)

UIListLayout_3.Parent = Bottom
UIListLayout_3.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_3.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_3.Padding = UDim.new(0, 7)

Execute.Name = "Execute"
Execute.Parent = Bottom
Execute.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
Execute.BorderSizePixel = 0
Execute.Size = UDim2.new(0, 98, 0, 29)
Execute.AutoButtonColor = false
Execute.Font = Enum.Font.Gotham
Execute.Text = "Execute"
Execute.TextColor3 = Color3.fromRGB(255, 255, 255)
Execute.TextSize = 15.000

Clear.Name = "Clear"
Clear.Parent = Bottom
Clear.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
Clear.BorderSizePixel = 0
Clear.Size = UDim2.new(0, 98, 0, 29)
Clear.AutoButtonColor = false
Clear.Font = Enum.Font.Gotham
Clear.Text = "Clear"
Clear.TextColor3 = Color3.fromRGB(255, 255, 255)
Clear.TextSize = 15.000

OpenFile.Name = "OpenFile"
OpenFile.Parent = Bottom
OpenFile.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
OpenFile.BorderSizePixel = 0
OpenFile.Size = UDim2.new(0, 98, 0, 29)
OpenFile.AutoButtonColor = false
OpenFile.Font = Enum.Font.Gotham
OpenFile.Text = "Open File"
OpenFile.TextColor3 = Color3.fromRGB(255, 255, 255)
OpenFile.TextSize = 15.000

ExecuteFile.Name = "ExecuteFile"
ExecuteFile.Parent = Bottom
ExecuteFile.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
ExecuteFile.BorderSizePixel = 0
ExecuteFile.Size = UDim2.new(0, 98, 0, 29)
ExecuteFile.AutoButtonColor = false
ExecuteFile.Font = Enum.Font.Gotham
ExecuteFile.Text = "Execute File"
ExecuteFile.TextColor3 = Color3.fromRGB(255, 255, 255)
ExecuteFile.TextSize = 15.000

SaveFile.Name = "SaveFile"
SaveFile.Parent = Bottom
SaveFile.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
SaveFile.BorderSizePixel = 0
SaveFile.Size = UDim2.new(0, 98, 0, 29)
SaveFile.AutoButtonColor = false
SaveFile.Font = Enum.Font.Gotham
SaveFile.Text = "Save File"
SaveFile.TextColor3 = Color3.fromRGB(255, 255, 255)
SaveFile.TextSize = 15.000

BottomExtra.Name = "BottomExtra"
BottomExtra.Parent = Main
BottomExtra.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BottomExtra.BackgroundTransparency = 1.000
BottomExtra.BorderSizePixel = 0
BottomExtra.Position = UDim2.new(0.72251308, 0, 0.898550749, 0)
BottomExtra.Size = UDim2.new(0, 206, 0, 29)

Attach.Name = "Attach"
Attach.Parent = BottomExtra
Attach.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
Attach.BorderSizePixel = 0
Attach.Size = UDim2.new(0, 98, 0, 29)
Attach.AutoButtonColor = false
Attach.Font = Enum.Font.Gotham
Attach.Text = "Attach"
Attach.TextColor3 = Color3.fromRGB(255, 255, 255)
Attach.TextSize = 15.000

UIListLayout_4.Parent = BottomExtra
UIListLayout_4.FillDirection = Enum.FillDirection.Horizontal
UIListLayout_4.HorizontalAlignment = Enum.HorizontalAlignment.Right
UIListLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout_4.VerticalAlignment = Enum.VerticalAlignment.Center
UIListLayout_4.Padding = UDim.new(0, 7)

ScriptHub.Name = "ScriptHub"
ScriptHub.Parent = BottomExtra
ScriptHub.BackgroundColor3 = Color3.fromRGB(64, 60, 60)
ScriptHub.BorderSizePixel = 0
ScriptHub.Size = UDim2.new(0, 98, 0, 29)
ScriptHub.AutoButtonColor = false
ScriptHub.Font = Enum.Font.Gotham
ScriptHub.Text = "Script Hub"
ScriptHub.TextColor3 = Color3.fromRGB(255, 255, 255)
ScriptHub.TextSize = 15.000

AddScript.Name = "AddScript"
AddScript.Parent = Main
AddScript.BackgroundColor3 = Color3.fromRGB(105, 105, 105)
AddScript.BorderColor3 = Color3.fromRGB(255, 255, 255)
AddScript.Position = UDim2.new(0.251879454, 0, 0.0144927483, 0)
AddScript.Size = UDim2.new(0, 15, 0, 15)
AddScript.AutoButtonColor = false
AddScript.Font = Enum.Font.Gotham
AddScript.Text = "+"
AddScript.TextColor3 = Color3.fromRGB(255, 255, 255)
AddScript.TextSize = 21.000

ImageLabel.Parent = Container
ImageLabel.AnchorPoint = Vector2.new(0, 0.5)
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.0104712043, 0, 0.5, 0)
ImageLabel.Size = UDim2.new(0, 30, 0, 25)
ImageLabel.Visible = false
ImageLabel.Image = "rbxassetid://6221762983"

Close.Name = "Close"
Close.Parent = Container
Close.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Close.BackgroundTransparency = 1.000
Close.Position = UDim2.new(0.955497384, 0, 0.138888896, 0)
Close.Size = UDim2.new(0, 25, 0, 15)
Close.Font = Enum.Font.SourceSans
Close.Text = "x"
Close.TextColor3 = Color3.fromRGB(255, 255, 255)
Close.TextSize = 32.000
Close.TextWrapped = true

Maximize.Name = "Maximize"
Maximize.Parent = Container
Maximize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Maximize.BackgroundTransparency = 1.000
Maximize.Position = UDim2.new(0.925392687, 0, 0.161111206, 0)
Maximize.Size = UDim2.new(0, 23, 0, 21)
Maximize.Font = Enum.Font.SourceSans
Maximize.Text = "M"
Maximize.TextColor3 = Color3.fromRGB(255, 255, 255)
Maximize.TextSize = 23.000
Maximize.TextWrapped = true
Maximize.TextYAlignment = Enum.TextYAlignment.Bottom

Minimize.Name = "Minimize"
Minimize.Parent = Container
Minimize.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Minimize.BackgroundTransparency = 1.000
Minimize.Position = UDim2.new(0.895287931, 0, 0.27222231, 0)
Minimize.Size = UDim2.new(0, 23, 0, 9)
Minimize.Font = Enum.Font.SourceSans
Minimize.Text = "_"
Minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
Minimize.TextSize = 23.000
Minimize.TextWrapped = true

Logo.Name = "Logo"
Logo.Parent = Container
Logo.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Logo.BackgroundTransparency = 1.000
Logo.Position = UDim2.new(0, 5, 0, 0)
Logo.Size = UDim2.new(0, 30, 0, 30)

ImageLabel_2.Parent = Logo
ImageLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel_2.BackgroundTransparency = 1.000
ImageLabel_2.Position = UDim2.new(0, 0, 0.0999999866, 0)
ImageLabel_2.Size = UDim2.new(1, 0, 1, 0)
ImageLabel_2.Image = "rbxassetid://2530517466"

Version.Name = "Version"
Version.Parent = Container
Version.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Version.BackgroundTransparency = 1.000
Version.Position = UDim2.new(0.352094233, 0, 0, 0)
Version.Size = UDim2.new(0, 200, 0, 36)
Version.Font = Enum.Font.SourceSans
Version.Text = "Synapse v2.19.1b"
Version.TextColor3 = Color3.fromRGB(255, 255, 255)
Version.TextSize = 18.000

local function newScript(name, thescript)
	local InfiniteYield = Instance.new("TextButton")
	InfiniteYield.Name = name
	InfiniteYield.Parent = Scripts
	InfiniteYield.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	InfiniteYield.BackgroundTransparency = 1.000
	InfiniteYield.Position = UDim2.new(0.0569142736, 0, 0, 0)
	InfiniteYield.Size = UDim2.new(0.899999976, 0, -0.101430975, 50)
	InfiniteYield.Font = Enum.Font.Gotham
	InfiniteYield.Text = name
	InfiniteYield.TextColor3 = Color3.fromRGB(255, 255, 255)
	InfiniteYield.TextSize = 16.000
	InfiniteYield.TextXAlignment = Enum.TextXAlignment.Left

	InfiniteYield.MouseButton1Click:Connect(function()
		loadstring(thescript)()
	end)
end

Execute.MouseButton1Click:Connect(function()
	loadstring(TextBox.Text)()
end)

Close.MouseButton1Click:Connect(function()
	Executor:Destroy()
end)

Minimize.MouseButton1Click:Connect(function()
	Container.Visible = false
end)

Clear.MouseButton1Click:Connect(function()
	TextBox.Text = ""
end)

local textArea = TextBox
local scrollFrame = ScaledFrame

textArea:GetPropertyChangedSignal("TextFits"):Connect(function()
	while textArea.TextFits == false do
		scrollFrame.CanvasSize = UDim2.new(0, 0, 0, scrollFrame.CanvasSize.Y.Offset + 16)
		scrollFrame.CanvasPosition = Vector2.new(0, scrollFrame.CanvasSize.Y.Offset - scrollFrame.AbsoluteWindowSize.Y)
	end
end)

textArea:GetPropertyChangedSignal("TextBounds"):Connect(function()
	if scrollFrame.CanvasSize.Y.Offset > textArea.TextBounds.Y + 16 then
		scrollFrame.CanvasSize = UDim2.new(0, 0, 0, textArea.TextBounds.Y)
		scrollFrame.CanvasPosition = Vector2.new(0, scrollFrame.CanvasSize.Y.Offset - scrollFrame.AbsoluteWindowSize.Y)
	end
end)


newScript("infyield.lua", "loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()")
newScript("securedex.lua", "loadstring(game:HttpGet('https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/BypassedDarkDexV3.lua', true))()")
newScript("vapev4.lua", "loadstring(game:HttpGet('https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua', true))()")


game:GetService("UserInputService").InputBegan:Connect(function(i, gpe)
	if i.KeyCode == Enum.KeyCode.RightAlt then
		Container.Visible = not Container.Visible
	elseif i.KeyCode == Enum.KeyCode.Tab then
		if TextBox and TextBox:IsFocused() then
			TextBox.Text = string.sub(TextBox.Text, 1, TextBox.CursorPosition - 1) .. "     " .. string.sub(TextBox.Text, TextBox.CursorPosition, string.len(TextBox.Text))
			TextBox.CursorPosition = TextBox.CursorPosition + 5
		end
	end
end)
