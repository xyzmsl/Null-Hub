-- don't judge :rage:
local function DestroyYep()
    for x = 1,69 do 
        if game.CoreGui:FindFirstChild("fu8rj82n") then game.CoreGui:FindFirstChild("fu8rj82n"):Destroy() end
    end
end

DestroyYep()

wait(0.069)

local Library = {}

function Library:CreateWindow(windowname,windowinfo)
    local fu8rj82n = Instance.new("ScreenGui")
    local Frame = Instance.new("Frame")
    local FrameCorner = Instance.new("UICorner")
    local FrameGradient = Instance.new("UIGradient")
    local DashBoard = Instance.new("Frame")
    local DashBoardCorner = Instance.new("UICorner")
    local DashBoardGradient = Instance.new("UIGradient")
    local TabContainer = Instance.new("Frame")
    local TabContainer_2 = Instance.new("UIListLayout")
    local PageContainer = Instance.new("Frame")
    local PageContainerCorner = Instance.new("UICorner")
    local PageContainerGradient = Instance.new("UIGradient")
    local PageFolder = Instance.new("Folder")
    local Title = Instance.new("TextLabel")
    local Yep = Instance.new("TextButton")
    local Cre = Instance.new("ImageLabel")
    local YepTitle = Instance.new("TextLabel")
    local YepCorner = Instance.new("UICorner")

    fu8rj82n.Name = "fu8rj82n"
    fu8rj82n.Parent = game.CoreGui
    fu8rj82n.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    fu8rj82n.ResetOnSpawn = false
    
    fu8rj82n.IgnoreGuiInset = true
    local cursor = Instance.new("ImageLabel")
    cursor.Name = "CustomCursor"
    cursor.Parent = fu8rj82n
    cursor.BackgroundTransparency = 1
    cursor.Size = UDim2.new(0, 32, 0, 32)
    cursor.Image = "rbxassetid://3421415816"  -- default Roblox cursor
    cursor.ZIndex = 9999
    game:GetService("RunService").RenderStepped:Connect(function()
        local mouse = game.Players.LocalPlayer:GetMouse()
        cursor.Position = UDim2.new(0, mouse.X - 8, 0, mouse.Y - 8)
    end)
    
-- Outer Frame (Opaque black)
    local Frame = Instance.new("Frame")
    Frame.Parent = fu8rj82n
    Frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Frame.BackgroundTransparency = 0  -- fully opaque outer frame
    Frame.BorderSizePixel = 0
    Frame.Position = UDim2.new(0.289808273, 0, 0.313227266, 0)
    Frame.Size = UDim2.new(0, 520, 0, 340)

-- Rounded corners
    local FrameCorner = Instance.new("UICorner")
    FrameCorner.CornerRadius = UDim.new(0, 12)
    FrameCorner.Parent = Frame

-- Outer gradient
    local FrameGradient = Instance.new("UIGradient")
    FrameGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(60, 20, 100)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(140, 80, 200))
}
    FrameGradient.Rotation = 90
    FrameGradient.Transparency = NumberSequence.new{
    NumberSequenceKeypoint.new(0, 0),
    NumberSequenceKeypoint.new(0.5, 0.8),
    NumberSequenceKeypoint.new(1, 0)
}  -- fades toward the center
   FrameGradient.Parent = Frame

-- Inner transparent frame (for content)
    local InnerFrame = Instance.new("Frame")
    InnerFrame.Parent = Frame
    InnerFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    InnerFrame.BackgroundTransparency = 1  -- fully transparent center
    InnerFrame.BorderSizePixel = 0
    InnerFrame.Size = UDim2.new(1, -20, 1, -20)  -- padding from edges
    InnerFrame.Position = UDim2.new(0, 10, 0, 10)
    
    DashBoard.Name = "DashBoard"
    DashBoard.Parent = Frame
    DashBoard.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    DashBoard.BackgroundTransparency = 0.35 
    DashBoard.BorderColor3 = Color3.fromRGB(15, 15, 15)
    DashBoard.Position = UDim2.new(0.0185185205, 0, 0.16842106, 0)
    DashBoard.Size = UDim2.new(0, 140, 0, 270)  -- WIDER TABS
    
    DashBoardCorner.CornerRadius = UDim.new(0, 8)
    DashBoardCorner.Name = "DashBoardCorner"
    DashBoardCorner.Parent = DashBoard

    DashBoardGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 15, 75)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 60, 160))
    }
    DashBoardGradient.Rotation = 90
    DashBoardGradient.Parent = DashBoard
    
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = DashBoard
    TabContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    TabContainer.BackgroundTransparency = 1.000
    TabContainer.BorderColor3 = Color3.fromRGB(15, 15, 15)
    TabContainer.BorderSizePixel = 0
    TabContainer.Position = UDim2.new(0.0280373823, 0, 0.0391304344, 0)
    TabContainer.Size = UDim2.new(0, 132, 0, 260)
    
    TabContainer_2.Name = "TabContainer"
    TabContainer_2.Parent = TabContainer
    TabContainer_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
    TabContainer_2.SortOrder = Enum.SortOrder.LayoutOrder
    TabContainer_2.Padding = UDim.new(0, 12)

    PageContainer.Name = "PageContainer"
    PageContainer.Parent = Frame
    PageContainer.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    PageContainer.BackgroundTransparency = 0.35 
    PageContainer.BorderColor3 = Color3.fromRGB(15, 15, 15)
    PageContainer.Position = UDim2.new(0.282407403, 0, 0.16842106, 0)
    PageContainer.Size = UDim2.new(0, 360, 0, 270) 
    
    PageContainerCorner.CornerRadius = UDim.new(0, 8)
    PageContainerCorner.Name = "PageContainerCorner"
    PageContainerCorner.Parent = PageContainer

    PageContainerGradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 15, 75)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(110, 60, 160))
    }
    PageContainerGradient.Rotation = 90
    PageContainerGradient.Parent = PageContainer
    
    PageFolder.Name = "PageFolder"
    PageFolder.Parent = PageContainer

    Title.Name = "Title"
    Title.Parent = Frame
    Title.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Title.BackgroundTransparency = 1.000
    Title.BorderColor3 = Color3.fromRGB(20, 20, 20)
    Title.BorderSizePixel = 0
    Title.Position = UDim2.new(0.0428240746, 0, 0.028070176, 0)
    Title.Size = UDim2.new(0, 400, 0, 40)
    Title.Font = Enum.Font.GothamSemibold
    Title.Text = windowname
    Title.TextColor3 = Color3.fromRGB(160, 60, 220)
    Title.TextSize = 16.000
    Title.TextXAlignment = Enum.TextXAlignment.Left

    Yep.Name = "Yep"
    Yep.Parent = Frame
    Yep.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Yep.BackgroundTransparency = 1.000
    Yep.BorderColor3 = Color3.fromRGB(20, 20, 20)
    Yep.BorderSizePixel = 0
    Yep.Position = UDim2.new(0.88499999, 0, 0.0495263338, 0)
    Yep.Size = UDim2.new(0, 45, 0, 26)
    Yep.AutoButtonColor = false
    Yep.Font = Enum.Font.SourceSans
    Yep.Text = ""
    Yep.TextColor3 = Color3.fromRGB(0, 0, 0)
    Yep.TextSize = 14.000
    
    Cre.Name = "Cre"
    Cre.Parent = Yep
    Cre.BackgroundTransparency = 1.000
    Cre.Size = UDim2.new(0, 45, 0, 25)
    Cre.Image = "rbxassetid://4384401360"
    Cre.ScaleType = Enum.ScaleType.Fit
    
    YepTitle.Name = "YepTitle"
    YepTitle.Parent = Yep
    YepTitle.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    YepTitle.BackgroundTransparency = 1.000
    YepTitle.BorderColor3 = Color3.fromRGB(20, 20, 20)
    YepTitle.BorderSizePixel = 0
    YepTitle.Position = UDim2.new(1.57894742, 0, -0.318181813, 0)
    YepTitle.Size = UDim2.new(0, 160, 0, 40)
    YepTitle.Font = Enum.Font.GothamSemibold
    YepTitle.Text = windowinfo or "UI Made by reetscheetje.null"
    YepTitle.TextColor3 = Color3.fromRGB(160, 60, 220)  -- Darker purple
    YepTitle.TextSize = 10.000
    YepTitle.TextTransparency = 1.000
    YepCorner.Name = "YepCorner"
    YepCorner.Parent = YepTitle

    Cre.MouseEnter:Connect(function()
		YepTitle.BackgroundTransparency = 0.8
		YepTitle.TextTransparency = 0.5
		wait(0.05)
		YepTitle.BackgroundTransparency = 0.5
		YepTitle.TextTransparency = 0.3
		Cre.ImageColor3 = Color3.fromRGB(137, 246, 255)
		wait(0.05)
		YepTitle.BackgroundTransparency = 0
		YepTitle.TextTransparency = 0
	end)
	
	Cre.MouseLeave:Connect(function()
		YepTitle.BackgroundTransparency = 0.5
		YepTitle.TextTransparency = 0.3
		wait(0.05)
		YepTitle.BackgroundTransparency = 0.8
		YepTitle.TextTransparency = 0.5
		Cre.ImageColor3 = Color3.fromRGB(255,255,255)
		wait(0.05)
		YepTitle.BackgroundTransparency = 1
		YepTitle.TextTransparency = 1
	end)
    

    local UserInputService = game:GetService("UserInputService")
	
	local gui = Frame
	
	local dragging
	local dragInput
	local dragStart
	local startPos
	
	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
    end)

    local PageYep = {}

    function PageYep:addPage(pagename,scrollsize,visible,elementspacing)
        local Tab = Instance.new("TextButton")
        local TabCorner = Instance.new("UICorner")
        local Home = Instance.new("ScrollingFrame")
        local PageLayout = Instance.new("UIListLayout")
        
        Tab.Name = "Tab"
        Tab.Parent = TabContainer
        Tab.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Tab.BackgroundTransparency = 0
        Tab.BorderColor3 = Color3.fromRGB(15, 15, 15)
        Tab.Position = UDim2.new(-0.0250000004, 0, 0, 0)
        Tab.Size = UDim2.new(0, 130, 0, 32)
        Tab.AutoButtonColor = false
        Tab.Font = Enum.Font.GothamSemibold
        Tab.Text = pagename or "nil"
        Tab.TextColor3 = Color3.fromRGB(160, 60, 220)
        Tab.TextSize = 13.000
        Tab.TextTransparency = 0.300
        
        TabCorner.CornerRadius = UDim.new(0, 8)
        TabCorner.Name = "TabCorner"
        TabCorner.Parent = Tab

        Home.Name = "Page"
        Home.Parent = PageFolder
        Home.Active = true
        Home.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        Home.BackgroundTransparency = 1.000
        Home.BorderColor3 = Color3.fromRGB(15, 15, 15)
        Home.BorderSizePixel = 0
        Home.Position = UDim2.new(0, 0, 0.0391303785, 0)
        Home.Size = UDim2.new(0, 358, 0, 250)
        Home.ScrollBarThickness = 2 
        Home.ScrollBarImageColor3 = Color3.fromRGB(5,5,5)
        Home.CanvasSize = UDim2.new(0,0,scrollsize,0) or UDim2.new(0,0,5,0)
        Home.Visible = visible or false
        Home.ScrollingEnabled = true
        Home.ScrollVelocity = Vector2.new(0, 40) 
        Home.ScrollingDirection = Enum.ScrollingDirection.Y

        PageLayout.Name = "PageLayout"
        PageLayout.Parent = Home
        PageLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, elementspacing or 10) 

        Tab.MouseButton1Down:Connect(function()
            Tab.TextSize = 11 
            for i,v in pairs(PageFolder:GetChildren()) do 
                v.Visible = false
            end
            wait(0.02)
            Home.Visible = true
            Tab.TextTransparency = 0
            Tab.TextSize = 13
            for i,v in pairs(TabContainer:GetChildren()) do 
                if v:IsA("GuiButton") and v ~= Tab then 
                    v.TextTransparency = 0.3
                end
            end
        end)

        if visible == true then 
            Tab.TextTransparency = 0
            for i,v in pairs(PageFolder:GetChildren()) do 
                if v:IsA("Frame") and v ~= Home then 
                    v.Visible = false
                end
            end
        else
            Tab.TextTransparency = 0.3
        end
        
        Tab.MouseEnter:Connect(function()
            Tab.BackgroundColor3 = Color3.fromRGB(10,10,10)
        end)
        
        Tab.MouseLeave:Connect(function()
            Tab.BackgroundColor3 = Color3.fromRGB(15,15,15)
        end)

        local PageElements = {}

        function PageElements:addLabel(labelname,labelinfo)
            local LabelHolder = Instance.new("Frame")
            local LabelHolderCorner = Instance.new("UICorner")
            local LabelTitle = Instance.new("TextLabel")
            local LabelInfo = Instance.new("TextLabel")

            LabelHolder.Name = "LabelHolder"
            LabelHolder.Parent = Home
            LabelHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            LabelHolder.BackgroundTransparency = 0 
            LabelHolder.BorderColor3 = Color3.fromRGB(17, 17, 17)
            LabelHolder.BorderSizePixel = 0
            LabelHolder.Position = UDim2.new(0.0167785231, 0, 0, 0)
            LabelHolder.Size = UDim2.new(0, 345, 0, 32) 
            
            LabelHolderCorner.CornerRadius = UDim.new(0, 6)
            LabelHolderCorner.Name = "LabelHolderCorner"
            LabelHolderCorner.Parent = LabelHolder
            
            LabelTitle.Name = "LabelTitle"
            LabelTitle.Parent = LabelHolder
            LabelTitle.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            LabelTitle.BackgroundTransparency = 1.000
            LabelTitle.BorderColor3 = Color3.fromRGB(17, 17, 17)
            LabelTitle.BorderSizePixel = 0
            LabelTitle.Size = UDim2.new(0, 345, 0, 18)
            LabelTitle.Font = Enum.Font.GothamSemibold
            LabelTitle.Text = labelname or ""
            LabelTitle.TextColor3 = Color3.fromRGB(160, 60, 220) 
            LabelTitle.TextSize = 13.000 
            
            LabelInfo.Name = "LabelInfo"
            LabelInfo.Parent = LabelHolder
            LabelInfo.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            LabelInfo.BackgroundTransparency = 1.000
            LabelInfo.BorderColor3 = Color3.fromRGB(17, 17, 17)
            LabelInfo.BorderSizePixel = 0
            LabelInfo.Position = UDim2.new(0, 0, 0.62, 0)
            LabelInfo.Size = UDim2.new(0, 345, 0, 11)
            LabelInfo.Font = Enum.Font.GothamSemibold
            LabelInfo.Text = labelinfo or ""
            LabelInfo.TextColor3 = Color3.fromRGB(160, 60, 220) 
            LabelInfo.TextSize = 10.000
            LabelInfo.TextTransparency = 0.300
        end

        function PageElements:addButton(buttonname,callback)
            local ButtonHolder = Instance.new("Frame")
            local Button = Instance.new("TextButton")
            local ButtonCorner = Instance.new("UICorner")
            local ButtonHolderCorner = Instance.new("UICorner")

            local callback = callback or function () end

            ButtonHolder.Name = "ButtonHolder"
            ButtonHolder.Parent = Home
            ButtonHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ButtonHolder.BackgroundTransparency = 0 
            ButtonHolder.BorderColor3 = Color3.fromRGB(17, 17, 17)
            ButtonHolder.BorderSizePixel = 0
            ButtonHolder.Position = UDim2.new(0.0167785231, 0, 0, 0)
            ButtonHolder.Size = UDim2.new(0, 345, 0, 32)
            
            Button.Name = "Button"
            Button.Parent = ButtonHolder
            Button.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            Button.BackgroundTransparency = 1.000
            Button.BorderColor3 = Color3.fromRGB(17, 17, 17)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 345, 0, 32)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.GothamSemibold
            Button.Text = buttonname
            Button.TextColor3 = Color3.fromRGB(160, 60, 220) 
            Button.TextSize = 13.000
            
            ButtonCorner.CornerRadius = UDim.new(0, 6)
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.Parent = Button
            
            ButtonHolderCorner.CornerRadius = UDim.new(0, 6)
            ButtonHolderCorner.Name = "ButtonHolderCorner"
            ButtonHolderCorner.Parent = ButtonHolder

            Button.MouseButton1Down:Connect(function()
                Button.TextSize = 11
                wait(0.1)
                Button.TextSize = 13
                pcall(callback)
            end)
        end

        function PageElements:addToggle(togglename,callback)
            local ToggleHolder = Instance.new("Frame")
            local ToggleHolderCorner = Instance.new("UICorner")
            local ToggleTitle = Instance.new("TextLabel")
            local ToggleButton = Instance.new("TextButton")
            local ToggleFrame = Instance.new("Frame")
            local ToggleFrameCorner = Instance.new("UICorner")
            local ToggleBall = Instance.new("Frame")
            local ToggleBallCorner = Instance.new("UICorner")

            local callback = callback or function() end
            local ToggleEnabled = false

            ToggleHolder.Name = "ToggleHolder"
            ToggleHolder.Parent = Home
            ToggleHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ToggleHolder.BackgroundTransparency = 0 
            ToggleHolder.BorderColor3 = Color3.fromRGB(17, 17, 17)
            ToggleHolder.BorderSizePixel = 0
            ToggleHolder.Position = UDim2.new(0.0167785231, 0, 0, 0)
            ToggleHolder.Size = UDim2.new(0, 345, 0, 32)
            
            ToggleHolderCorner.CornerRadius = UDim.new(0, 6)
            ToggleHolderCorner.Name = "ToggleHolderCorner"
            ToggleHolderCorner.Parent = ToggleHolder
            
            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = ToggleHolder
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.BorderColor3 = Color3.fromRGB(17, 17, 17)
            ToggleTitle.BorderSizePixel = 0
            ToggleTitle.Position = UDim2.new(0.024305556, 0, 0, 0)
            ToggleTitle.Size = UDim2.new(0, 240, 0, 30)
            ToggleTitle.Font = Enum.Font.GothamSemibold
            ToggleTitle.Text = togglename or ""
            ToggleTitle.TextColor3 = Color3.fromRGB(160, 60, 220)
            ToggleTitle.TextSize = 13.000
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            ToggleButton.Name = "ToggleButton"
            ToggleButton.Parent = ToggleHolder
            ToggleButton.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            ToggleButton.BackgroundTransparency = 1.000
            ToggleButton.BorderColor3 = Color3.fromRGB(17, 17, 17)
            ToggleButton.Position = UDim2.new(0.802083313, 0, 0, 0)
            ToggleButton.Size = UDim2.new(0, 70, 0, 30)
            ToggleButton.AutoButtonColor = false
            ToggleButton.Font = Enum.Font.SourceSans
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            ToggleButton.TextSize = 14.000
            
            ToggleFrame.Name = "ToggleFrame"
            ToggleFrame.Parent = ToggleButton
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
            ToggleFrame.BorderColor3 = Color3.fromRGB(5, 5, 5)
            ToggleFrame.Position = UDim2.new(0.27192983, 0, 0.15, 0)
            ToggleFrame.Size = UDim2.new(0, 42, 0, 23)
            
            ToggleFrameCorner.Name = "ToggleFrameCorner"
            ToggleFrameCorner.Parent = ToggleFrame
            
            ToggleBall.Name = "ToggleBall"
            ToggleBall.Parent = ToggleFrame
            ToggleBall.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleBall.Position = UDim2.new(0.12, 0, 0.15, 0)
            ToggleBall.Size = UDim2.new(0, 16, 0, 16)
            
            ToggleBallCorner.CornerRadius = UDim.new(0, 100)
            ToggleBallCorner.Name = "ToggleBallCorner"
            ToggleBallCorner.Parent = ToggleBall

            ToggleButton.MouseButton1Down:Connect(function()
                ToggleEnabled = not ToggleEnabled
                if ToggleEnabled then 
                    ToggleHolder.BackgroundColor3 = Color3.fromRGB(16,16,16)
                    ToggleBall:TweenPosition(UDim2.new(0.48, 0,0.15, 0),"Out","Linear",0.1)
                    wait(0.05)
                    ToggleHolder.BackgroundColor3 = Color3.fromRGB(17,17,17)
                else
                    ToggleHolder.BackgroundColor3 = Color3.fromRGB(16,16,16)
                    ToggleBall:TweenPosition(UDim2.new(0.12, 0,0.15, 0),"Out","Linear",0.1)
                    wait(0.05)
                    ToggleHolder.BackgroundColor3 = Color3.fromRGB(17,17,17)
                end
                pcall(callback,ToggleEnabled)
            end)
        end

        function PageElements:addSlider(slidername,minvalue,maxvalue,callback)
            local SliderHolder = Instance.new("Frame")
            local SliderTitle = Instance.new("TextLabel")
            local SliderHolderScript = Instance.new("UICorner")
            local SliderButton = Instance.new("TextButton")
            local SliderButtonCorner = Instance.new("UICorner")
            local SliderTrail = Instance.new("Frame")
            local SliderTrailCorner = Instance.new("UICorner")
            local SliderNumber = Instance.new("TextLabel")

            local callback = callback or function() end

            SliderHolder.Name = "SliderHolder"
            SliderHolder.Parent = Home
            SliderHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            SliderHolder.BackgroundTransparency = 0 
            SliderHolder.BorderColor3 = Color3.fromRGB(17, 16, 16)
            SliderHolder.BorderSizePixel = 0
            SliderHolder.Position = UDim2.new(0.0167785231, 0, 0, 0)
            SliderHolder.Size = UDim2.new(0, 345, 0, 32)
            
            SliderTitle.Name = "SliderTitle"
            SliderTitle.Parent = SliderHolder
            SliderTitle.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            SliderTitle.BackgroundTransparency = 1.000
            SliderTitle.BorderColor3 = Color3.fromRGB(17, 17, 17)
            SliderTitle.BorderSizePixel = 0
            SliderTitle.Position = UDim2.new(0.024305556, 0, 0.15, 0)
            SliderTitle.Size = UDim2.new(0, 280, 0, 10)
            SliderTitle.Font = Enum.Font.GothamSemibold
            SliderTitle.Text = slidername
            SliderTitle.TextColor3 = Color3.fromRGB(160, 60, 220)
            SliderTitle.TextSize = 13.000
            SliderTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            SliderHolderScript.CornerRadius = UDim.new(0, 6)
            SliderHolderScript.Name = "SliderHolderScript"
            SliderHolderScript.Parent = SliderHolder
            
            SliderButton.Name = "SliderButton"
            SliderButton.Parent = SliderHolder
            SliderButton.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
            SliderButton.BorderColor3 = Color3.fromRGB(15, 15, 15)
            SliderButton.BorderSizePixel = 0
            SliderButton.Position = UDim2.new(0, 10, 0, 20)
            SliderButton.Size = UDim2.new(0, 325, 0, 8)
            SliderButton.AutoButtonColor = false
            SliderButton.Font = Enum.Font.SourceSans
            SliderButton.Text = ""
            SliderButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            SliderButton.TextSize = 14.000
            
            SliderButtonCorner.Name = "SliderButtonCorner"
            SliderButtonCorner.Parent = SliderButton
            
            SliderTrail.Name = "SliderTrail"
            SliderTrail.Parent = SliderButton
            SliderTrail.BackgroundColor3 = Color3.fromRGB(160, 60, 220)
            SliderTrail.BorderColor3 = Color3.fromRGB(160, 60, 220)
            SliderTrail.Size = UDim2.new(0, 12, 0, 8)
            
            SliderTrailCorner.Name = "SliderTrailCorner"
            SliderTrailCorner.Parent = SliderTrail
            
            SliderNumber.Name = "SliderNumber"
            SliderNumber.Parent = SliderHolder
            SliderNumber.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            SliderNumber.BackgroundTransparency = 1.000
            SliderNumber.BorderColor3 = Color3.fromRGB(17, 17, 17)
            SliderNumber.BorderSizePixel = 0
            SliderNumber.Position = UDim2.new(0.885, 0, 0.19, 1)
            SliderNumber.Size = UDim2.new(0, 40, 0, 8)
            SliderNumber.Font = Enum.Font.GothamSemibold
            SliderNumber.Text = minvalue or "0"
            SliderNumber.TextColor3 = Color3.fromRGB(160, 60, 220) 
            SliderNumber.TextSize = 12.000
            SliderNumber.TextXAlignment = Enum.TextXAlignment.Left
             
            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local Value;

            SliderButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 325) * SliderTrail.AbsoluteSize.X) + tonumber(minvalue)) or 0
                callback(SliderNumber.Text)
                SliderTrail.Size = UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 325), 0, 8)
                moveconnection = mouse.Move:Connect(function()
                    SliderNumber.Text = Value
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 325) * SliderTrail.AbsoluteSize.X) + tonumber(minvalue))
                    callback(SliderNumber.Text)
                    SliderHolder.BackgroundColor3 = Color3.fromRGB(14,14,14)
                    SliderTrail.Size = UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 325), 0, 8)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 325) * SliderTrail.AbsoluteSize.X) + tonumber(minvalue))
                        callback(SliderNumber.Text)
                        SliderHolder.BackgroundColor3 = Color3.fromRGB(17,17,17)
                        SliderTrail.Size = UDim2.new(0, math.clamp(mouse.X - SliderTrail.AbsolutePosition.X, 0, 325), 0, 8)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
        end

        function PageElements:addTextBox(textboxname,textboxdefault,callback)
            local TextBoxHolder = Instance.new("Frame")
            local TextBoxTitle = Instance.new("TextLabel")
            local TextBox = Instance.new("TextBox")
            local TextBoxCorner = Instance.new("UICorner")
            local TextBoxHolderCorner = Instance.new("UICorner")

            local callback = callback or function() end

            TextBoxHolder.Name = "TextBoxHolder"
            TextBoxHolder.Parent = Home
            TextBoxHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            TextBoxHolder.BackgroundTransparency = 0.35 
            TextBoxHolder.BorderColor3 = Color3.fromRGB(17, 16, 16)
            TextBoxHolder.BorderSizePixel = 0
            TextBoxHolder.Position = UDim2.new(0.0167785231, 0, 0, 0)
            TextBoxHolder.Size = UDim2.new(0, 345, 0, 32)
            
            TextBoxTitle.Name = "TextBoxTitle"
            TextBoxTitle.Parent = TextBoxHolder
            TextBoxTitle.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            TextBoxTitle.BackgroundTransparency = 1.000
            TextBoxTitle.BorderColor3 = Color3.fromRGB(17, 17, 17)
            TextBoxTitle.BorderSizePixel = 0
            TextBoxTitle.Position = UDim2.new(0.024305556, 0, 0.0769230798, 0)
            TextBoxTitle.Size = UDim2.new(0, 240, 0, 26)
            TextBoxTitle.Font = Enum.Font.GothamSemibold
            TextBoxTitle.Text = textboxname
            TextBoxTitle.TextColor3 = Color3.fromRGB(160, 60, 220)
            TextBoxTitle.TextSize = 13.000
            TextBoxTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            TextBox.Parent = TextBoxHolder
            TextBox.BackgroundColor3 = Color3.fromRGB(5, 5, 5)
            TextBox.Position = UDim2.new(0.725694418, 0, 0.115384623, 0)
            TextBox.Size = UDim2.new(0, 90, 0, 24)
            TextBox.Font = Enum.Font.GothamSemibold
            TextBox.Text = textboxdefault or "nil"
            TextBox.TextColor3 = Color3.fromRGB(160, 60, 220)
            TextBox.TextSize = 11.000
            
            TextBoxCorner.CornerRadius = UDim.new(0, 6)
            TextBoxCorner.Name = "TextBoxCorner"
            TextBoxCorner.Parent = TextBox
            
            TextBoxHolderCorner.CornerRadius = UDim.new(0, 6)
            TextBoxHolderCorner.Name = "TextBoxHolderCorner"
            TextBoxHolderCorner.Parent = TextBoxHolder

            TextBox.Focused:Connect(function()
                TextBoxHolder.BackgroundColor3 = Color3.fromRGB(10,10,10)
            end)
            
            TextBox.FocusLost:Connect(function()
                TextBoxHolder.BackgroundColor3 = Color3.fromRGB(17,17,17)
                callback(TextBox.Text)
            end)
        end

        function PageElements:addDropdown(dropdownname,list,scrollsize,callback)
            local DropdownHolder = Instance.new("Frame")
            local DropdownHolderCorner = Instance.new("UICorner")
            local DropdownTitle = Instance.new("TextLabel")
            local DropdownButton = Instance.new("TextButton")
            local DropdownIcon = Instance.new("ImageLabel")
            local DropdownContainer = Instance.new("Frame")
            local DropdownContainerCorner = Instance.new("UICorner")
            local DropdownOptionContainer = Instance.new("ScrollingFrame")
            local DropdownOptionContainerLayout = Instance.new("UIListLayout")

            local callback = callback or function() end
            local DropDownEnabled = false

            DropdownHolder.Name = "DropdownHolder"
            DropdownHolder.Parent = Home
            DropdownHolder.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            DropdownHolder.BackgroundTransparency = 0.35 
            DropdownHolder.BorderColor3 = Color3.fromRGB(17, 17, 17)
            DropdownHolder.BorderSizePixel = 0
            DropdownHolder.Position = UDim2.new(0.0167785231, 0, 0, 0)
            DropdownHolder.Size = UDim2.new(0, 345, 0, 32)
            
            DropdownHolderCorner.CornerRadius = UDim.new(0, 6)
            DropdownHolderCorner.Name = "DropdownHolderCorner"
            DropdownHolderCorner.Parent = DropdownHolder
            
            DropdownTitle.Name = "DropdownTitle"
            DropdownTitle.Parent = DropdownHolder
            DropdownTitle.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            DropdownTitle.BackgroundTransparency = 1.000
            DropdownTitle.BorderColor3 = Color3.fromRGB(17, 17, 17)
            DropdownTitle.BorderSizePixel = 0
            DropdownTitle.Position = UDim2.new(0.024305556, 0, 0, 0)
            DropdownTitle.Size = UDim2.new(0, 240, 0, 30)
            DropdownTitle.Font = Enum.Font.GothamSemibold
            DropdownTitle.Text = dropdownname
            DropdownTitle.TextColor3 = Color3.fromRGB(160, 60, 220) 
            DropdownTitle.TextSize = 13.000
            DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left
            
            DropdownButton.Name = "DropdownButton"
            DropdownButton.Parent = DropdownHolder
            DropdownButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownButton.BackgroundTransparency = 1.000
            DropdownButton.Size = UDim2.new(0, 345, 0, 32)
            DropdownButton.Font = Enum.Font.SourceSans
            DropdownButton.Text = ""
            DropdownButton.TextColor3 = Color3.fromRGB(0, 0, 0)
            DropdownButton.TextSize = 14.000
            
            DropdownIcon.Name = "DropdownIcon"
            DropdownIcon.Parent = DropdownButton
            DropdownIcon.BackgroundTransparency = 1.000
            DropdownIcon.Position = UDim2.new(0.885, 0, 0.19, 0)
            DropdownIcon.Size = UDim2.new(0, 28, 0, 20)
            DropdownIcon.Image = "rbxassetid://3944690667"
            DropdownIcon.ScaleType = Enum.ScaleType.Fit
            
            DropdownContainer.Name = "DropdownContainer"
            DropdownContainer.Parent = DropdownHolder
            DropdownContainer.Active = true
            DropdownContainer.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            DropdownContainer.BackgroundTransparency = 0 
            DropdownContainer.BorderColor3 = Color3.fromRGB(17, 17, 17)
            DropdownContainer.BorderSizePixel = 0
            DropdownContainer.ClipsDescendants = true
            DropdownContainer.Position = UDim2.new(0, 0, 1.34615386, 0)
            DropdownContainer.Size = UDim2.new(0, 345, 0, 5)
            DropdownContainer.Visible = false
            
            DropdownContainerCorner.CornerRadius = UDim.new(0, 8)
            DropdownContainerCorner.Name = "DropdownContainerCorner"
            DropdownContainerCorner.Parent = DropdownContainer
            
            DropdownOptionContainer.Name = "DropdownOptionContainer"
            DropdownOptionContainer.Parent = DropdownContainer
            DropdownOptionContainer.Active = true
            DropdownOptionContainer.BackgroundColor3 = Color3.fromRGB(17, 17, 17)
            DropdownOptionContainer.BackgroundTransparency = 1.000
            DropdownOptionContainer.BorderColor3 = Color3.fromRGB(17, 17, 17)
            DropdownOptionContainer.BorderSizePixel = 0
            DropdownOptionContainer.Position = UDim2.new(0, 0, 0.0782608688, 0)
            DropdownOptionContainer.Size = UDim2.new(0, 345, 0, 10)
            DropdownOptionContainer.Visible = false
            DropdownOptionContainer.CanvasSize = UDim2.new(0, 0, scrollsize or 6, 0)
            DropdownOptionContainer.ScrollBarThickness = 2  
            DropdownOptionContainer.ScrollVelocity = Vector2.new(0, 40) 
            
            DropdownOptionContainerLayout.Name = "DropdownOptionContainerLayout"
            DropdownOptionContainerLayout.Parent = DropdownOptionContainer
            DropdownOptionContainerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
            DropdownOptionContainerLayout.SortOrder = Enum.SortOrder.LayoutOrder
            DropdownOptionContainerLayout.Padding = UDim.new(0, 6)

            local function makeelements(bool)
                for i,v in pairs(Home:GetChildren()) do 
                    if v:IsA("Frame") and v ~= DropdownHolder then 
                        v.Visible = bool
                    end
                end
            end
            
            DropdownButton.MouseButton1Down:Connect(function()
                if DropDownEnabled == false then 
                    DropDownEnabled = true
                    makeelements(false)
                    DropdownContainer.Visible = true
                    DropdownContainer:TweenSize(UDim2.new(0, 345,0, 140),"Out","Linear",0.3)
                    DropdownIcon.ImageColor3 = Color3.fromRGB(137, 246, 255)
                    wait(0.3)
                    DropdownOptionContainer.Visible = true
                    DropdownOptionContainer:TweenSize(UDim2.new(0, 345,0, 130),"Out","Linear",0.2)
                    wait(0.09)
                    Home.CanvasPosition = Vector2.new(0,0)
                else
                    DropDownEnabled = false
                    DropdownIcon.ImageColor3 = Color3.fromRGB(255,255,255)
                    DropdownOptionContainer:TweenSize(UDim2.new(0, 345,0, 10),"Out","Linear",0.2)
                    wait(0.2)
                    DropdownOptionContainer.Visible = false
                    DropdownContainer:TweenSize(UDim2.new(0, 345,0, 5),"Out","Linear",0.3)
                    wait(0.3)
                    makeelements(true)
                    DropdownContainer.Visible = false
                end
            end)	

            for i,v in pairs(list) do  
                local Option = Instance.new("TextButton")
                local OptionCorner = Instance.new("UICorner")

                Option.Name = "Option"
                Option.Parent = DropdownOptionContainer
                Option.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                Option.BackgroundTransparency = 0 
                Option.BorderColor3 = Color3.fromRGB(15, 15, 15)
                Option.Position = UDim2.new(0.0173611119, 0, 0, 0)
                Option.Size = UDim2.new(0, 335, 0, 26)
                Option.AutoButtonColor = false
                Option.Font = Enum.Font.GothamSemibold
                Option.Text = v
                Option.TextColor3 = Color3.fromRGB(160, 60, 220) 
                Option.TextSize = 12.000
                
                OptionCorner.CornerRadius = UDim.new(0, 7)
                OptionCorner.Name = "OptionCorner"
                OptionCorner.Parent = Option

                Option.MouseEnter:Connect(function()
                    Option.BackgroundColor3 = Color3.fromRGB(10,10,10)
                end)
                
                Option.MouseLeave:Connect(function()
                    Option.BackgroundColor3 = Color3.fromRGB(15,15,15)
                end)
                
                Option.MouseButton1Down:Connect(function()
                    for i,v in pairs(Option.Parent:GetChildren()) do
                        if v:IsA("GuiButton") and v ~= Option then
                            v.TextColor3 = Color3.fromRGB(160,60,220)
                        end
                    end
                    Option.TextColor3 = Color3.fromRGB(137, 246, 255)
                end)

                Option.MouseButton1Down:Connect(function()
                    DropDownEnabled = false
                    DropdownIcon.ImageColor3 = Color3.fromRGB(255,255,255)
                    DropdownOptionContainer:TweenSize(UDim2.new(0, 345,0, 10),"Out","Linear",0.2)
                    wait(0.2)
                    DropdownOptionContainer.Visible = false
                    DropdownContainer:TweenSize(UDim2.new(0, 345,0, 5),"Out","Linear",0.3)
                    callback(v)
                    wait(0.3)
                    makeelements(true)
                    DropdownContainer.Visible = false
                end)
            end
        end
        return PageElements
    end
    return PageYep
end
return Library
