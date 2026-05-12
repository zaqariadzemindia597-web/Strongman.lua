local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("💪 Strongman X50 TURBO", "Midnight")

local Farm = Window:NewTab("Farming")
local TrainSection = Farm:NewSection("X50 Turbo Workout")

-- 50X ვარჯიშის ფუნქცია
TrainSection:NewToggle("X50 Fast Workout", "ძალიან სწრაფი მომატება", function(state)
    _G.TurboWorkout = state
    spawn(function()
        while _G.TurboWorkout do
            -- იმისათვის რომ 50X სიჩქარე მივიღოთ, ერთ ციკლში რამდენჯერმე გავუშვებთ ივენთს
            for i = 1, 10 do 
                -- პირველი ივენთი (FireServer)
                local args1 = { [1] = 0.9771818940993398 }
                game:GetService("ReplicatedStorage"):WaitForChild("bacc497e21b84e9bc663d01d0aecf2ff"):FireServer(unpack(args1))
                
                -- მეორე ივენთი (InvokeServer)
                local args2 = { [1] = 25, [2] = "Default" }
                game:GetService("ReplicatedStorage"):WaitForChild("02e1acb5bc806fbc6c6ab170412080fd"):InvokeServer(unpack(args2))
            end
            
            -- ძალიან მცირე პაუზა, რომ თამაში არ გაითიშოს (Crash)
            task.wait(0.001) 
        end
    end)
end)

-- სხვა ფუნქციები
local Player = Window:NewTab("Player")
local PSection = Player:NewSection("Movement")

PSection:NewSlider("Speed", "სირბილი", 500, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

PSection:NewButton("Anti-AFK", "ჩართე რომ არ გაგაგდოს", function()
    local vu = game:GetService("VirtualUser")
    game:GetService("Players").LocalPlayer.Idled:Connect(function()
        vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
        task.wait(1)
        vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    end)
end)
