local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("💪 Strongman MOBILE - MOD MENU", "Midnight")

-- FARMING TAB
local Farm = Window:NewTab("Farming")
local FarmSection = Farm:NewSection("Strength & Workout")

FarmSection:NewToggle("Workout 50x (Strength Farm)", "უზარმაზარი ძალა წამებში", function(state)
    _G.Workout = state
    spawn(function()
        while _G.Workout do
            for i = 1, 50 do
                if not _G.Workout then break end
                game:GetService("ReplicatedStorage").Events.Train:FireServer()
            end
            task.wait(0.01)
        end
    end)
end)

-- EGGS TAB
local Eggs = Window:NewTab("Auto Eggs")
local EggSection = Eggs:NewSection("Last Map Egg Opener")

EggSection:NewToggle("Auto Open Last Egg", "ხსნის ბოლო მაპის კვერცხებს", function(state)
    _G.AutoEgg = state
    spawn(function()
        while _G.AutoEgg do
            local eggFolder = workspace:FindFirstChild("Eggs")
            if eggFolder then
                local eggList = eggFolder:GetChildren()
                local lastEgg = eggList[#eggList].Name -- პოულობს ბოლო კვერცხს სიაში
                game:GetService("ReplicatedStorage").Events.PurchaseEgg:FireServer(lastEgg)
            end
            task.wait(0.1)
        end
    end)
end)

-- PLAYER SETTINGS
local Settings = Window:NewTab("Settings")
local SSection = Settings:NewSection("Player Boosts")

SSection:NewSlider("WalkSpeed", "სირბილის სიჩქარე", 300, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

SSection:NewButton("Anti-AFK", "თამაშიდან არ გამოგაგდებს", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
