--[[
=========================================================
                    GA*O HUB V3
=========================================================
    Universal Roblox Testing / Development Hub
    UI: Fluent

    Features:
    • Automatic game detection
    • Universal player controls
    • Fly
    • Noclip
    • Infinite Jump
    • Float Platform
    • ESP
    • Distance ESP
    • Player information
    • Fullbright
    • FOV
    • FPS Booster
    • Server information
    • Rejoin
    • Position tools
    • Mobile floating button
    • Notifications
    • Game-specific module detection
    • Generic Support
    • Cleanup system

    Designed for experiences you own/test.
=========================================================
]]

---------------------------------------------------------
-- FLUENT
---------------------------------------------------------

local Fluent = loadstring(game:HttpGet(
    "https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"
))()

---------------------------------------------------------
-- SERVICES
---------------------------------------------------------

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")
local Stats = game:GetService("Stats")
local TweenService = game:GetService("TweenService")

local LocalPlayer = Players.LocalPlayer

---------------------------------------------------------
-- WINDOW
---------------------------------------------------------

local Window = Fluent:CreateWindow({
    Title = "Ga*o Hub",
    SubTitle = "V3 • Universal Edition",
    TabWidth = 160,
    Size = UDim2.fromOffset(720, 560),
    Acrylic = false,
    Theme = "Dark"
})

---------------------------------------------------------
-- TABS
---------------------------------------------------------

local Tabs = {

    Home = Window:AddTab({
        Title = "Home",
        Icon = "home"
    }),

    Universal = Window:AddTab({
        Title = "Universal",
        Icon = "user"
    }),

    Movement = Window:AddTab({
        Title = "Movement",
        Icon = "zap"
    }),

    Visuals = Window:AddTab({
        Title = "Visuals",
        Icon = "eye"
    }),

    Game = Window:AddTab({
        Title = "Game",
        Icon = "gamepad-2"
    }),

    Tools = Window:AddTab({
        Title = "Tools",
        Icon = "wrench"
    }),

    Server = Window:AddTab({
        Title = "Server",
        Icon = "server"
    }),

    Settings = Window:AddTab({
        Title = "Settings",
        Icon = "settings"
    })
}

---------------------------------------------------------
-- STATE
---------------------------------------------------------

local State = {

    WalkSpeed = 16,
    JumpPower = 50,
    Gravity = 196.2,

    Fly = false,
    FlySpeed = 50,

    Noclip = false,
    InfiniteJump = false,
    Float = false,

    Fullbright = false,
    Crosshair = false,

    ESP = false,
    ESPNames = true,
    ESPDistance = true,

    FOV = 70,

    FPSBoost = false,
    AntiAFK = false,

    MobileButton = true
}

---------------------------------------------------------
-- CHARACTER
---------------------------------------------------------

local Character
local Humanoid
local RootPart

local function RefreshCharacter()

    Character = LocalPlayer.Character

    if not Character then
        Humanoid = nil
        RootPart = nil
        return
    end

    Humanoid =
        Character:FindFirstChildOfClass("Humanoid")

    RootPart =
        Character:FindFirstChild("HumanoidRootPart")
end

RefreshCharacter()

LocalPlayer.CharacterAdded:Connect(function(character)

    Character = character

    task.wait(0.5)

    Humanoid =
        character:FindFirstChildOfClass("Humanoid")

    RootPart =
        character:FindFirstChild("HumanoidRootPart")

end)

---------------------------------------------------------
-- NOTIFICATION
---------------------------------------------------------

local function Notify(title, message)

    pcall(function()

        StarterGui:SetCore(
            "SendNotification",
            {
                Title = title,
                Text = message,
                Duration = 3
            }
        )

    end)

end

---------------------------------------------------------
-- GAME DATABASE
---------------------------------------------------------

local Games = {

    -- Horror

    [6516141723] = {
        Name = "DOORS",
        Category = "Horror"
    },

    [6839171747] = {
        Name = "DOORS",
        Category = "Horror"
    },

    [13864667823] = {
        Name = "Break In 2",
        Category = "Horror"
    },

    [6243699076] = {
        Name = "The Mimic",
        Category = "Horror"
    },

    [893973440] = {
        Name = "Flee the Facility",
        Category = "Horror"
    },

    -- Anime / RPG

    [2753915549] = {
        Name = "Blox Fruits",
        Category = "Anime / RPG",
        Sea = 1
    },

    [4442272183] = {
        Name = "Blox Fruits",
        Category = "Anime / RPG",
        Sea = 2
    },

    [7449423635] = {
        Name = "Blox Fruits",
        Category = "Anime / RPG",
        Sea = 3
    },

    [4520749081] = {
        Name = "King Legacy",
        Category = "Anime / RPG"
    },

    [13772394625] = {
        Name = "Blade Ball",
        Category = "Anime / RPG"
    },

    [14433762945] = {
        Name = "Anime Champions Simulator",
        Category = "Anime / RPG"
    },

    [5956785391] = {
        Name = "Project Slayers",
        Category = "Anime / RPG"
    },

    [9224601490] = {
        Name = "Fruit Battlegrounds",
        Category = "Anime / RPG"
    },

    -- Shooter / PvP

    [286090429] = {
        Name = "Arsenal",
        Category = "Shooter / PvP"
    },

    [2788229376] = {
        Name = "Da Hood",
        Category = "Shooter / PvP"
    },

    [4282928811] = {
        Name = "Combat Warriors",
        Category = "Shooter / PvP"
    },

    [14166007661] = {
        Name = "Big Paintball 2",
        Category = "Shooter / PvP"
    },

    -- Driving

    [10878592403] = {
        Name = "Drive World",
        Category = "Driving"
    },

    [654732683] = {
        Name = "Car Crushers 2",
        Category = "Driving"
    },

    [3351674303] = {
        Name = "Driving Empire",
        Category = "Driving"
    },

    [3623096087] = {
        Name = "Muscle Legends",
        Category = "Training"
    },

    -- Tower Defense

    [3260590327] = {
        Name = "Tower Defense Simulator",
        Category = "Tower Defense"
    },

    [9508620780] = {
        Name = "Tower Defense X",
        Category = "Tower Defense"
    },

    [13775256536] = {
        Name = "Toilet Tower Defense",
        Category = "Tower Defense"
    }
}

local CurrentGame =
    Games[game.PlaceId]

---------------------------------------------------------
-- HOME
---------------------------------------------------------

Tabs.Home:AddParagraph({

    Title = "Ga*o Hub V3",

    Content =
        "Universal Roblox Testing Hub\n" ..
        "Multi-Game Detection\n" ..
        "Fluent UI\n" ..
        "Mobile Friendly"
})

Tabs.Home:AddParagraph({

    Title = "Current Game",

    Content =
        CurrentGame
        and CurrentGame.Name
        or "Generic Support"
})

Tabs.Home:AddParagraph({

    Title = "Category",

    Content =
        CurrentGame
        and CurrentGame.Category
        or "Universal"
})

Tabs.Home:AddParagraph({

    Title = "Place ID",

    Content = tostring(game.PlaceId)
})

Tabs.Home:AddButton({

    Title = "Refresh Character",

    Callback = function()

        RefreshCharacter()

        Notify(
            "Ga*o Hub",
            "Character atualizado!"
        )

    end
})

---------------------------------------------------------
-- UNIVERSAL
---------------------------------------------------------

Tabs.Universal:AddSlider("WalkSpeed", {

    Title = "WalkSpeed",

    Description = "Velocidade do personagem",

    Default = 16,

    Min = 0,

    Max = 300,

    Rounding = 0,

    Callback = function(value)

        State.WalkSpeed = value

        if Humanoid then
            Humanoid.WalkSpeed = value
        end

    end
})

Tabs.Universal:AddSlider("JumpPower", {

    Title = "JumpPower",

    Default = 50,

    Min = 0,

    Max = 300,

    Rounding = 0,

    Callback = function(value)

        State.JumpPower = value

        if Humanoid then

            Humanoid.UseJumpPower = true

            Humanoid.JumpPower = value

        end

    end
})

Tabs.Universal:AddSlider("Gravity", {

    Title = "Gravity",

    Default = 196.2,

    Min = 0,

    Max = 500,

    Rounding = 1,

    Callback = function(value)

        State.Gravity = value

        Workspace.Gravity = value

    end
})

Tabs.Universal:AddSlider("FOV", {

    Title = "Camera FOV",

    Default = 70,

    Min = 40,

    Max = 120,

    Rounding = 0,

    Callback = function(value)

        State.FOV = value

        if Workspace.CurrentCamera then

            Workspace.CurrentCamera.FieldOfView =
                value

        end

    end
})

---------------------------------------------------------
-- MOVEMENT
---------------------------------------------------------

Tabs.Movement:AddToggle("InfiniteJump", {

    Title = "Infinite Jump",

    Default = false,

    Callback = function(value)

        State.InfiniteJump = value

    end
})

Tabs.Movement:AddToggle("Noclip", {

    Title = "Noclip",

    Default = false,

    Callback = function(value)

        State.Noclip = value

    end
})

Tabs.Movement:AddToggle("Float", {

    Title = "Float Platform",

    Default = false,

    Callback = function(value)

        State.Float = value

    end
})

Tabs.Movement:AddToggle("Fly", {

    Title = "Fly",

    Default = false,

    Callback = function(value)

        State.Fly = value

    end
})

Tabs.Movement:AddSlider("FlySpeed", {

    Title = "Fly Speed",

    Default = 50,

    Min = 10,

    Max = 250,

    Rounding = 0,

    Callback = function(value)

        State.FlySpeed = value

    end
})

---------------------------------------------------------
-- INFINITE JUMP
---------------------------------------------------------

UserInputService.JumpRequest:Connect(function()

    if not State.InfiniteJump then
        return
    end

    if Humanoid then

        Humanoid:ChangeState(
            Enum.HumanoidStateType.Jumping
        )

    end

end)

---------------------------------------------------------
-- NOCLIP
---------------------------------------------------------

RunService.Stepped:Connect(function()

    if not Character then
        return
    end

    if State.Noclip then

        for _, object in
            ipairs(Character:GetDescendants()) do

            if object:IsA("BasePart") then

                object.CanCollide = false

            end

        end

    end

end)

---------------------------------------------------------
-- FLOAT
---------------------------------------------------------

local FloatPart

local function RemoveFloat()

    if FloatPart then

        FloatPart:Destroy()

        FloatPart = nil

    end

end

local function CreateFloat()

    RemoveFloat()

    FloatPart = Instance.new("Part")

    FloatPart.Name = "GaoHubFloat"

    FloatPart.Size =
        Vector3.new(6, 0.5, 6)

    FloatPart.Anchored = true

    FloatPart.CanCollide = true

    FloatPart.Transparency = 0.35

    FloatPart.Parent = Workspace

end

RunService.Heartbeat:Connect(function()

    if State.Float and RootPart then

        if not FloatPart then
            CreateFloat()
        end

        if FloatPart then

            FloatPart.CFrame =
                RootPart.CFrame *
                CFrame.new(0, -3.2, 0)

        end

    else

        RemoveFloat()

    end

end)

---------------------------------------------------------
-- FLY
---------------------------------------------------------

local FlyVelocity

local function StopFly()

    if FlyVelocity then

        FlyVelocity:Destroy()

        FlyVelocity = nil

    end

end

local function StartFly()

    StopFly()

    if not RootPart then
        return
    end

    FlyVelocity =
        Instance.new("BodyVelocity")

    FlyVelocity.MaxForce =
        Vector3.new(
            math.huge,
            math.huge,
            math.huge
        )

    FlyVelocity.Velocity =
        Vector3.zero

    FlyVelocity.Parent =
        RootPart

end

RunService.RenderStepped:Connect(function()

    if not State.Fly then

        StopFly()

        return

    end

    if not RootPart then
        return
    end

    if not FlyVelocity then
        StartFly()
    end

    local Camera =
        Workspace.CurrentCamera

    if not Camera then
        return
    end

    local direction =
        Vector3.zero

    if UserInputService:IsKeyDown(
        Enum.KeyCode.W
    ) then

        direction +=
            Camera.CFrame.LookVector

    end

    if UserInputService:IsKeyDown(
        Enum.KeyCode.S
    ) then

        direction -=
            Camera.CFrame.LookVector

    end

    if UserInputService:IsKeyDown(
        Enum.KeyCode.A
    ) then

        direction -=
            Camera.CFrame.RightVector

    end

    if UserInputService:IsKeyDown(
        Enum.KeyCode.D
    ) then

        direction +=
            Camera.CFrame.RightVector

    end

    if UserInputService:IsKeyDown(
        Enum.KeyCode.Space
    ) then

        direction +=
            Vector3.new(0, 1, 0)

    end

    if UserInputService:IsKeyDown(
        Enum.KeyCode.LeftControl
    ) then

        direction -=
            Vector3.new(0, 1, 0)

    end

    if direction.Magnitude > 0 then

        direction =
            direction.Unit

    end

    FlyVelocity.Velocity =
        direction * State.FlySpeed

end)

---------------------------------------------------------
-- ESP
---------------------------------------------------------

local ESP = {}

local function RemoveESP(player)

    local data =
        ESP[player]

    if not data then
        return
    end

    if data.Highlight then
        data.Highlight:Destroy()
    end

    if data.Billboard then
        data.Billboard:Destroy()
    end

    ESP[player] = nil

end

local function CreateESP(player)

    if player == LocalPlayer then
        return
    end

    if not player.Character then
        return
    end

    local root =
        player.Character:
        FindFirstChild("HumanoidRootPart")

    if not root then
        return
    end

    RemoveESP(player)

    local highlight =
        Instance.new("Highlight")

    highlight.Name =
        "GaoHubESP"

    highlight.Adornee =
        player.Character

    highlight.FillTransparency =
        0.65

    highlight.OutlineTransparency =
        0

    highlight.FillColor =
        Color3.fromRGB(
            0,
            255,
            150
        )

    highlight.OutlineColor =
        Color3.fromRGB(
            255,
            255,
            255
        )

    highlight.Parent =
        player.Character

    local billboard =
        Instance.new("BillboardGui")

    billboard.Name =
        "GaoHubESPInfo"

    billboard.Adornee =
        root

    billboard.Size =
        UDim2.fromOffset(
            200,
            55
        )

    billboard.StudsOffset =
        Vector3.new(
            0,
            3,
            0
        )

    billboard.AlwaysOnTop =
        true

    billboard.Parent =
        root

    local label =
        Instance.new("TextLabel")

    label.Size =
        UDim2.fromScale(
            1,
            1
        )

    label.BackgroundTransparency =
        1

    label.Font =
        Enum.Font.GothamBold

    label.TextSize =
        14

    label.TextColor3 =
        Color3.fromRGB(
            255,
            255,
            255
        )

    label.TextStrokeTransparency =
        0

    label.Parent =
        billboard

    ESP[player] = {

        Highlight = highlight,

        Billboard = billboard,

        Label = label
    }

end

local function UpdateESP()

    if not State.ESP then

        for player in pairs(ESP) do
            RemoveESP(player)
        end

        return
    end

    for _, player in
        ipairs(Players:GetPlayers()) do

        if player ~= LocalPlayer then

            if not ESP[player] then
                CreateESP(player)
            end

            local data =
                ESP[player]

            if data
                and data.Label
                and player.Character then

                local text =
                    player.DisplayName

                if State.ESPDistance then

                    local myRoot =
                        LocalPlayer.Character
                        and LocalPlayer.Character:
                        FindFirstChild(
                            "HumanoidRootPart"
                        )

                    local targetRoot =
                        player.Character:
                        FindFirstChild(
                            "HumanoidRootPart"
                        )

                    if myRoot
                        and targetRoot then

                        local distance =
                            (
                                myRoot.Position -
                                targetRoot.Position
                            ).Magnitude

                        text =
                            text ..
                            "\n" ..
                            math.floor(
                                distance
                            ) ..
                            " studs"

                    end

                end

                data.Label.Text =
                    text

            end

        end

    end

end

Tabs.Visuals:AddToggle("ESP", {

    Title = "Player ESP",

    Default = false,

    Callback = function(value)

        State.ESP = value

        UpdateESP()

    end
})

Tabs.Visuals:AddToggle("ESPDistance", {

    Title = "Show Distance",

    Default = true,

    Callback = function(value)

        State.ESPDistance = value

    end
})

---------------------------------------------------------
-- FULLBRIGHT
---------------------------------------------------------

local OriginalLighting = {

    Ambient =
        Lighting.Ambient,

    OutdoorAmbient =
        Lighting.OutdoorAmbient,

    Brightness =
        Lighting.Brightness,

    GlobalShadows =
        Lighting.GlobalShadows,

    ClockTime =
        Lighting.ClockTime
}

Tabs.Visuals:AddToggle("Fullbright", {

    Title = "Fullbright",

    Default = false,

    Callback = function(value)

        State.Fullbright = value

        if value then

            Lighting.Ambient =
                Color3.fromRGB(
                    255,
                    255,
                    255
                )

            Lighting.OutdoorAmbient =
                Color3.fromRGB(
                    255,
                    255,
                    255
                )

            Lighting.Brightness = 2

            Lighting.GlobalShadows =
                false

        else

            Lighting.Ambient =
                OriginalLighting.Ambient

            Lighting.OutdoorAmbient =
                OriginalLighting.OutdoorAmbient

            Lighting.Brightness =
                OriginalLighting.Brightness

            Lighting.GlobalShadows =
                OriginalLighting.GlobalShadows

            Lighting.ClockTime =
                OriginalLighting.ClockTime

        end

    end
})

---------------------------------------------------------
-- CROSSHAIR
---------------------------------------------------------

local CrosshairGui

local function CreateCrosshair()

    if CrosshairGui
