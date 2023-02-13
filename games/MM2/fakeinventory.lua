_G.Settings = {
    WeaponOwnRange = {1, 2}
}

local newOwned = {}
for i, v in next, getrenv()._G.Database.Item do
    newOwned[i] = math.random(_G.Settings.WeaponOwnRange[1], _G.Settings.WeaponOwnRange[2])
end

local PlayerWeapons = getrenv()._G.PlayerData.Weapons

game:GetService("RunService"):BindToRenderStep("InventoryUpdate", 0, function()
    PlayerWeapons.Owned = newOwned
end)

game.Players.LocalPlayer.Character.Humanoid.Health = 0
