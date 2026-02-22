--// OrbitX V4 FINAL BOSS | Delta Mobile
--// Credits: Potato & OrbitX Team

if game.CoreGui:FindFirstChild("OrbitX_UI") then
    game.CoreGui.OrbitX_UI:Destroy()
end

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UIS = game:GetService("UserInputService")

--========================================
-- LOADING SCREEN
--========================================

local loadGui = Instance.new("ScreenGui", game.CoreGui)
loadGui.Name = "OrbitX_Load"

local load = Instance.new("Frame", loadGui)
load.Size = UDim2.new(0,380,0,220)
load.Position = UDim2.new(0.5,-190,0.5,-110)
load.BackgroundColor3 = Color3.fromRGB(15,15,30)
load.BorderSizePixel = 0

local lc = Instance.new("UICorner", load)
lc.CornerRadius = UDim.new(0,20)

local grad = Instance.new("UIGradient", load)
grad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,180,255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(140,0,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(200,0,255))
}

local logo = Instance.new("ImageLabel", load)
logo.Size = UDim2.new(0,70,0,70)
logo.Position = UDim2.new(0.5,-35,0,15)
logo.Image = "rbxassetid://110454187158483"
logo.BackgroundTransparency = 1

local title = Instance.new("TextLabel", load)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,90)
title.Text = "OrbitX V4"
title.Font = Enum.Font.GothamBlack
title.TextSize = 30
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1

local tgrad = Instance.new("UIGradient", title)
tgrad.Color = grad.Color

local tip = Instance.new("TextLabel", load)
tip.Size = UDim2.new(1,-40,0,35)
tip.Position = UDim2.new(0,20,0,130)
tip.TextWrapped = true
tip.Font = Enum.Font.Gotham
tip.TextSize = 16
tip.TextColor3 = Color3.fromRGB(230,230,255)
tip.BackgroundTransparency = 1

local barBG = Instance.new("Frame", load)
barBG.Size = UDim2.new(1,-40,0,12)
barBG.Position = UDim2.new(0,20,1,-30)
barBG.BackgroundColor3 = Color3.fromRGB(20,20,40)
barBG.BorderSizePixel = 0

local bc = Instance.new("UICorner", barBG)
bc.CornerRadius = UDim.new(1,0)

local bar = Instance.new("Frame", barBG)
bar.Size = UDim2.new(0,0,1,0)
bar.BackgroundColor3 = Color3.fromRGB(255,255,255)
bar.BorderSizePixel = 0

local barGrad = Instance.new("UIGradient", bar)
barGrad.Color = grad.Color

local tips = {
    "Tip: Use Speed + Fly to dodge attacks",
    "Tip: Hitbox lets you hit enemies from far away",
    "Tip: Auto Farm wins matches for you",
    "Tip: OrbitX = Skill + Style",
    "Tip: Always keep moving in duels"
}

for i=1,100 do
    bar.Size = UDim2.new(i/100,0,1,0)
    tip.Text = tips[(i%5)+1].." ("..i.."%)"
    task.wait(0.07)
end

loadGui:Destroy()

--========================================
-- MAIN UI
--========================================

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "OrbitX_UI"
gui.ResetOnSpawn = false

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,580,0,380)
main.Position = UDim2.new(0.5,-290,0.5,-190)
main.BackgroundColor3 = Color3.fromRGB(15,15,30)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.ClipsDescendants = true

local mc = Instance.new("UICorner", main)
mc.CornerRadius = UDim.new(0,20)

local mainGrad = Instance.new("UIGradient", main)
mainGrad.Color = grad.Color

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
topTitle.Size = UDim2.new(0,250,0,45)
topTitle.Position = UDim2.new(0,60,0,5)
topTitle.Text = "OrbitX V4"
topTitle.Font = Enum.Font.GothamBlack
topTitle.TextSize = 26
topTitle.TextColor3 = Color3.fromRGB(255,255,255)
topTitle.BackgroundTransparency = 1

local ttg = Instance.new("UIGradient", topTitle)
ttg.Color = grad.Color

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

for _,b in pairs({close,minimize}) do
    local c = Instance.new("UICorner", b)
    c.CornerRadius = UDim.new(1,0)
end

-- FLOAT ICON
local float = Instance.new("ImageButton", gui)
float.Size = UDim2.new(0,65,0,65)
float.Position = UDim2.new(0,15,0.5,-32)
float.Image = "rbxassetid://110454187158483"
float.BackgroundColor3 = Color3.fromRGB(15,15,30)
float.Visible = false
float.Active = true
float.Draggable = true

local fc = Instance.new("UICorner", float)
fc.CornerRadius = UDim.new(1,0)

minimize.MouseButton1Click:Connect(function()
    main.Visible = false
    float.Visible = true
end)

float.MouseButton1Click:Connect(function()
    main.Visible = true
    float.Visible = false
end)

--========================================
-- CLOSE CONFIRM
--========================================

local confirm = Instance.new("Frame", gui)
confirm.Size = UDim2.new(0,300,0,160)
confirm.Position = UDim2.new(0.5,-150,0.5,-80)
confirm.BackgroundColor3 = Color3.fromRGB(15,15,30)
confirm.Visible = false

local cc = Instance.new("UICorner", confirm)
cc.CornerRadius = UDim.new(0,18)

local cg = Instance.new("UIGradient", confirm)
cg.Color = grad.Color

local ctext = Instance.new("TextLabel", confirm)
ctext.Size = UDim2.new(1,-20,0,60)
ctext.Position = UDim2.new(0,10,0,15)
ctext.TextWrapped = true
ctext.Text = "Close window?\nOrbitX will be unloaded."
ctext.Font = Enum.Font.GothamBold
ctext.TextSize = 18
ctext.TextColor3 = Color3.fromRGB(255,255,255)
ctext.BackgroundTransparency = 1

local yes = Instance.new("TextButton", confirm)
yes.Size = UDim2.new(0,110,0,40)
yes.Position = UDim2.new(0.1,0,1,-55)
yes.Text = "YES"
yes.Font = Enum.Font.GothamBlack
yes.TextSize = 16
yes.TextColor3 = Color3.fromRGB(255,255,255)
yes.BackgroundColor3 = Color3.fromRGB(40,0,80)

local no = Instance.new("TextButton", confirm)
no.Size = UDim2.new(0,110,0,40)
no.Position = UDim2.new(0.55,0,1,-55)
no.Text = "NO"
no.Font = Enum.Font.GothamBlack
no.TextSize = 16
no.TextColor3 = Color3.fromRGB(255,255,255)
no.BackgroundColor3 = Color3.fromRGB(20,20,40)

for _,b in pairs({yes,no}) do
    local c = Instance.new("UICorner", b)
    c.CornerRadius = UDim.new(0,14)
end

close.MouseButton1Click:Connect(function()
    confirm.Visible = true
end)

no.MouseButton1Click:Connect(function()
    confirm.Visible = false
end)

yes.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

--========================================
-- SIDEBAR + PAGES
--========================================

local sidebar = Instance.new("Frame", main)
sidebar.Size = UDim2.new(0,70,1,-60)
sidebar.Position = UDim2.new(0,0,0,60)
sidebar.BackgroundColor3 = Color3.fromRGB(12,12,25)

local sc = Instance.new("UICorner", sidebar)
sc.CornerRadius = UDim.new(0,18)

local pages = Instance.new("Folder", main)
pages.Name = "Pages"

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

    local c = Instance.new("UICorner", b)
    c.CornerRadius = UDim.new(1,0)

    b.MouseButton1Click:Connect(function()
        for _,v in pairs(pages:GetChildren()) do
            v.Visible = false
        end
        page.Visible = true
    end)
end

tab(3926305904,20,home)
tab(3926307971,85,mainTab)

--========================================
-- HOME
--========================================

local htext = Instance.new("TextLabel", home)
htext.Size = UDim2.new(1,0,1,0)
htext.TextWrapped = true
htext.Text = [[
Executor: Delta
Credits: Potato & OrbitX Team
Discord: discord.gg/orbitx

Status: Loaded
]]
htext.Font = Enum.Font.Gotham
htext.TextSize = 18
htext.TextColor3 = Color3.fromRGB(255,255,255)
htext.BackgroundTransparency = 1

local hg = Instance.new("UIGradient", htext)
hg.Color = grad.Color

--========================================
-- MAIN BUTTONS + FUNCTIONS
--========================================

local hitbox,farm,killAura,fly,speed=false,false,false,false,false

local function makeButton(txt,y,callback)
    local b = Instance.new("TextButton", mainTab)
    b.Size = UDim2.new(0,300,0,45)
    b.Position = UDim2.new(0,30,0,y)
    b.Text = txt.." : OFF"
    b.Font = Enum.Font.GothamBold
    b.TextSize = 16
    b.TextColor3 = Color3.fromRGB(255,255,255)
    b.BackgroundColor3 = Color3.fromRGB(40,0,80)

    local bc = Instance.new("UICorner", b)
    bc.CornerRadius = UDim.new(0,14)

    local bg = Instance.new("UIGradient", b)
    bg.Color = grad.Color

    local state=false
    b.MouseButton1Click:Connect(function()
        state=not state
        b.Text=txt..(state and " : ON" or " : OFF")
        callback(state)
    end)
end

makeButton("Hitbox Expander",20,function(v) hitbox=v end)
makeButton("Auto Farm",75,function(v) farm=v end)
makeButton("Kill Aura",130,function(v) killAura=v end)
makeButton("Fly",185,function(v) fly=v end)
makeButton("Speed Boost",240,function(v) speed=v end)

RunService.Heartbeat:Connect(function()
    if speed and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed=50
    end
end)

task.spawn(function()
    while task.wait(1) do
        if hitbox then
            for _,v in pairs(Players:GetPlayers()) do
                if v~=LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    v.Character.HumanoidRootPart.Size=Vector3.new(12,12,12)
                end
            end
        end
    end
end)

task.spawn(function()
    while task.wait(0.25) do
        if farm or killAura then
            for _,v in pairs(Players:GetPlayers()) do
                if v~=LocalPlayer and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                    LocalPlayer.Character:MoveTo(v.Character.HumanoidRootPart.Position)
                end
            end
        end
    end
end)

UIS.InputBegan:Connect(function(i)
    if fly and i.KeyCode==Enum.KeyCode.Space then
        local bv=Instance.new("BodyVelocity",LocalPlayer.Character.HumanoidRootPart)
        bv.Velocity=Vector3.new(0,70,0)
        task.delay(0.3,function() bv:Destroy() end)
    end
end)

print("OrbitX V4 FINAL BOSS LOADED 😈🔥")
