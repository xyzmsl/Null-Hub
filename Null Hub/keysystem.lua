-- Work.ink Key Validator with GUI, Get Key Button, and Key Persistence
-- Replace 'YOUR_LINK_ID' with your actual work.ink link ID (e.g., if link is work.ink/abc, ID is 'abc')
-- Replace 'YOUR_MAIN_SCRIPT_URL' with the URL to your main script (e.g., Pastebin raw or GitHub raw)

local linkId = "276J/gkh4ycya"  -- From your work.ink key generation link
local workInkUrl = "https://work.ink/" .. linkId  -- Full URL for Get Key button
local mainScriptUrl = "https://raw.githubusercontent.com/xyzmsl/Null-Hub/refs/heads/main/Null%20Hub/Null%20Temp.lua"  -- URL to your main Roblox script
local keyFileName = "nullhubkey.txt"  -- File to store the key
local HttpService = game:GetService("HttpService")  -- For official scripts; use syn.request for exploits
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Function to validate key via work.ink API
local function validateKey(key)
    local apiUrl = "https://work.ink/_api/v2/token/isValid/" .. key  -- Removed ?deleteToken=1 for reusable keys
    local success, response = pcall(function()
        return HttpService:GetAsync(apiUrl)  -- Or syn.request({Url = apiUrl, Method = "GET"}).Body for exploits
    end)
    
    if success then
        local data = HttpService:JSONDecode(response)
        return data.valid  -- True if valid
    end
    return false
end

-- Function to save key to file
local function saveKey(key)
    pcall(function()
        writefile(keyFileName, key)  -- Save key to file
    end)
end

-- Function to load key from file
local function loadKey()
    local success, key = pcall(function()
        return readfile(keyFileName)  -- Read key from file
    end)
    return success and key or nil
end

-- Function to delete stored key
local function deleteKey()
    pcall(function()
        delfile(keyFileName)  -- Delete key file
    end)
end

-- Function to open URL (executor-specific)
local function openUrl(url)
    -- Synapse
    if syn and syn.open_url then
        syn.open_url(url)
    -- KRNL
    elseif krnl and krnl.openurl then
        krnl.openurl(url)
    -- Script-Ware
    elseif openurl then
        openurl(url)
    -- Other executors
    else
        warn("Your executor does not support opening URLs. Please manually visit: " .. url)
    end
end

-- Function to load main script
local function loadMainScript()
    local success, result = pcall(function()
        loadstring(game:HttpGet(mainScriptUrl))()
    end)
    if not success then
        warn("Failed to load main script: " .. result)
    end
end

-- Create GUI
local function createGui()
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "KeyInputGui"
    ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.ResetOnSpawn = false

    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(0, 300, 0, 240)
    Frame.Position = UDim2.new(0.5, -150, 0.5, -120)  -- Center on screen
    Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)  -- Dark background
    Frame.BorderSizePixel = 0
    Frame.Parent = ScreenGui

    local TitleLabel = Instance.new("TextLabel")
    TitleLabel.Size = UDim2.new(1, 0, 0, 40)
    TitleLabel.Position = UDim2.new(0, 0, 0, 10)
    TitleLabel.BackgroundTransparency = 1
    TitleLabel.Text = "Enter Work.ink Key"
    TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    TitleLabel.TextSize = 20
    TitleLabel.Font = Enum.Font.SourceSansBold
    TitleLabel.Parent = Frame

    local KeyInput = Instance.new("TextBox")
    KeyInput.Size = UDim2.new(0.9, 0, 0, 40)
    KeyInput.Position = UDim2.new(0.05, 0, 0, 60)
    KeyInput.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
    KeyInput.PlaceholderText = "Paste your key here"
    KeyInput.Text = ""
    KeyInput.TextSize = 16
    KeyInput.Font = Enum.Font.SourceSans
    KeyInput.Parent = Frame

    local SubmitButton = Instance.new("TextButton")
    SubmitButton.Size = UDim2.new(0.4, 0, 0, 40)
    SubmitButton.Position = UDim2.new(0.05, 0, 0, 110)
    SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 120, 215)  -- Blue button
    SubmitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    SubmitButton.Text = "Submit"
    SubmitButton.TextSize = 16
    SubmitButton.Font = Enum.Font.SourceSansBold
    SubmitButton.Parent = Frame

    local GetKeyButton = Instance.new("TextButton")
    GetKeyButton.Size = UDim2.new(0.4, 0, 0, 40)
    GetKeyButton.Position = UDim2.new(0.55, 0, 0, 110)
    GetKeyButton.BackgroundColor3 = Color3.fromRGB(0, 180, 0)  -- Green button
    GetKeyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    GetKeyButton.Text = "Get Key"
    GetKeyButton.TextSize = 16
    GetKeyButton.Font = Enum.Font.SourceSansBold
    GetKeyButton.Parent = Frame

    local FeedbackLabel = Instance.new("TextLabel")
    FeedbackLabel.Size = UDim2.new(0.9, 0, 0, 50)
    FeedbackLabel.Position = UDim2.new(0.05, 0, 0, 160)
    FeedbackLabel.BackgroundTransparency = 1
    FeedbackLabel.Text = ""
    FeedbackLabel.TextColor3 = Color3.fromRGB(255, 100, 100)  -- Red for errors
    FeedbackLabel.TextSize = 14
    FeedbackLabel.Font = Enum.Font.SourceSans
    FeedbackLabel.TextWrapped = true
    FeedbackLabel.Parent = Frame

    -- Add corner rounding for aesthetics
    local UICorner = Instance.new("UICorner")
    UICorner.CornerRadius = UDim.new(0, 8)
    UICorner.Parent = Frame
    UICorner:Clone().Parent = KeyInput
    UICorner:Clone().Parent = SubmitButton
    UICorner:Clone().Parent = GetKeyButton

    -- Submit button logic
    SubmitButton.MouseButton1Click:Connect(function()
        local key = KeyInput.Text:gsub("%s+", ""):lower()  -- Trim spaces and lowercase
        if key == "" then
            FeedbackLabel.Text = "Please enter a key!"
            return
        end

        FeedbackLabel.Text = "Validating key..."
        FeedbackLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White while checking

        if validateKey(key) then
            FeedbackLabel.Text = "Key valid! Loading script..."
            FeedbackLabel.TextColor3 = Color3.fromRGB(100, 255, 100)  -- Green for success
            saveKey(key)  -- Save key to file
            ScreenGui:Destroy()  -- Remove GUI
            loadMainScript()  -- Load main script
        else
            FeedbackLabel.Text = "Key invalid or expired! Click 'Get Key' to get a new one."
            FeedbackLabel.TextColor3 = Color3.fromRGB(255, 100, 100)  -- Red for error
            deleteKey()  -- Delete invalid/expired key
        end
    end)

    -- Get Key button logic
    GetKeyButton.MouseButton1Click:Connect(function()
        FeedbackLabel.Text = "Opening work.ink to get your key..."
        FeedbackLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White for action
        openUrl(workInkUrl)
    end)
end

-- Check for stored key on startup
local storedKey = loadKey()
if storedKey and validateKey(storedKey) then
    -- Key exists and is valid; load main script directly
    loadMainScript()
else
    -- No key or invalid/expired key; show GUI
    deleteKey()  -- Clear invalid/expired key
    createGui()
end
