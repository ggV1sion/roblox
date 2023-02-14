_G.TrashTalk_Settings = {
    Keybind = "m",
    Texts = {"focus", "you're terrible", "cold"}
}

local Services = {
    Players = game:GetService("Players"),
    ReplicatedStorage = game:GetService("ReplicatedStorage")
}

local Local = {
    Mouse = Services.Players.LocalPlayer:GetMouse()
}

Local.Mouse.KeyDown:Connect(function(key)
    if key == string.lower(_G.TrashTalk_Settings.Keybind) then
        Services.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
            _G.TrashTalk_Settings.Texts[math.random(1, #_G.TrashTalk_Settings.Texts)], "All")
    end
end)
