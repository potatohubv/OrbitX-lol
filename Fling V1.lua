-- OrbitX UI - No Fling Version
-- By Thiago Games 😈

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Destroy old UI
if PlayerGui:FindFirstChild("OrbitXUI") then
    PlayerGui.OrbitXUI:Destroy()
end

-- Colors
local mainColor = Color3.fromRGB(135, 0, 255)
local darkColor = Color3.fromRGB(20, 20, 20)
local textColor = Color3.fromRGB(255,255,255)

-- ScreenGui
local gui = Instance.new("ScreenGui", PlayerGui)
gui.Name = "OrbitXUI"
gui.ResetOnSpawn = false

-- Loading Screen
local loading = Instance.new("Frame", gui)
loading.Size = UDim2.new(1,0,1,0)
loading.BackgroundColor3 = darkColor

local loadText = Instance.new("TextLabel", loading)
loadText.Size = UDim2.new(1,0,1,0)
loadText.Text = "OrbitX Loading..."
loadText.TextColor3 = mainColor
loadText.Font = Enum.Font.GothamBold
loadText.TextSize = 40
loadText.BackgroundTransparency = 1

task.wait(2)
loading:Destroy()

-- Main Frame
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,520,0,330)
main.Position = UDim2.new(0.5,-260,0.5,-165)
main.BackgroundColor3 = darkColor
main.Active = true
main.Draggable = true
main.BorderSizePixel = 0

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0,14)

-- Top Bar
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,40)
top.BackgroundColor3 = mainColor
top.BorderSizePixel = 0

local tCorner = Instance.new("UICorner", top)
tCorner.CornerRadius = UDim.new(0,14)

local title = Instance.new("TextLabel", top)
title.Size = UDim2.new(1,0,1,0)
title.Text = "OrbitX"
title.Font = Enum.Font.GothamBold
title.TextSize = 22
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

-- Buttons
local close = Instance.new("TextButton", top)
close.Size = UDim2.new(0,40,0,40)
close.Position = UDim2.new(1,-40,0,0)
close.Text = "X"
close.TextColor3 = Color3.new(1,1,1)
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.BackgroundColor3 = Color3.fromRGB(180,0,0)

local mini = Instance.new("TextButton", top)
mini.Size = UDim2.new(0,40,0,40)
mini.Position = UDim2.new(1,-80,0,0)
mini.Text = "-"
mini.TextColor3 = Color3.new(1,1,1)
mini.Font = Enum.Font.GothamBold
mini.TextSize = 22
mini.BackgroundColor3 = Color3.fromRGB(60,60,60)

-- Tabs
local tabBar = Instance.new("Frame", main)
tabBar.Position = UDim2.new(0,0,0,40)
tabBar.Size = UDim2.new(0,120,1,-40)
tabBar.BackgroundColor3 = Color3.fromRGB(30,30,30)
tabBar.BorderSizePixel = 0

local mainTab = Instance.new("TextButton", tabBar)
mainTab.Size = UDim2.new(1,0,0,50)
mainTab.Text = "MAIN"
mainTab.BackgroundColor3 = mainColor
mainTab.TextColor3 = textColor
mainTab.Font = Enum.Font.GothamBold
mainTab.TextSize = 18

local flingTab = Instance.new("TextButton", tabBar)
flingTab.Position = UDim2.new(0,0,0,55)
flingTab.Size = UDim2.new(1,0,0,50)
flingTab.Text = "FLING"
flingTab.BackgroundColor3 = Color3.fromRGB(45,45,45)
flingTab.TextColor3 = textColor
flingTab.Font = Enum.Font.GothamBold
flingTab.TextSize = 18

-- Pages
local pages = Instance.new("Frame", main)
pages.Position = UDim2.new(0,120,0,40)
pages.Size = UDim2.new(1,-120,1,-40)
pages.BackgroundTransparency = 1

local mainPage = Instance.new("Frame", pages)
mainPage.Size = UDim2.new(1,0,1,0)
mainPage.BackgroundTransparency = 1

local flingPage = Instance.new("Frame", pages)
flingPage.Size = UDim2.new(1,0,1,0)
flingPage.BackgroundTransparency = 1
flingPage.Visible = false

-- Main Page Text
local txt = Instance.new("TextLabel", mainPage)
txt.Size = UDim2.new(1,0,1,0)
txt.Text = "OrbitX Loaded Successfully"
txt.TextColor3 = mainColor
txt.Font = Enum.Font.GothamBold
txt.TextSize = 22
txt.BackgroundTransparency = 1

-- Fling Page
local flingTitle = Instance.new("TextLabel", flingPage)
flingTitle.Size = UDim2.new(1,0,0,40)
flingTitle.Text = "OP FLING"
flingTitle.TextColor3 = mainColor
flingTitle.Font = Enum.Font.GothamBold
flingTitle.TextSize = 24
flingTitle.BackgroundTransparency = 1

local list = Instance.new("ScrollingFrame", flingPage)
list.Position = UDim2.new(0,10,0,45)
list.Size = UDim2.new(1,-20,1,-55)
list.CanvasSize = UDim2.new(0,0,0,0)
list.ScrollBarImageTransparency = 0.3
list.BackgroundColor3 = Color3.fromRGB(25,25,25)
list.BorderSizePixel = 0

local corner2 = Instance.new("UICorner", list)
corner2.CornerRadius = UDim.new(0,10)

local layout = Instance.new("UIListLayout", list)
layout.Padding = UDim.new(0,5)

-- Player List Function
local function refreshPlayers()
    for _,v in pairs(list:GetChildren()) do
        if v:IsA("TextButton") then
            v:Destroy()
        end
    end

    for _,plr in pairs(Players:GetPlayers()) do
        local b = Instance.new("TextButton", list)
        b.Size = UDim2.new(1,-10,0,35)
        b.Text = plr.Name
        b.BackgroundColor3 = Color3.fromRGB(40,40,40)
        b.TextColor3 = textColor
        b.Font = Enum.Font.GothamBold
        b.TextSize = 16
    end

    task.wait()
    list.CanvasSize = UDim2.new(0,0,0,layout.AbsoluteContentSize.Y + 10)
end

refreshPlayers()
Players.PlayerAdded:Connect(refreshPlayers)
Players.PlayerRemoving:Connect(refreshPlayers)

-- Tabs Logic
mainTab.MouseButton1Click:Connect(function()
    mainPage.Visible = true
    flingPage.Visible = false
end)

flingTab.MouseButton1Click:Connect(function()
    mainPage.Visible = false
    flingPage.Visible = true
end)

-- Minimize
local minimized = false
mini.MouseButton1Click:Connect(function()
    minimized = not minimized
    pages.Visible = not minimized
    tabBar.Visible = not minimized
end)

-- Close Confirmation
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)
