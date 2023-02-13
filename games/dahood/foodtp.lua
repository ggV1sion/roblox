_G.Food_TP_Settings = {
    Keybind = "h"
}

local Services = {
    Players = game:GetService("Players")
}
local Local = {
    Player = Services.Players.LocalPlayer,
    Mouse = Services.Players.LocalPlayer:GetMouse()
}
local State = false

local Foods = {"[Pizza] - $5", "[Chicken] - $7", "[Popcorn] - $7", "[Lettuce] - $5", "[Hamburger] - $5", "[Taco] - $4",
               "[HotDog] - $8", "[Meat] - $12"}

Local.Mouse.KeyDown:Connect(function(f)
    if f == _G.Food_TP_Settings.Keybind and State == false then
        State = true
        local oldCFrame = Local.Player.Character.HumanoidRootPart.CFrame
        local oldVelocity = Local.Player.Character.HumanoidRootPart.Velocity
        for buy, v1sion in pairs(Foods) do
            local CurrentFood = Workspace.Ignored.Shop[v1sion]
            Local.Player.Character.HumanoidRootPart.CFrame = CFrame.new(CurrentFood.Head.Position)
            wait(0.85)
            fireclickdetector(CurrentFood.ClickDetector)
        end
        Local.Player.Character.HumanoidRootPart.CFrame = oldCFrame
        Local.Player.Character.HumanoidRootPart.Velocity = oldVelocity
        State = false
    end
end)
