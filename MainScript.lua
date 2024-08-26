local tcs = game:GetService("TextChatService")
local rps = game:GetService("ReplicatedStorage")
local uis = game:GetService("UserInputService")
--service
local filtertable = loadstring(game:HttpGet("https://raw.githubusercontent.com/lordofmountainn/Asteroid/main/filtertable.lua"))
--filtertable
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextBox = Instance.new("TextBox")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local ImageButton = Instance.new("ImageButton")
local UICorner_3 = Instance.new("UICorner")


ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
Frame.BackgroundTransparency = 0.150
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.371323526, 0, 0.363790184, 0)
Frame.Size = UDim2.new(0, 350, 0, 100)
Frame.Active = true
Frame.Draggable = true

UICorner.Parent = Frame

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
TextBox.BackgroundTransparency = 0.550
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Position = UDim2.new(0.0199999996, 0, 0.423750013, 0)
TextBox.Size = UDim2.new(0, 270, 0, 50)
TextBox.ClearTextOnFocus = true
TextBox.ClipsDescendants = true
TextBox.Font = Enum.Font.SourceSans
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(173, 50, 50)
TextBox.TextSize = 14.000
TextBox.PlaceholderText = "discord.gg/gkmqavcn"
TextBox.TextSize = 22

UICorner_2.Parent = TextBox

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.214285716, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 42)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Asteroid"
TextLabel.TextColor3 = Color3.fromRGB(173, 50, 50)
TextLabel.TextSize = 32.000

ImageButton.Parent = Frame
ImageButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
ImageButton.BackgroundTransparency = 0.550
ImageButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.82571429, 0, 0.419999987, 0)
ImageButton.Size = UDim2.new(0, 55, 0, 50)
ImageButton.Image = "rbxassetid://18780678633"
ImageButton.ImageColor3 = Color3.fromRGB(156, 46, 46)
ImageButton.TileSize = UDim2.new(0.5, 0, 1, 0)

UICorner_3.Parent = ImageButton

local function sendbypassedchatmessage(str)

for normalalphabets,bypassedalphabets in filtertable() do
str = string.gsub(string.lower(str),normalalphabets,bypassedalphabets)
end

if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
rps:WaitForChild('DefaultChatSystemChatEvents').SayMessageRequest:FireServer(str,"All")
elseif tcs.ChatVersion == Enum.ChatVersion.TextChatService then
tcs:WaitForChild("TextChannels")[tostring(tcs:FindFirstChildOfClass("ChatInputBarConfiguration").TargetTextChannel)]:SendAsync(str)
end

end


ImageButton.MouseButton1Down:Connect(function()
sendbypassedchatmessage(TextBox.Text)
end)

uis.InputBegan:Connect(function(key)
if TextBox.CursorPosition ~= 1 and key.KeyCode == Enum.KeyCode.Return then
sendbypassedchatmessage(TextBox.Text)
end
end)
