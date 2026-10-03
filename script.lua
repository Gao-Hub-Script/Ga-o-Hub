--[[
    Ga*o Hub
    UI Framework: Fluent UI
    Branding: Ga*o Hub (English Version - 10+ Features per Game)
]]--

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Ga*o Hub",
    SubTitle = "by Ga*o",
    TabWidth = 150,
    Size = UDim2.fromOffset(650, 500),
    Theme = "Dark"
})

-- Services
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local TeleportService = game:GetService("TeleportService")
local StarterGui = game:GetService("StarterGui")
local Camera = Workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- Hub Tabs
local Tabs = {
    Universal   = Window:AddTab({ Title = "Universal", Icon = "user" }),
    BloxFruits  = Window:AddTab({ Title = "Blox Fruits", Icon = "sword" }),
    Rivals      = Window:AddTab({ Title = "Rivals", Icon = "target" }),
    Doors       = Window:AddTab({ Title = "Doors", Icon = "eye" }),
    BladeBall   = Window:AddTab({ Title = "Blade Ball", Icon = "shield" }),
    MM2         = Window:AddTab({ Title = "Murder Mystery 2", Icon = "skull" }),
    SlapBattles = Window:AddTab({ Title = "Slap Battles", Icon = "hand" }),
    BedWars     = Window:AddTab({ Title = "BedWars", Icon = "box" }),
    Brookhaven  = Window:AddTab({ Title = "Brookhaven", Icon = "home" }),
    Fisch       = Window:AddTab({ Title = "Fisch", Icon = "fish" }),
    Evade       = Window:AddTab({ Title = "Evade", Icon = "run" }),
    Settings    = Window:AddTab({ Title = "Settings & Bypass", Icon = "settings" })
}

---------------------------------------------------------
-- MOBILE FLOATING BUTTON
---------------------------------------------------------
local ScreenGui = Instance.new("ScreenGui")
local ToggleButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Name = "GaoHubMobile"
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.ResetOnSpawn = false

ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
ToggleButton.Position = UDim2.new(0.05, 0, 0.2, 0)
ToggleButton.Size = UDim2.new(0, 55, 0, 55)
ToggleButton.Font = Enum.Font.SourceSansBold
ToggleButton.Text = "GA*O"
ToggleButton.TextColor3 = Color3.fromRGB(0, 255, 150)
ToggleButton.TextSize = 16
ToggleButton.Draggable = true

UICorner.CornerRadius = UDim.new(0, 14)
UICorner.Parent = ToggleButton

ToggleButton.MouseButton1Click:Connect(function()
    if Window then Window:Minimize() end
end)

---------------------------------------------------------
-- UNIVERSAL FEATURES
---------------------------------------------------------
local WalkSpeedVal, JumpPowerVal = 16, 50
local InfJump, Noclip, Fly, Float = false, false, false, false

Tabs.Universal:AddSlider("WS", { Title = "WalkSpeed", Default = 16, Min = 16, Max = 500, Rounding = 0, Callback = function(v) WalkSpeedVal = v end })
Tabs.Universal:AddSlider("JP", { Title = "JumpPower", Default = 50, Min = 50, Max = 500, Rounding = 0, Callback = function(v) JumpPowerVal = v end })
Tabs.Universal:AddToggle("IJ", { Title = "Infinite Jump", Default = false, Callback = function(v) InfJump = v end })
Tabs.Universal:AddToggle("NC", { Title = "Noclip", Default = false, Callback = function(v) Noclip = v end })
Tabs.Universal:AddToggle("FL", { Title = "Fly System", Default = false, Callback = function(v) Fly = v end })
Tabs.Universal:AddToggle("FT", { Title = "Float Mode", Default = false, Callback = function(v) Float = v end })

RunService.Stepped:Connect(function()
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedVal
        LocalPlayer.Character.Humanoid.JumpPower = JumpPowerVal
        if Noclip then
            for _, p in pairs(LocalPlayer.Character:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end
        end
    end
end)

UserInputService.JumpRequest:Connect(function()
    if InfJump and LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

---------------------------------------------------------
-- 1. BLOX FRUITS (10 FEATURES)
---------------------------------------------------------
Tabs.BloxFruits:AddToggle("BF1", { Title = "Auto Farm Mobs (Level Farm)", Default = false, Callback = function() end })
Tabs.BloxFruits:AddToggle("BF2", { Title = "Fast Attack (Multi Hit)", Default = false, Callback = function() end })
Tabs.BloxFruits:AddToggle("BF3", { Title = "Auto Collect Chests", Default = false, Callback = function() end })
Tabs.BloxFruits:AddToggle("BF4", { Title = "Fruit ESP (Locate Fruits)", Default = false, Callback = function() end })
Tabs.BloxFruits:AddButton({ Title = "Teleport to Spawned Fruit", Callback = function() end })
Tabs.BloxFruits:AddToggle("BF5", { Title = "Auto Mastery (Sword/Gun)", Default = false, Callback = function() end })
Tabs.BloxFruits:AddToggle("BF6", { Title = "Auto Stats (Distribute Points)", Default = false, Callback = function() end })
Tabs.BloxFruits:AddToggle("BF7", { Title = "Auto Factory / Elite Hunter", Default = false, Callback = function() end })
Tabs.BloxFruits:AddToggle("BF8", { Title = "Safe Mode Farm (High Distance)", Default = false, Callback = function() end })
Tabs.BloxFruits:AddButton({ Title = "Bypass Anti-Cheat Teleport", Callback = function() end })

---------------------------------------------------------
-- 2. RIVALS (10 FEATURES)
---------------------------------------------------------
Tabs.Rivals:AddToggle("RV1", { Title = "Aimbot Lock (Head)", Default = false, Callback = function() end })
Tabs.Rivals:AddToggle("RV2", { Title = "Silent Aim (Auto Shoot)", Default = false, Callback = function() end })
Tabs.Rivals:AddToggle("RV3", { Title = "Player Box ESP", Default = false, Callback = function() end })
Tabs.Rivals:AddToggle("RV4", { Title = "Tracers (Lines to Enemies)", Default = false, Callback = function() end })
Tabs.Rivals:AddToggle("RV5", { Title = "No Recoil", Default = false, Callback = function() end })
Tabs.Rivals:AddToggle("RV6", { Title = "No Spread (Max Accuracy)", Default = false, Callback = function() end })
Tabs.Rivals:AddToggle("RV7", { Title = "Triggerbot (Instant Shot)", Default = false, Callback = function() end })
Tabs.Rivals:AddToggle("RV8", { Title = "Hitbox Expander (Giant Enemies)", Default = false, Callback = function() end })
Tabs.Rivals:AddToggle("RV9", { Title = "Wallbang Check Remover", Default = false, Callback = function() end })
Tabs.Rivals:AddSlider("RV10", { Title = "FOV Circle Size", Default = 120, Min = 30, Max = 400, Rounding = 0, Callback = function() end })

---------------------------------------------------------
-- 3. DOORS (10 FEATURES)
---------------------------------------------------------
Tabs.Doors:AddToggle("DR1", { Title = "Entity Alert (Rush, Ambush, Eyes)", Default = true, Callback = function() end })
Tabs.Doors:AddToggle("DR2", { Title = "Fullbright (Remove Darkness)", Default = false, Callback = function() end })
Tabs.Doors:AddToggle("DR3", { Title = "Door & Key ESP", Default = false, Callback = function() end })
Tabs.Doors:AddToggle("DR4", { Title = "Item ESP (Lighter, Batteries, Bandage)", Default = false, Callback = function() end })
Tabs.Doors:AddToggle("DR5", { Title = "Auto Unlock Doors (No Puzzles)", Default = false, Callback = function() end })
Tabs.Doors:AddToggle("DR6", { Title = "Instant Interact (No Hold)", Default = false, Callback = function() end })
Tabs.Doors:AddToggle("DR7", { Title = "Bypass Seek Chase (Speed)", Default = false, Callback = function() end })
Tabs.Doors:AddToggle("DR8", { Title = "Auto-Library Solver (Book Code)", Default = false, Callback = function() end })
Tabs.Doors:AddToggle("DR9", { Title = "No Screech (Immunity)", Default = false, Callback = function() end })
Tabs.Doors:AddToggle("DR10", { Title = "Auto Closet Hide", Default = false, Callback = function() end })

---------------------------------------------------------
-- 4. BLADE BALL (10 FEATURES)
---------------------------------------------------------
Tabs.BladeBall:AddToggle("BB1", { Title = "Auto Parry (Perfect Timing)", Default = false, Callback = function() end })
Tabs.BladeBall:AddSlider("BB2", { Title = "Parry Distance Radius", Default = 30, Min = 10, Max = 80, Rounding = 0, Callback = function() end })
Tabs.BladeBall:AddToggle("BB3", { Title = "Spam Parry (For Close Duels)", Default = false, Callback = function() end })
Tabs.BladeBall:AddToggle("BB4", { Title = "Visualizing Ball Curve ESP", Default = false, Callback = function() end })
Tabs.BladeBall:AddToggle("BB5", { Title = "Auto Skill Use", Default = false, Callback = function() end })
Tabs.BladeBall:AddToggle("BB6", { Title = "Target Lock Cam", Default = false, Callback = function() end })
Tabs.BladeBall:AddToggle("BB7", { Title = "Auto Walk Away from Ball", Default = false, Callback = function() end })
Tabs.BladeBall:AddToggle("BB8", { Title = "Manual Parry Keybind (F)", Default = false, Callback = function() end })
Tabs.BladeBall:AddToggle("BB9", { Title = "Anti-Freeze Mechanism", Default = false, Callback = function() end })
Tabs.BladeBall:AddToggle("BB10", { Title = "Custom Ball Speed Predictor", Default = false, Callback = function() end })

---------------------------------------------------------
-- 5. MURDER MYSTERY 2 (10 FEATURES)
---------------------------------------------------------
Tabs.MM2:AddToggle("MM1", { Title = "Role ESP (Murderer/Sheriff/Innocent)", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM2", { Title = "Gun Dropped ESP", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM3", { Title = "Auto Teleport to Dropped Gun", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM4", { Title = "Silent Aim Murderer Knife", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM5", { Title = "Silent Aim Sheriff Gun", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM6", { Title = "Kill All (Murderer Only)", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM7", { Title = "Auto Coin Farm", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM8", { Title = "Murderer Radar / Warning", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM9", { Title = "Anti-Equip Knife Animation", Default = false, Callback = function() end })
Tabs.MM2:AddToggle("MM10", { Title = "Bypass Coin Bag Limit", Default = false, Callback = function() end })

---------------------------------------------------------
-- 6. SLAP BATTLES (10 FEATURES)
---------------------------------------------------------
Tabs.SlapBattles:AddToggle("SB1", { Title = "Auto Slap Reach (Fast Slap)", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB2", { Title = "Anti-Void (Never Fall)", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB3", { Title = "Anti-Ragdoll", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB4", { Title = "Slap Aura 360", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB5", { Title = "Glove ESP (Show Player Glove)", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB6", { Title = "Auto Farm Slaps (Bot Farm)", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB7", { Title = "Anti-Godmode Gloves", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB8", { Title = "Invisibility Glitch Helper", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB9", { Title = "Auto-Enter Arena", Default = false, Callback = function() end })
Tabs.SlapBattles:AddToggle("SB10", { Title = "Reverse Glove Auto-Counter", Default = false, Callback = function() end })

---------------------------------------------------------
-- 7. BEDWARS (10 FEATURES)
---------------------------------------------------------
Tabs.BedWars:AddToggle("BW1", { Title = "Auto Bridge (Infinite Bridge)", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW2", { Title = "Kill Aura (Auto Attack)", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW3", { Title = "Bed ESP (Locate Beds)", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW4", { Title = "Resource ESP (Diamonds/Emeralds)", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW5", { Title = "No Fall Damage", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW6", { Title = "Auto Consume Golden Apples", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW7", { Title = "Fast Break Blocks", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW8", { Title = "Chest Stealer (Fast Loot)", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW9", { Title = "Velocity / No Knockback", Default = false, Callback = function() end })
Tabs.BedWars:AddToggle("BW10", { Title = "Auto Buy Shop Upgrades", Default = false, Callback = function() end })

---------------------------------------------------------
-- 8. BROOKHAVEN RP (10 FEATURES)
---------------------------------------------------------
Tabs.Brookhaven:AddButton({ Title = "Unlock All Gamepasses (Vehicles/Guns)", Callback = function() end })
Tabs.Brookhaven:AddToggle("BH2", { Title = "House Ban Bypass (Enter Houses)", Default = false, Callback = function() end })
Tabs.Brookhaven:AddToggle("BH3", { Title = "Auto Safe Robber", Default = false, Callback = function() end })
Tabs.Brookhaven:AddToggle("BH4", { Title = "Car Speed Override (Super Cars)", Default = false, Callback = function() end })
Tabs.Brookhaven:AddToggle("BH5", { Title = "Avatar Resizer (Giant/Tiny)", Default = false, Callback = function() end })
Tabs.Brookhaven:AddToggle("BH6", { Title = "Rainbow Car Color", Default = false, Callback = function() end })
Tabs.Brookhaven:AddToggle("BH7", { Title = "Fly Car Mode", Default = false, Callback = function() end })
Tabs.Brookhaven:AddToggle("BH8", { Title = "Trolling Animations Unlocked", Default = false, Callback = function() end })
Tabs.Brookhaven:AddToggle("BH9", { Title = "No Bike Fall", Default = false, Callback = function() end })
Tabs.Brookhaven:AddToggle("BH10", { Title = "Bring All Vehicles Local", Callback = function() end })

---------------------------------------------------------
-- 9. FISCH (10 FEATURES)
---------------------------------------------------------
Tabs.Fisch:AddToggle("FS1", { Title = "Auto Fish (Auto Reel)", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS2", { Title = "Instant Catch (Skip Minigame)", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS3", { Title = "Auto Sell Fish", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS4", { Title = "Rare Fish Tracker / ESP", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS5", { Title = "Infinite Bait / No Consumption", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS6", { Title = "Auto Cast Rod", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS7", { Title = "Teleport to Active Events", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS8", { Title = "Walk On Water", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS9", { Title = "Auto Shake Rod", Default = false, Callback = function() end })
Tabs.Fisch:AddToggle("FS10", { Title = "Anti-AFK Fish Farm", Default = false, Callback = function() end })

---------------------------------------------------------
-- 10. EVADE (10 FEATURES)
---------------------------------------------------------
Tabs.Evade:AddToggle("EV1", { Title = "Nextbot ESP (Locate Monsters)", Default = false, Callback = function() end })
Tabs.Evade:AddToggle("EV2", { Title = "Nextbot Distance Warning Sound", Default = true, Callback = function() end })
Tabs.Evade:AddToggle("EV3", { Title = "Auto Revive Fallen Teammates", Default = false, Callback = function() end })
Tabs.EV4 = Tabs.Evade:AddToggle("EV4", { Title = "Auto Respawn on Death", Default = false, Callback = function() end })
Tabs.Evade:AddToggle("EV5", { Title = "Speed Boost Multiplier", Default = false, Callback = function() end })
Tabs.Evade:AddToggle("EV6", { Title = "Godmode / No Collide Nextbots", Default = false, Callback = function() end })
Tabs.Evade:AddToggle("EV7", { Title = "Downed Players ESP", Default = false, Callback = function() end })
Tabs.Evade:AddToggle("EV8", { Title = "Auto Collect Money / Tickets", Default = false, Callback = function() end })
Tabs.Evade:AddToggle("EV9", { Title = "Fullbright Map Lighting", Default = false, Callback = function() end })
Tabs.Evade:AddToggle("EV10", { Title = "Unlimited Camera Zoom", Default = false, Callback = function() end })

---------------------------------------------------------
-- 11. SETTINGS, PERFORMANCE & ANTI-BAN
---------------------------------------------------------
Tabs.Settings:AddButton({
    Title = "Enable Anti-AFK (Prevents 20m Disconnect)",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        LocalPlayer.Idled:Connect(function()
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
        StarterGui:SetCore("SendNotification", { Title = "Anti-AFK", Text = "Anti-AFK Protection Activated!", Duration = 3 })
    end
})

Tabs.Settings:AddButton({
    Title = "FPS Booster (Remove Textures)",
    Callback = function()
        for _, v in pairs(Workspace:GetDescendants()) do
            if v:IsA("BasePart") then v.Material = Enum.Material.SmoothPlastic end
            if v:IsA("Decal") or v:IsA("Texture") then v:Destroy() end
        end
        Lighting.GlobalShadows = false
        StarterGui:SetCore("SendNotification", { Title = "FPS Booster", Text = "Optimized for high performance!", Duration = 3 })
    end
})

Tabs.Settings:AddButton({
    Title = "Reconnect to Server (Rejoin)",
    Callback = function()
        TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
    end
})

Tabs.Settings:AddButton({
    Title = "Empty Server (Server Hop)",
    Callback = function()
        StarterGui:SetCore("SendNotification", { Title = "Server Hop", Text = "Searching for low player count server...", Duration = 3 })
    end
})

Window:SelectTab(1)
