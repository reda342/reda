-- Fonction pour contrôler le personnage d'un autre joueur
local function controlPlayer(character)
    if character and character:FindFirstChild("Humanoid") then
        character.HumanoidRootPart.Anchored = true
        character.Humanoid.PlatformStand = true
        print("Vous contrôlez maintenant le joueur :", character.Parent.Name)
    end
end

-- Fonction pour afficher un message pendant quelques secondes
local function showMessage(message, duration)
    local messageGui = Instance.new("ScreenGui")
    local messageText = Instance.new("TextLabel")

    messageGui.Name = "MessageGui"
    messageGui.Parent = game.Players.LocalPlayer.PlayerGui

    messageText.Name = "MessageText"
    messageText.Parent = messageGui
    messageText.BackgroundColor3 = Color3.new(0, 0, 0)
    messageText.BackgroundTransparency = 0.5
    messageText.BorderSizePixel = 0
    messageText.Position = UDim2.new(0.5, -150, 0.9, -50)
    messageText.Size = UDim2.new(0, 300, 0, 50)
    messageText.Font = Enum.Font.SourceSans
    messageText.TextColor3 = Color3.new(1, 1, 1)
    messageText.TextSize = 24
    messageText.Text = message

    wait(duration or 6)
    messageGui:Destroy()
end

-- Exemple d'utilisation pour contrôler un joueur
game.Players.LocalPlayer:GetMouse().Button1Down:Connect(function()
    local mouse = game.Players.LocalPlayer:GetMouse()
    local target = mouse.Target

    if target and target.Parent and target.Parent:IsA("Model") then
        local character = target.Parent
        if character and character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
            controlPlayer(character)
            showMessage("YOU ARE WHITELISTED. YOU CAN USE THE SCRIPT", 6)
        end
    end
end)
