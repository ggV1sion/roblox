game:GetService("Players").LocalPlayer.Idled:connect(function()
    game:GetService("VirtualInputManager"):Button2Down(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
    wait(1)
    game:GetService("VirtualInputManager"):Button2Up(Vector2.new(0, 0), Workspace.CurrentCamera.CFrame)
end)
