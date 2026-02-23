--// OrbitX V4 UI Framework | Delta Mobile
--// Credits: Potato & OrbitX Team

if game.CoreGui:FindFirstChild("OrbitX_UI") then
    game.CoreGui.OrbitX_UI:Destroy()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

--==============================
-- LOADING SCREEN
--==============================

local loadGui = Instance.new("ScreenGui", game.CoreGui)
loadGui.Name = "OrbitX_Load"

local load = Instance.new("Frame", loadGui)
load.Size = UDim2.new(0,380,0,220)
load.Position = UDim2.new(0.5,-190,0.5,-110)
load.BackgroundColor3 = Color3.fromRGB(15,15,30)
load.BorderSizePixel = 0
Instance.new("UICorner", load).CornerRadius = UDim.new(0,20)

local grad = Instance.new("UIGradient", load)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,180,255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200,0,255))
}

local logo = Instance.new("ImageLabel", load)
logo.Size = UDim2.new(0,80,0,80)
logo.Position = UDim2.new(0.5,-40,0,15)
logo.Image = "rbxassetid://110454187158483"
logo.BackgroundTransparency = 1

local title = Instance.new("TextLabel", load)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,100)
title.Text = "OrbitX V4"
title.Font = Enum.Font.GothamBlack
title.TextSize = 26
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1

local barBG = Instance.new("Frame", load)
barBG.Size = UDim2.new(1,-40,0,12)
barBG.Position = UDim2.new(0,20,1,-30)
barBG.BackgroundColor3 = Color3.fromRGB(20,20,40)
barBG.BorderSizePixel = 0
Instance.new("UICorner", barBG).CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.new(1,1,1)
bar.BorderSizePixel = 0
Instance.new("UIGradient", bar).Color = grad.Color

for i=1,100 do
    bar.Size = UDim2.new(i/100,0,1,0)
    task.wait(0.015)
end

loadGui:Destroy()

--==============================
-- MAIN UI
--==============================

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "OrbitX_UI"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,640,0,420)
main.Position = UDim2.new(0.5,-320,0.5,-210)
main.BackgroundColor3 = Color3.fromRGB(15,15,30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,20)

Instance.new("UIGradient", main).Color = grad.Color

-- TOP BAR
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,55)
top.BackgroundTransparency = 1

local topLogo = Instance.new("ImageLabel", top)
topLogo.Size = UDim2.new(0,40,0,40)
topLogo.Position = UDim2.new(0,10,0,7)
topLogo.Image = "rbxassetid://110454187158483"
topLogo.BackgroundTransparency = 1

local topTitle = Instance.new("TextLabel", top)
topTitle.Size = UDim2.new(0,300,0,45)
topTitle.Position = UDim2.new(0,60,0,5)
topTitle.Text = "OrbitX V4"
topTitle.Font = Enum.Font.GothamBlack
topTitle.TextSize = 24
topTitle.TextColor3 = Color3.new(1,1,1)
topTitle.BackgroundTransparency = 1

-- CLOSE + MINIMIZE
local close = Instance.new("TextButton", top)
close.Size = UDim2.new(0,40,0,40)
close.Position = UDim2.new(1,-50,0,7)
close.Text = "X"
close.Font = Enum.Font.GothamBlack
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255,90,90)
close.BackgroundColor3 = Color3.fromRGB(30,0,0)

local minimize = Instance.new("TextButton", top)
minimize.Size = UDim2.new(0,40,0,40)
minimize.Position = UDim2.new(1,-95,0,7)
minimize.Text = "-"
minimize.Font = Enum.Font.GothamBlack
minimize.TextSize = 26
minimize.TextColor3 = Color3.fromRGB(200,200,255)
minimize.BackgroundColor3 = Color3.fromRGB(20,20,40)

-- FLOAT ICON
local float = Instance.new("ImageButton", gui)
float.Size = UDim2.new(0,65,0,65)
float.Position = UDim2.new(0,20,0.5,-32)
float.Image = "rbxassetid://110454187158483"
float.BackgroundColor3 = Color3.fromRGB(15,15,30)
float.Visible = false
float.Active = true
float.Draggable = true
Instance.new("UICorner", float).CornerRadius = UDim.new(1,0)

minimize.MouseButton1Click:Connect(function()
    main.Visible = false
    float.Visible = true
end)

float.MouseButton1Click:Connect(function()
    main.Visible = true
    float.Visible = false
end)

-- CLOSE CONFIRM
close.MouseButton1Click:Connect(function()
    local confirm = Instance.new("Frame", gui)
    confirm.Size = UDim2.new(0,300,0,160)
    confirm.Position = UDim2.new(0.5,-150,0.5,-80)
    confirm.BackgroundColor3 = Color3.fromRGB(20,20,40)
    Instance.new("UICorner", confirm).CornerRadius = UDim.new(0,18)

    local txt = Instance.new("TextLabel", confirm)
    txt.Size = UDim2.new(1,0,0,70)
    txt.Text = "Close OrbitX?"
    txt.Font = Enum.Font.GothamBlack
    txt.TextSize = 22
    txt.TextColor3 = Color3.new(1,1,1)
    txt.BackgroundTransparency = 1

    local yes = Instance.new("TextButton", confirm)
    yes.Size = UDim2.new(0.45,0,0,40)
    yes.Position = UDim2.new(0.05,0,1,-50)
    yes.Text = "YES"
    yes.Font = Enum.Font.GothamBlack
    yes.TextSize = 18
    yes.TextColor3 = Color3.fromRGB(100,255,100)
    yes.BackgroundColor3 = Color3.fromRGB(10,40,10)

    local no = Instance.new("TextButton", confirm)
    no.Size = UDim2.new(0.45,0,0,40)
    no.Position = UDim2.new(0.5,0,1,-50)
    no.Text = "NO"
    no.Font = Enum.Font.GothamBlack
    no.TextSize = 18
    no.TextColor3 = Color3.fromRGB(255,100,100)
    no.BackgroundColor3 = Color3.fromRGB(40,10,10)

    yes.MouseButton1Click:Connect(function()
        gui:Destroy()
    end)

    no.MouseButton1Click:Connect(function()
        confirm:Destroy()
    end)
end)

--==============================
-- SIDEBAR + PAGES
--==============================

local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0,70,1,-60)
sidebar.Position = UDim2.new(0,0,0,60)
sidebar.BackgroundColor3 = Color3.fromRGB(12,12,25)

local pages = Instance.new("Folder", main)

local function createPage(name)
    local f = Instance.new("Frame", pages)
    f.Size = UDim2.new(1,-90,1,-80)
    f.Position = UDim2.new(0,80,0,70)
    f.BackgroundTransparency = 1
    f.Visible = false
    f.Name = name
    return f
end

local home = createPage("Home")
local mainTab = createPage("Main")
home.Visible = true

local function tab(icon,y,page)
    local b = Instance.new("ImageButton", sidebar)
    b.Size = UDim2.new(0,48,0,48)
    b.Position = UDim2.new(0.5,-24,0,y)
    b.Image = "rbxassetid://"..icon
    b.BackgroundColor3 = Color3.fromRGB(25,25,50)
    Instance.new("UICorner", b).CornerRadius = UDim.new(1,0)

    b.MouseButton1Click:Connect(function()
        for _,v in pairs(pages:GetChildren()) do
            v.Visible = false
        end
        page.Visible = true
    end)
end

tab(3926305904,20,home)
tab(3926307971,85,mainTab)

--==============================
-- HOME
--==============================

local htext = Instance.new("TextLabel", home)
htext.Size = UDim2.new(1,0,1,0)
htext.TextWrapped = true
htext.Text = "Executor: Delta\nCredits: Potato & OrbitX Team\n\nStatus: Loaded"
htext.Font = Enum.Font.Gotham
htext.TextSize = 18
htext.TextColor3 = Color3.new(1,1,1)
htext.BackgroundTransparency = 1

--==============================
-- OP FLING TAB (UI ONLY)
--==============================

local titleF = Instance.new("TextLabel", mainTab)
titleF.Size = UDim2.new(1,0,0,40)
titleF.Text = "OP FLING"
titleF.Font = Enum.Font.GothamBlack
titleF.TextSize = 26
titleF.TextColor3 = Color3.new(1,1,1)
titleF.BackgroundTransparency = 1

local list = Instance.new("ScrollingFrame", mainTab)
list.Size = UDim2.new(1,-20,1,-60)
list.Position = UDim2.new(0,10,0,50)
list.ScrollBarThickness = 6
list.BackgroundTransparency = 1
list.CanvasSize = UDim2.new(0,0,0,0)

local layout = Instance.new("UIListLayout", list)
layout.Padding = UDim.new(0,8)

local function refresh()
    list:ClearAllChildren()
    layout.Parent = list

    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local btn = Instance.new("TextButton", list)
            btn.Size = UDim2.new(1,-10,0,45)
            btn.BackgroundColor3 = Color3.fromRGB(25,25,50)
            btn.Text = plr.Name
            btn.Font = Enum.Font.GothamBold
            btn.TextSize = 16
            btn.TextColor3 = Color3.fromRGB(160,170,255)
            Instance.new("UICorner", btn).CornerRadius = UDim.new(0,14)

            btn.MouseButton1Click:Connect(function()
                warn("OP FLING UI button clicked on:", plr.Name)
            end)
        end
    end
end

Players.PlayerAdded:Connect(refresh)
Players.PlayerRemoving:Connect(refresh)
refresh()

print("OrbitX V4 UI Framework Loaded 😈🔥")
