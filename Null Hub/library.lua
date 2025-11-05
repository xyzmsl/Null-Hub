local Library = {}
Library.__index = Library

-- Prevent duplicates
local old = game.CoreGui:FindFirstChild("fu8rj82n")
if old then old:Destroy() end

--// Main GUI Setup
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
ScreenGui.Name = "fu8rj82n"
ScreenGui.ResetOnSpawn = false

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 400, 0, 300)
MainFrame.Position = UDim2.new(0.5, -200, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0

-- UICorner
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 8)

-- Title bar
local TitleBar = Instance.new("TextLabel")
TitleBar.Parent = MainFrame
TitleBar.Size = UDim2.new(1, 0, 0, 30)
TitleBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TitleBar.Text = "⚙️  Custom UI Library"
TitleBar.TextColor3 = Color3.new(1, 1, 1)
TitleBar.TextSize = 16
TitleBar.Font = Enum.Font.SourceSansBold
TitleBar.BorderSizePixel = 0

-- Main scrolling container
local Container = Instance.new("ScrollingFrame", MainFrame)
Container.Position = UDim2.new(0, 0, 0, 30)
Container.Size = UDim2.new(1, 0, 1, -30)
Container.BackgroundTransparency = 1
Container.CanvasSize = UDim2.new(0, 0, 0, 0)
Container.ScrollBarThickness = 2

local UIListLayout = Instance.new("UIListLayout", Container)
UIListLayout.Padding = UDim.new(0, 6)
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Auto-update CanvasSize
UIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
	Container.CanvasSize = UDim2.new(0, 0, 0, UIListLayout.AbsoluteContentSize.Y + 10)
end)

--// DROPDOWN FUNCTION
function Library:addDropdown(options)
	local Title = options.title or "Dropdown"
	local Items = options.items or {}
	local Callback = options.callback or function() end

	local DropdownFrame = Instance.new("Frame", Container)
	DropdownFrame.Size = UDim2.new(1, -10, 0, 35)
	DropdownFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
	DropdownFrame.BorderSizePixel = 0
	DropdownFrame.Position = UDim2.new(0, 5, 0, 0)
	DropdownFrame.ClipsDescendants = true

	local UICorner = Instance.new("UICorner", DropdownFrame)
	UICorner.CornerRadius = UDim.new(0, 6)

	local DropdownButton = Instance.new("TextButton", DropdownFrame)
	DropdownButton.Size = UDim2.new(1, 0, 0, 35)
	DropdownButton.BackgroundTransparency = 1
	DropdownButton.Text = Title .. " ▼"
	DropdownButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	DropdownButton.TextSize = 15
	DropdownButton.Font = Enum.Font.SourceSansBold

	local OptionContainer = Instance.new("ScrollingFrame", DropdownFrame)
	OptionContainer.Position = UDim2.new(0, 0, 0, 35)
	OptionContainer.Size = UDim2.new(1, 0, 0, 0)
	OptionContainer.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	OptionContainer.BorderSizePixel = 0
	OptionContainer.ScrollBarThickness = 2
	OptionContainer.Visible = false
	OptionContainer.AutomaticCanvasSize = Enum.AutomaticSize.Y

	local OptionLayout = Instance.new("UIListLayout", OptionContainer)
	OptionLayout.Padding = UDim.new(0, 2)
	OptionLayout.SortOrder = Enum.SortOrder.LayoutOrder

	for _, v in ipairs(Items) do
		local OptionButton = Instance.new("TextButton", OptionContainer)
		OptionButton.Size = UDim2.new(1, 0, 0, 25)
		OptionButton.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
		OptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		OptionButton.TextSize = 14
		OptionButton.Font = Enum.Font.SourceSans
		OptionButton.Text = tostring(v)

		OptionButton.MouseButton1Down:Connect(function()
			Callback(v)
			DropdownButton.Text = Title .. ": " .. tostring(v)
			game:GetService("TweenService"):Create(DropdownFrame, TweenInfo.new(0.25), {Size = UDim2.new(1, -10, 0, 35)}):Play()
			OptionContainer.Visible = false
			DropdownButton.Text = Title .. " ▼"
		end)
	end

	local open = false
	DropdownButton.MouseButton1Down:Connect(function()
		open = not open
		if open then
			OptionContainer.Visible = true
			game:GetService("TweenService"):Create(DropdownFrame, TweenInfo.new(0.25), {Size = UDim2.new(1, -10, 0, (#Items * 27) + 40)}):Play()
			DropdownButton.Text = Title .. " ▲"
		else
			game:GetService("TweenService"):Create(DropdownFrame, TweenInfo.new(0.25), {Size = UDim2.new(1, -10, 0, 35)}):Play()
			task.wait(0.25)
			OptionContainer.Visible = false
			DropdownButton.Text = Title .. " ▼"
		end
	end)
end

--// DEMO DROPDOWN
Library:addDropdown({
	title = "Select Fruit",
	items = {"Apple", "Banana", "Cherry", "Dragonfruit", "Grape"},
	callback = function(item)
		print("Selected:", item)
	end
})

return Library
