_G.AimViewer_Settings = {
    LocalPlayer = true,
    Keybind = "x",
    Color = Color3.fromRGB(0, 255, 0),
    Size = {0.125, 0.125},
    Transparency = 0.4,
    Material = "SmoothPlastic",
    Part = "Head"
}

local Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    Workspace = game:GetService("Workspace")
}
local Local = {
    Player = Services.Players.LocalPlayer,
    Mouse = Services.Players.LocalPlayer:GetMouse()
}

local LockDetector = Instance.new("Part")
LockDetector.Parent = Services.Workspace
LockDetector.Anchored = true
LockDetector.CanCollide = false
LockDetector.Material = _G.AimViewer_Settings.Material
LockDetector.Color = _G.AimViewer_Settings.Color
LockDetector.Transparency = _G.AimViewer_Settings.Transparency

local function isLocalPlayer(d)
    if _G.AimViewer_Settings.LocalPlayer then
        return true
    else
        if d ~= Local.Player then
            return true
        else
            return false
        end
    end
end

local function getClosestPlayerToCursor()
    local closest, shortest = nil, math.huge
    for _, player in next, Services.Players:GetPlayers() do
        if isLocalPlayer(player) and player.Character and player.Character:FindFirstChild("Humanoid") and
            player.Character.Humanoid.Health ~= 0 and player.Character:FindFirstChild(_G.AimViewer_Settings.Part) then
            local pos = Services.Workspace.CurrentCamera:WorldToViewportPoint(player.Character.PrimaryPart.Position)
            local magnitude = (Vector2.new(pos.X, pos.Y) - Vector2.new(Local.Mouse.X, Local.Mouse.Y)).magnitude
            if magnitude < shortest then
                closest = player
                shortest = magnitude
            end
        end
    end
    return closest
end

local player, enabled = nil, false

Local.Mouse.KeyDown:Connect(function(key)
    if key == _G.AimViewer_Settings.Keybind then
        if enabled then
            enabled = false
            player = nil
            game.StarterGui:SetCore("SendNotification", {
                Title = "Lock Detector Unlocked",
                Text = "",
                Duration = 0.5
            })
        elseif not enabled then
            player = getClosestPlayerToCursor()
            enabled = true
            game.StarterGui:SetCore("SendNotification", {
                Title = player.DisplayName,
                Text = player.Name,
                Duration = 0.5
            })
        end
    end
end)

Services.RunService.Stepped:Connect(function()
    if player and player.Character:FindFirstChildWhichIsA("Tool") and
        player.Character:FindFirstChildWhichIsA("Tool"):FindFirstChild("GunScript") and
        Services.Players:FindFirstChild(tostring(player)) and
        player.Character:FindFirstChild(_G.AimViewer_Settings.Part) then
        local distance = (player.Character[_G.AimViewer_Settings.Part].CFrame.Position -
                             player.Character.BodyEffects.MousePos.Value).Magnitude
        local mid = (player.Character[_G.AimViewer_Settings.Part].CFrame.Position +
                        player.Character.BodyEffects.MousePos.Value) / 2
        LockDetector.Size = Vector3.new(_G.AimViewer_Settings.Size[1], _G.AimViewer_Settings.Size[2], distance)
        LockDetector.CFrame = CFrame.lookAt(mid, player.Character.BodyEffects.MousePos.Value, Vector3.new(0, 1, 0))
        LockDetector.Material = _G.AimViewer_Settings.Material
        LockDetector.Color = _G.AimViewer_Settings.Color
        LockDetector.Transparency = _G.AimViewer_Settings.Transparency
    else
        LockDetector.Size = Vector3.new(0, 0, 0)
        LockDetector.CFrame = CFrame.new(0, 0, 0)
    end
end)
