local localPlayer = game.Players.LocalPlayer
local playerGui = localPlayer:WaitForChild("PlayerGui")

local function createHighlight(player)
    if player.Character and not player.Character:FindFirstChild("Highlight") then
        local highlight = Instance.new("Highlight")
        highlight.Adornee = player.Character
        highlight.FillColor = Color3.fromRGB(255, 100, 100)
        highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
        highlight.OutlineTransparency = 0
        highlight.FillTransparency = 0.5
        highlight.Enabled = true
        highlight.Parent = player.Character
    end
end

local function updateEsp()
    while true do
        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= localPlayer and player.Character and player.Character.PrimaryPart then
                createHighlight(player)
            end
        end
        wait(0.001)
    end
end

local function onPlayerAdded(player)
    player.CharacterAdded:Connect(function()
        createHighlight(player)
    end)
end

game.Players.PlayerAdded:Connect(onPlayerAdded)

for _, player in ipairs(game.Players:GetPlayers()) do
    if player ~= localPlayer then
        createHighlight(player)
    end
end

local function showText()
    wait(5)
    local hint = Instance.new("Hint")
    hint.Parent = workspace
    hint.Text = "Автор: BLACK SCRIPTS"
    delay(5, function()
        hint:Destroy()
    end)
end

showText()

updateEsp()
