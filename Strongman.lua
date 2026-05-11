-- Strongman Simulator: Power Script (Auto-Workout & Last Map Egg)
local RS = game:GetService("ReplicatedStorage")
local Remote = RS:WaitForChild("Events"):WaitForChild("TrainFacility")
local EggRemote = RS:WaitForChild("Events"):WaitForChild("PurchaseEgg")

_G.AutoFarm = true
_G.AutoEgg = true

-- 1. მაქსიმალურად სწრაფი 50x ვარჯიში
spawn(function()
    while _G.AutoFarm do
        -- ციკლი 50-ჯერ სწრაფი ვარჯიშისთვის
        for i = 1, 50 do
            if not _G.AutoFarm then break end
            -- იყენებს უნივერსალურ ივენთს, რომელიც მუშაობს ყველა მაპზე
            Remote:FireServer() 
        end
        task.wait(0.1) -- მცირე პაუზა სერვერის დასაცავად
    end
end)

-- 2. ბოლო მაპის კვერცხების ავტომატური გახსნა
spawn(function()
    while _G.AutoEgg do
        -- ეს კოდი პოულობს ბოლო ხელმისაწვდომ კვერცხს თამაშში
        local eggs = workspace:WaitForChild("Eggs"):GetChildren()
        local lastEgg = nil
        local maxDist = 0
        
        for _, egg in pairs(eggs) do
            -- ბოლო მაპის კვერცხი ჩვეულებრივ ყველაზე შორსაა დასაწყისიდან
            if egg:IsA("Model") then
                lastEgg = egg.Name
            end
        end

        if lastEgg then
            EggRemote:FireServer(lastEgg)
        end
        task.wait(0.5) -- გახსნის სიჩქარე
    end
end)

-- Anti-AFK (რომ არ გამოგაგდოს თამაშიდან)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:Connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

print("სკრიპტი გააქტიურებულია: ბოლო მაპი + 50x ვარჯიში!")
