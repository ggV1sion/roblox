game["Loaded"]:Wait()
local Players = game:GetService("Players")
local LP = Players["LocalPlayer"]
while not LP do
    Players["ChildAdded"]:Wait()
    LP = Players["LocalPlayer"]
end
local Char = LP["Character"]
while not Char do
    LP["CharacterAdded"]:Wait()
    Char = LP["Character"]
end
repeat
    wait()
until game:GetService("Players").LocalPlayer.Character:WaitForChild("FULLY_LOADED_CHAR")

wait(2.5) 

local Services = {
    Players = game:GetService("Players"),
    RunService = game:GetService("RunService"),
    Workspace = game:GetService("Workspace"),
    TeleportService = game:GetService("TeleportService")
}

local Local = {
    Player = Services.Players.LocalPlayer,
    Character = Services.Players.LocalPlayer.Character,
    Id = Services.Players.LocalPlayer.UserId,
    Backpack = Services.Players.LocalPlayer.Backpack
}

for i, v in pairs(Local.Character:GetChildren()) do
    if v.ClassName == "Script" and v.Name ~= "Health" and v.Name ~= "Animate" then
        v.LocalScript:Destroy()
    end
end

local r = {"BreathingHAMON", "TeleportDetect", "JJARC", "TakePoisonDamage", "CHECKER_1", "CHECKER", "GUI_CHECK",
           "OneMoreTime", "checkingSPEED", "BANREMOTE", "PERMAIDBAN", "KICKREMOTE", "BR_KICKPC", "FORCEFIELD",
           "Christmas_Sock", "VirusCough", "Symbiote", "Symbioted"}
local n;
n = hookmetamethod(game, "__namecall", function(...)
    local a = {...}
    if table.find(r, a[2]) then
        return
    end
    return n(table.unpack(a))
end)

game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
    if child.Name == 'ErrorPrompt' and child:FindFirstChild('MessageArea') and
        child.MessageArea:FindFirstChild("ErrorFrame") then
            local x =
        "loadstring(game:HttpGet('https://raw.githubusercontent.com/luatruth/roblox/main/games/BlaqHood/killall.lua'))()"
    syn.queue_on_teleport(x)
    Services.TeleportService:Teleport(game.PlaceId, Local.Player)
    end
end)

Local.Character.HumanoidRootPart.CFrame = CFrame.new(999999, 999999, 999999)
local HumClone = Local.Player.Character.Humanoid:Clone()
HumClone.Parent = Local.Player.Character
HumClone:ChangeState(15)
Local.Player.Character.Humanoid:Destroy()

local tool
coroutine.resume(coroutine.create(function()
    for i, v in pairs(game:GetService("Players"):GetPlayers()) do
        if not string.find(v.Name, 'dropper_') and not string.find(v.Name, 'ImAnBigApple') then
            tool = Local.Backpack:FindFirstChildWhichIsA("Tool")
            tool.Parent = Local.Character
            firetouchinterest(tool.Handle, v.Character['Head'], 0)
        end
    end
end))

wait(.3)

if Local.Character then
    Local.Character:BreakJoints()
end
for i, v in pairs(Local.Character:GetChildren()) do
    if v:IsA("BasePart") then
        v:Destroy()
    elseif v:IsA("Accessory") then
        v:Destroy()
    end
end
