-- ============================================
-- 🧠 TSUNAMI BRAINROT - GOD MODE ULTIMATE
-- REBUILD FROM SCRATCH BY MINION GHOUL
-- CREDIT: YAMA 🇵🇸 (CONCEPT)
-- ============================================

-- LOADING NOTIFICATION
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🧠 BRAINROT SCRIPT",
    Text = "Loading Ultimate God Mode...",
    Duration = 3
})

-- LOAD RAYFIELD UI
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- CREATE MAIN WINDOW
local Window = Rayfield:CreateWindow({
    Name = "🌊 TSUNAMI GOD MODE v2.0",
    LoadingTitle = "Activating Brainrot Features...",
    LoadingSubtitle = "By Minion GHOUL | Concept: YAMA",
    Theme = {
        Accent = Color3.fromRGB(255, 0, 100)
    }
})

-- GET PLAYER & CHARACTER
local Player = game.Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()

-- ============================================
-- TAB 1: GOD MODE CORE (FIXED VERSION)
-- ============================================
local GodTab = Window:CreateTab("GOD MODE", "rbxassetid://7072717830")

-- SECTION 1: BASIC GOD MODE
local GodSection = GodTab:CreateSection("🛡️ IMMORTALITY SYSTEM")

local GodToggle = GodTab:CreateToggle({
    Name = "GOD MODE (Invincible)",
    CurrentValue = false,
    Flag = "GodModeToggle",
    Callback = function(state)
        _G.GodModeActive = state
        
        if state then
            -- NOTIFICATION
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "🛡️ GOD MODE",
                Text = "Activating immortality...",
                Duration = 2
            })
            
            -- MAIN GOD MODE FUNCTION
            spawn(function()
                while _G.GodModeActive and Character do
                    task.wait(0.1)
                    
                    -- METHOD 1: SET HEALTH TO INFINITY
                    local Humanoid = Character:FindFirstChild("Humanoid")
                    if Humanoid then
                        Humanoid.MaxHealth = math.huge
                        Humanoid.Health = math.huge
                        
                        -- AUTO-HEAL JUST IN CASE
                        if Humanoid.Health < 100 then
                            Humanoid.Health = math.huge
                        end
                    end
                    
                    -- METHOD 2: REMOVE DAMAGE TAGS
                    pcall(function()
                        for _, child in pairs(Character:GetDescendants()) do
                            if child.Name:find("Damage") or child.Name:find("Hit") then
                                child:Destroy()
                            end
                        end
                    end)
                end
            end)
            
            -- SUCCESS MESSAGE
            task.wait(1)
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "✅ GOD MODE ACTIVE",
                Text = "You are now invincible!",
                Duration = 5
            })
            
        else
            -- DISABLE GOD MODE
            game:GetService("StarterGui"):SetCore("SendNotification", {
                Title = "GOD MODE",
                Text = "Immortality disabled",
                Duration = 3
            })
        end
    end
})

-- SECTION 2: ANTI-TSUNAMI FORCE
local AntiTsunamiSection = GodTab:CreateSection("🌊 ANTI-TSUNAMI")

local AntiPushToggle = GodTab:CreateToggle({
    Name = "Anti Tsunami Push",
    CurrentValue = false,
    Flag = "AntiPushToggle",
    Callback = function(state)
        _G.AntiPush = state
        
        if state then
            spawn(function()
                while _G.AntiPush and Character do
                    task.wait(0.1)
                    
                    local Root = Character:FindFirstChild("HumanoidRootPart")
                    if Root then
                        -- CLEAN OLD BODY VELOCITIES
                        for _, v in pairs(Root:GetChildren()) do
                            if v:IsA("BodyVelocity") then
                                v:Destroy()
                            end
                        end
                        
                        -- CREATE NEW ANTI-PUSH
                        local AntiForce = Instance.new("BodyVelocity")
                        AntiForce.Velocity = Vector3.new(0, 0, 0)
                        AntiForce.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                        AntiForce.P = 10000
                        AntiForce.Name = "GhoulAntiPush"
                        AntiForce.Parent = Root
                    end
                end
            end)
        else
            -- REMOVE ANTI-PUSH
            if Character then
                local Root = Character:FindFirstChild("HumanoidRootPart")
                if Root then
                    local force = Root:FindFirstChild("GhoulAntiPush")
                    if force then
                        force:Destroy()
                    end
                end
            end
        end
    end
})

-- SECTION 3: NO CLIP MODE
local NoClipToggle = GodTab:CreateToggle({
    Name = "No Clip Mode",
    CurrentValue = false,
    Flag = "NoClipToggle",
    Callback = function(state)
        _G.NoClip = state
        
        if state then
            spawn(function()
                while _G.NoClip and Character do
                    task.wait()
                    for _, part in pairs(Character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
})

-- ============================================
-- TAB 2: MOVEMENT HACKS
-- ============================================
local MoveTab = Window:CreateTab("MOVEMENT", "rbxassetid://7072716627")

-- SPEED HACK
local SpeedToggle = MoveTab:CreateToggle({
    Name = "Speed Hack",
    CurrentValue = false,
    Flag = "SpeedToggle",
    Callback = function(state)
        _G.SpeedHack = state
        
        if state then
            spawn(function()
                while _G.SpeedHack and Character do
                    task.wait()
                    local Humanoid = Character:FindFirstChild("Humanoid")
                    if Humanoid then
                        Humanoid.WalkSpeed = 100
                    end
                end
            end)
        else
            if Character and Character:FindFirstChild("Humanoid") then
                Character.Humanoid.WalkSpeed = 16
            end
        end
    end
})

-- JUMP HACK
local JumpToggle = MoveTab:CreateToggle({
    Name = "High Jump",
    CurrentValue = false,
    Flag = "JumpToggle",
    Callback = function(state)
        _G.JumpHack = state
        
        if state then
            spawn(function()
                while _G.JumpHack and Character do
                    task.wait()
                    local Humanoid = Character:FindFirstChild("Humanoid")
                    if Humanoid then
                        Humanoid.JumpPower = 150
                    end
                end
            end)
        else
            if Character and Character:FindFirstChild("Humanoid") then
                Character.Humanoid.JumpPower = 50
            end
        end
    end
})

-- ============================================
-- TAB 3: VISUAL & INFO
-- ============================================
local VisualTab = Window:CreateTab("INFO", "rbxassetid://7072718912")

-- CREDIT INFO
VisualTab:CreateLabel({
    Name = "Script Name: Tsunami Brainrot",
    Text = "God Mode Ultimate Edition"
})

VisualTab:CreateLabel({
    Name = "Original Concept:",
    Text = "YAMA 🇵🇸"
})

VisualTab:CreateLabel({
    Name = "Rebuild By:",
    Text = "Minion GHOUL"
})

VisualTab:CreateButton({
    Name = "🔄 Refresh Character",
    Callback = function()
        Character = Player.Character or Player.CharacterAdded:Wait()
        game:GetService("StarterGui"):SetCore("SendNotification", {
            Title = "Character Refreshed",
            Text = "All features reconnected",
            Duration = 3
        })
    end
})

-- ============================================
-- AUTO-RECONNECT FEATURE
-- ============================================
Player.CharacterAdded:Connect(function(newChar)
    Character = newChar
    task.wait(1)
    
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Character Changed",
        Text = "God Mode features reconnected",
        Duration = 4
    })
end)

-- FINAL LOAD MESSAGE
task.wait(2)
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "🎉 SCRIPT READY!",
    Text = "Tsunami God Mode fully loaded",
    Duration = 5
})

print("========================================")
print("TSUNAMI GOD MODE ULTIMATE LOADED")
print("God Mode: ACTIVE (toggle to enable)")
print("Anti-Push: READY")
print("Movement Hacks: READY")
print("========================================")
