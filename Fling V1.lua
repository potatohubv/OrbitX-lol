--// OrbitX V5 FINAL BOSS | OP FLING CLONE
--// Credits: Potato & OrbitX Team

if game.CoreGui:FindFirstChild("OrbitX_UI") then
    game.CoreGui.OrbitX_UI:Destroy()
end

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "OrbitX_UI"

-- TIPS
local tipsList = {
"Trust nobody 😈","OrbitX on top 🚀","Skill > Scripts 🧠","No lag gang ⚡",
"Touch grass later 🌱","Bacon hairs beware 🥓","OP = OrbitX Power 🔥",
"Speedrun exploits 🏃","Delta go brr 💨","Less lag more wins 🏆",
"Scripts > Sleep 😴","Ping bajo = Dios 🛐","OrbitX supremacy 👑",
"Exploit smart not hard 🧠","FPS > Girlfriend 💀","No bugs only features 🐛",
"Ez claps 👏","Skill issue detector 📡","OrbitX certified 💯",
"Server domination 😈","Fast hands 🖐","OP gaming 🎮","No mercy 💣",
"Ultra instinct ⚡","Lag = enemy ☠","Auto win mode 🤖",
"Brain + Script = God 🧠","OrbitX forever ♾","Speed hacks? Nah skill 😎",
"Tryhard energy 🔥","Sweat mode 🥵","Full focus 👀","Zero fear 😤",
"Game breaker 💥","OrbitX legend 🏆","Script master 📜",
"Too OP to stop 😈","Easy mode ON 🎯","OrbitX drip 💎",
"Big brain time 🧠","Destroy servers 🧨","Fast as light ⚡",
"Unstoppable 🛑","OrbitX gang 🖤","Skill diff 😎",
"OP vibes only 🔥","OrbitX godmode 👑"
}

-- LOADING
local load = Instance.new("Frame", gui)
load.Size = UDim2.new(1,0,1,0)
load.BackgroundColor3 = Color3.fromRGB(10,10,25)

local title = Instance.new("TextLabel", load)
title.Size = UDim2.new(1,0,0.15,0)
title.Text = "OrbitX Loading..."
title.Font = Enum.Font.GothamBold
title.TextSize = 38
title.TextColor3 = Color3.fromRGB(160,0,255)
title.BackgroundTransparency = 1

local barBG = Instance.new("Frame", load)
barBG.Size = UDim2.new(0.6,0,0.04,0)
barBG.Position = UDim2.new(0.2,0,0.45,0)
barBG.BackgroundColor3 = Color3.fromRGB(30,30,60)
barBG.BorderSizePixel = 0
Instance.new("UICorner", barBG)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(160,0,255)
bar.BorderSizePixel = 0
Instance.new("UICorner", bar)

local tips = Instance.new("TextLabel", load)
tips.Size = UDim2.new(1,0,0.1,0)
tips.Position = UDim2.new(0,0,0.55,0)
tips.Font = Enum.Font.Gotham
tips.TextSize = 22
tips.TextColor3 = Color3.fromRGB(120,120,255)
tips.BackgroundTransparency = 1

spawn(function()
    while load.Parent do
        tips.Text = "Tip: "..tipsList[math.random(1,#tipsList)]
        task.wait(0.25)
    end
end)

TweenService:Create(bar, TweenInfo.new(6), {Size = UDim2.new(1,0,1,0)}):Play()
task.wait(6)
load:Destroy()

-- MAIN UI
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,700,0,420)
main.Position = UDim2.new(0.5,-350,0.5,-210)
main.BackgroundColor3 = Color3.fromRGB(15,15,40)
main.BorderSizePixel = 0
Instance.new("UICorner", main)

-- DRAG
local dragging, dragInput, startPos, startUIPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        startPos = input.Position
        startUIPos = main.Position
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - startPos
        main.Position = UDim2.new(startUIPos.X.Scale, startUIPos.X.Offset + delta.X, startUIPos.Y.Scale, startUIPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

-- TOP
local top = Instance.new("Frame", main)
top.Size = UDim2.new(1,0,0,45)
top.BackgroundColor3 = Color3.fromRGB(25,25,70)

local title2 = Instance.new("TextLabel", top)
title2.Size = UDim2.new(1,-120,1,0)
title2.Text = "OrbitX OP FLING"
title2.Font = Enum.Font.GothamBold
title2.TextSize = 22
title2.TextColor3 = Color3.fromRGB(180,0,255)
title2.BackgroundTransparency = 1

-- CLOSE
local close = Instance.new("TextButton", top)
close.Size = UDim2.new(0,40,0,30)
close.Position = UDim2.new(1,-45,0,7)
close.Text = "X"
close.Font = Enum.Font.GothamBold
close.TextSize = 18
close.TextColor3 = Color3.fromRGB(255,80,80)
close.BackgroundColor3 = Color3.fromRGB(50,0,0)
Instance.new("UICorner", close)

-- MINIMIZE
local mini = Instance.new("TextButton", top)
mini.Size = UDim2.new(0,40,0,30)
mini.Position = UDim2.new(1,-90,0,7)
mini.Text = "-"
mini.Font = Enum.Font.GothamBold
mini.TextSize = 26
mini.TextColor3 = Color3.fromRGB(160,0,255)
mini.BackgroundColor3 = Color3.fromRGB(30,30,80)
Instance.new("UICorner", mini)

-- LOGO FLOAT
local logo = Instance.new("TextButton", gui)
logo.Size = UDim2.new(0,70,0,70)
logo.Position = UDim2.new(0,20,0.5,-35)
logo.Text = "OrbitX"
logo.Font = Enum.Font.GothamBold
logo.TextSize = 18
logo.TextColor3 = Color3.fromRGB(180,0,255)
logo.BackgroundColor3 = Color3.fromRGB(20,20,60)
logo.Visible = false
Instance.new("UICorner", logo)

mini.MouseButton1Click:Connect(function()
    main.Visible = false
    logo.Visible = true
end)

logo.MouseButton1Click:Connect(function()
    main.Visible = true
    logo.Visible = false
end)

close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- TABS
local tabs = Instance.new("Frame", main)
tabs.Size = UDim2.new(0,70,1,-45)
tabs.Position = UDim2.new(0,0,0,45)
tabs.BackgroundColor3 = Color3.fromRGB(20,20,60)

local home = Instance.new("TextButton", tabs)
home.Size = UDim2.new(1,0,0,60)
home.Text = "🏠"
home.TextSize = 26
home.BackgroundTransparency = 1
home.TextColor3 = Color3.fromRGB(160,0,255)

local mainBtn = Instance.new("TextButton", tabs)
mainBtn.Size = UDim2.new(1,0,0,60)
mainBtn.Position = UDim2.new(0,0,0,70)
mainBtn.Text = "⚡"
mainBtn.TextSize = 26
mainBtn.BackgroundTransparency = 1
mainBtn.TextColor3 = Color3.fromRGB(0,150,255)

-- PAGES
local pages = Instance.new("Frame", main)
pages.Size = UDim2.new(1,-70,1,-45)
pages.Position = UDim2.new(0,70,0,45)
pages.BackgroundTransparency = 1

local homePage = Instance.new("Frame", pages)
homePage.Size = UDim2.new(1,0,1,0)
homePage.BackgroundTransparency = 1

local credit = Instance.new("TextLabel", homePage)
credit.Size = UDim2.new(1,0,1,0)
credit.Text = "OrbitX Team\n\nCredits:\nPotato\nOrbitX Dev Team\n\nExecutor: Delta\nCountry: Auto Detect"
credit.Font = Enum.Font.GothamBold
credit.TextSize = 26
credit.TextColor3 = Color3.fromRGB(170,0,255)
credit.BackgroundTransparency = 1

local mainPage = Instance.new("Frame", pages)
mainPage.Size = UDim2.new(1,0,1,0)
mainPage.Visible = false
mainPage.BackgroundTransparency = 1

local list = Instance.new("ScrollingFrame", mainPage)
list.Size = UDim2.new(0.55,0,0.7,0)
list.Position = UDim2.new(0.42,0,0,10)
list.ScrollBarImageTransparency = 1

local flingBtn = Instance.new("TextButton", mainPage)
flingBtn.Size = UDim2.new(0.35,0,0,65)
flingBtn.Position = UDim2.new(0.03,0,0.35,0)
flingBtn.Text = "🔥 OP FLING 🔥"
flingBtn.Font = Enum.Font.GothamBold
flingBtn.TextSize = 22
flingBtn.TextColor3 = Color3.fromRGB(255,255,255)
flingBtn.BackgroundColor3 = Color3.fromRGB(150,0,255)
Instance.new("UICorner", flingBtn)

local stopBtn = Instance.new("TextButton", mainPage)
stopBtn.Size = UDim2.new(0.55,0,0,45)
stopBtn.Position = UDim2.new(0.42,0,0.73,0)
stopBtn.Text = "🛑 STOP FLING"
stopBtn.Font = Enum.Font.GothamBold
stopBtn.TextSize = 18
stopBtn.TextColor3 = Color3.fromRGB(255,120,120)
stopBtn.BackgroundColor3 = Color3.fromRGB(50,0,0)
Instance.new("UICorner", stopBtn)

-- SWITCH
home.MouseButton1Click:Connect(function()
    homePage.Visible = true
    mainPage.Visible = false
end)

mainBtn.MouseButton1Click:Connect(function()
    homePage.Visible = false
    mainPage.Visible = true
end)

-- PLAYER LIST
local function refresh()
    list:ClearAllChildren()
    local y = 0
    for _,plr in pairs(Players:GetPlayers()) do
        if plr ~= LocalPlayer then
            local b = Instance.new("TextButton", list)
            b.Size = UDim2.new(1,-10,0,40)
            b.Position = UDim2.new(0,5,0,y)
            b.Text = plr.Name
            b.Font = Enum.Font.Gotham
            b.TextSize = 18
            b.TextColor3 = Color3.fromRGB(180,180,255)
            b.BackgroundColor3 = Color3.fromRGB(25,25,70)
            Instance.new("UICorner", b)
            y += 45
            b.MouseButton1Click:Connect(function()
                _G.Target = plr
            end)
        end
    end
    list.CanvasSize = UDim2.new(0,0,0,y)
end

refresh()
Players.PlayerAdded:Connect(refresh)
Players.PlayerRemoving:Connect(refresh)

-- FLING
local flinging = false

flingBtn.MouseButton1Click:Connect(function()
    local target = _G.Target
    if not target then return end
    flinging = true

    local char = LocalPlayer.Character
    local tchar = target.Character
    if char and tchar and char:FindFirstChild("HumanoidRootPart") then
        for i=1,15 do
            if not flinging then break end
            char.HumanoidRootPart.CFrame = tchar.HumanoidRootPart.CFrame * CFrame.new(0,0,1)
            char.HumanoidRootPart.Velocity = Vector3.new(6000,6000,6000)
            task.wait(0.02)
        end
    end
end)

stopBtn.MouseButton1Click:Connect(function()
    flinging = false
end)
