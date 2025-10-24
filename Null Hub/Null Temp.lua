-- load these always first
local function load(loadobj)
    repeat task.wait() until loadobj
end

local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/aaaa"))()
local UI = lib:CreateWindow("Null Hub", "lop")
local Home = UI:addPage("Home", 1, true, 6)
local Misc = UI:addPage("Misc", 2, false, 6)
local AutoFarm = UI:addPage("AutoFarm", 3, false, 6)
local AutoQuest = UI:addPage("AutoQuest", 4, false, 6)
local Other = UI:addPage("Other", 5, false, 6)
local Settings = UI:addPage("Settings", 6, false, 6)

-- temp locals
local plrs = game:GetService('Players')
local plr = plrs.LocalPlayer
local char = plr.Character
local hum = char:FindFirstChild("Humanoid")
local camera = game:GetService("Workspace").CurrentCamera
local cameraDistance = 10
local isRunning = false
local distanceslider = 6
local isM1Enabled = false
local isM2Enabled = false
local m1Cooldown = 0.1 -- Default M1 cooldown
local m2Cooldown = 0.1 -- Default M2 cooldown
local connections = {}
local currentTarget = nil
local selectedEnemy = nil
local selectedPlayer = nil
local toggleKey = Enum.KeyCode.Insert
local lastTargetNotification = nil
local input = plr.Backpack:FindFirstChild('Input') or game.ReplicatedStorage:FindFirstChild('Input')
local m1 = {"m1", { shift = false, running = false, inair = false }}
local m2 = {"m2", { shift = false, running = false, inair = false }}
local STAFF_IDS = {
    633527, 41737073, 404567778, 10107856, 2049564194, 29272034,
    34521281, 40118429, 28885841, 3254, 10190020, 5254258,
}

-- functions
load(game:IsLoaded())
load(game.Players.LocalPlayer.Character)
load(plr.Character:FindFirstChild("Block"))

local function checkStaff(player)
    for _, staffId in pairs(STAFF_IDS) do
        if player.UserId == staffId then
            plr:Kick('STAFF detected: ' .. player.Name .. ' (' .. staffId .. ')')
            return true
        end
    end
    return false
end

local function notify(title, text, duration)
    pcall(function()
        game:GetService("StarterGui"):SetCore('SendNotification', {
            Title = title,
            Text = text,
            Duration = duration or 3,
        })
    end)
end

local function dist(v1, v2)
    return (v1 - v2).Magnitude
end

local function isValidEnemy(npc)
    if not npc or not npc.Parent then
        return false
    end
    local hum = npc:FindFirstChildOfClass('Humanoid')
    if not hum then
        return false
    end
    if hum.Health <= 0 then
        return false
    end
    if npc:FindFirstChild('Dead') or npc:FindFirstChild('Ragdoll') then
        return false
    end
    if selectedEnemy and npc.Name == selectedEnemy then
        return true
    end
    return false
end

local function getClosestEnemy()
    local closest, minDist = nil, math.huge
    pcall(function()
        if not workspace:FindFirstChild('Enemies') then
            return
        end
        for _, npc in ipairs(workspace.Enemies:GetChildren()) do
            if isValidEnemy(npc) then
                local root = npc:FindFirstChild('HumanoidRootPart')
                if root then
                    local distance = dist(
                        plr.Character.HumanoidRootPart.Position,
                        root.Position
                    )
                    if distance < minDist then
                        closest = npc
                        minDist = distance
                    end
                end
            end
        end
    end)
    return closest
end

-- Staff detection on player joining
plrs.PlayerAdded:Connect(function(player)
    task.wait(1)
    if checkStaff(player) then
        return
    end
end)

-- Check existing players
for _, player in pairs(plrs:GetPlayers()) do
    if player ~= plr then
        checkStaff(player)
    end
end

local enemyNamesSet = {}
local elist = {}
local enemyCache = {}
for _, obj in pairs(workspace.Enemies:GetChildren()) do
    if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
        local name = obj.Name
        if not enemyNamesSet[name] then
            enemyNamesSet[name] = true
            table.insert(elist, name)
        end
        if isValidEnemy(obj) and obj:FindFirstChild("HumanoidRootPart") then
            table.insert(enemyCache, obj)
        end
    end
end
table.sort(elist)

local function updateEnemyCache()
    enemyCache = {}
    for _, obj in pairs(workspace.Enemies:GetChildren()) do
        if isValidEnemy(obj) and obj:FindFirstChild("HumanoidRootPart") then
            table.insert(enemyCache, obj)
        end
    end
end

connections[#connections + 1] = workspace.Enemies.ChildAdded:Connect(function(child)
    if isValidEnemy(child) and child:FindFirstChild("HumanoidRootPart") then
        table.insert(enemyCache, child)
        local name = child.Name
        if not enemyNamesSet[name] then
            enemyNamesSet[name] = true
            table.insert(elist, name)
            table.sort(elist)
        end
    end
end)

connections[#connections + 1] = workspace.Enemies.ChildRemoved:Connect(function()
    updateEnemyCache()
end)


Home:addLabel("Current Time: " .. os.date('!%I:%M %p', os.time() + (2 * 3600)))

Home:addButton("Discord Server", function()
    setclipboard("https://discord.gg/nullhub")
    toclipboard("https://discord.gg/nullhub")
    notify('Succes!', 'Succesfully copied to clipboard', 3)
end)

Home:addToggle("This is a Toggle", function(value)
    print(value)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Toggle",
        Text = tostring(value),
    })
end)

Home:addSlider("This is a Slider", 16, 100, function(value)
    print(value)
end)

Home:addDropdown("This is a Dropdown", { "Um", "Yep", "Lop", "GG" }, 1, function(value)
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Selected :",
        Text = value,
    })
end)

Misc:addButton("DIE", function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
end)


-- Dropdown
local PLIST = {}
for _, v in pairs(plrs:GetPlayers()) do
    table.insert(PLIST, v.DisplayName)
end

Misc:addDropdown("Teleport to Player", PLIST, 4, function(value)
    for _, player in pairs(plrs:GetPlayers()) do
        if player.DisplayName == value and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 1)
            break
        end
    end
end)

-- AutoFarm Page
AutoFarm:addToggle("Toggle Autofarm", function(value)
    isRunning = value
    if value then
        camera.CameraType = Enum.CameraType.Scriptable
        spawn(function()
            local healthConnection = nil
            local deathTagConnection = nil
            local lastM1Time = 0
            local lastM2Time = 0
            local lastCameraCFrame = camera.CFrame -- Initialize to current camera CFrame
            while isRunning and char and char:FindFirstChild("HumanoidRootPart") and char.Humanoid.Health > 0 do
                task.wait(0.05)
                if not selectedEnemy then
                    notify("Null Error", "Select an enemy first")
                    isRunning = false
                    break
                end
                if not currentTarget or not currentTarget.Parent or not currentTarget:FindFirstChild("Humanoid") or not currentTarget:FindFirstChild("HumanoidRootPart") or currentTarget.Humanoid.Health == 0 then
                    if healthConnection then
                        healthConnection:Disconnect()
                        healthConnection = nil
                    end
                    if deathTagConnection then
                        deathTagConnection:Disconnect()
                        deathTagConnection = nil
                    end
                    currentTarget = getClosestEnemy()
                    if not currentTarget then
                        notify("Null Error", "No " .. selectedEnemy .. " found")
                        isRunning = false
                        break
                    end
                    healthConnection = currentTarget.Humanoid.HealthChanged:Connect(function(health)
                        if health <= 0 then
                            currentTarget = nil
                            updateEnemyCache()
                        end
                    end)
                    deathTagConnection = currentTarget.ChildAdded:Connect(function(child)
                        if child.Name == 'Dead' or child.Name == 'Ragdoll' then
                            currentTarget = nil
                            updateEnemyCache()
                        end
                    end)
                    notify("Null Hub", "Locked onto " .. selectedEnemy)
                end
                if currentTarget and currentTarget:FindFirstChild("HumanoidRootPart") then
                    local targetPos = currentTarget.HumanoidRootPart.Position
                    local cameraPos = char.HumanoidRootPart.Position + Vector3.new(0, 2, cameraDistance)
                    local newCameraCFrame = CFrame.new(cameraPos, targetPos)
                    camera.CFrame = lastCameraCFrame:Lerp(newCameraCFrame, 0.1)
                    lastCameraCFrame = camera.CFrame
                    
                    local offsetPos = (currentTarget.HumanoidRootPart.CFrame * CFrame.new(0, 0, distanceslider)).Position
                    char.HumanoidRootPart.CFrame = CFrame.lookAt(offsetPos, targetPos)
                    
                    if isM1Enabled and input and tick() - lastM1Time >= m1Cooldown then
                        pcall(function()
                            input:FireServer(unpack(m1))
                        end)
                        lastM1Time = tick()
                    end
                    if isM2Enabled and input and tick() - lastM2Time >= m2Cooldown then
                        pcall(function()
                            input:FireServer(unpack(m2))
                        end)
                        lastM2Time = tick()
                    end
                end
                updateEnemyCache()
            end
            if not isRunning then
                if healthConnection then
                    healthConnection:Disconnect()
                end
                if deathTagConnection then
                    deathTagConnection:Disconnect()
                end
                currentTarget = nil
                camera.CameraType = Enum.CameraType.Custom
                notify("AutoFarm", "Disabled")
            end
        end)
    else
        currentTarget = nil
        camera.CameraType = Enum.CameraType.Custom
        notify("AutoFarm", "Disabled")
        for _, conn in ipairs(connections) do
            conn:Disconnect()
        end
        connections = {}
    end
end)

AutoFarm:addDropdown("Show/Select Enemies", elist, 6, function(value)
    selectedEnemy = value
    currentTarget = nil
    notify("Selected", "Enemy: " .. value)
end)

AutoFarm:addButton("Refresh Enemies", function()
    enemyNamesSet = {}
    elist = {}
    updateEnemyCache()
    for _, obj in pairs(workspace.Enemies:GetChildren()) do
        if obj:IsA("Model") and obj:FindFirstChild("Humanoid") then
            local name = obj.Name
            if not enemyNamesSet[name] then
                enemyNamesSet[name] = true
                table.insert(elist, name)
            end
        end
    end
    table.sort(elist)
    notify("Refreshed", "Enemy list updated (restart script to update dropdown)")
end)

AutoFarm:addLabel("AutoFarm Settings", "Self explanatory")

AutoFarm:addToggle("Toggle M1", function(value)
    isM1Enabled = value
    notify("Auto M1", value and "Enabled" or "Disabled")
    if value and not input then
        notify("Error", "Input RemoteEvent not found")
        isM1Enabled = false
    end
end)

AutoFarm:addToggle("Toggle M2", function(value)
    isM2Enabled = value
    notify("Auto M2", value and "Enabled" or "Disabled")
    if value and not input then
        notify("Error", "Input RemoteEvent not found")
        isM2Enabled = false
    end
end)

AutoFarm:addSlider("AutoFarm Distance", 1, 20, function(value)
    distanceslider = value
    notify("Distance", "Set to " .. value .. " studs")
end)

AutoFarm:addSlider("Camera Distance", 5, 20, function(value)
    cameraDistance = value
    notify("Camera Distance", "Set to " .. value .. " studs")
end)

AutoFarm:addSlider("M1 Cooldown (seconds)", 0.1, 2, function(value)
    m1Cooldown = value
    notify("M1 Cooldown", "Set to " .. value .. " seconds")
end)

AutoFarm:addSlider("M2 Cooldown (seconds)", 0.1, 2, function(value)
    m2Cooldown = value
    notify("M2 Cooldown", "Set to " .. value .. " seconds")
end)
