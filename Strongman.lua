local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("💪 Strongman ULTRA: SUPERHERO UPDATE", "Midnight")

-- MAIN FARMING
local Farm = Window:NewTab("Farming")
local Section = Farm:NewSection("Strength & Workout")

-- 1. Workout 50x (Strength Farm)
Section:NewToggle("Auto Workout 50x", "სწრაფი ძალის მომატება", function(state)
    _G.Workout = state
    spawn(function()
        while _G.Workout do
            -- პირდაპირი წვდომა ვარჯიშის ივენთზე
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("TrainFacility", true) or 
                           game:GetService("ReplicatedStorage"):FindFirstChild("Train", true)
            
            if remote then
                for i = 1, 50 do
                    if not _G.Workout then break end
                    remote:FireServer()
                end
            end
            task.wait(0.01)
        end
    end)
end)

-- 2. Superhero Egg Opener
local Eggs = Window:NewTab("Auto Eggs")
local EggSection = Eggs:NewSection("Superhero Map Gacha")

EggSection:NewToggle("Open Superhero Eggs", "ავტომატურად ხსნის Superhero კვერცხს", function(state)
    _G.AutoEgg = state
    spawn(function()
        while _G.AutoEgg do
            local remote = game:GetService("ReplicatedStorage"):FindFirstChild("PurchaseEgg", true)
            if remote then
                -- აქ ვიყენებთ შენს მიერ მოწოდებულ სახელს "Superhero"
                remote:FireServer("Superhero")
            end
            task.wait(0.2)
        end
    end)
end)

-- PLAYER SETTINGS
local Settings = Window:NewTab("Settings")
local SSection = Settings:NewSection("Movement & AFK")

SSection:NewSlider("WalkSpeed", "სირბილის სიჩქარე", 300, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

SSection:NewButton("Anti-AFK", "ჩართე რომ არ გაგაგდოს", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)

print("Superhero სკრიპტი წარმატებით ჩაიტვირთა!")
