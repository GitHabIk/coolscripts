local StarterGui = game:GetService("StarterGui")
local player = game.Players.LocalPlayer


local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DraggablePanelGui"
screenGui.ResetOnSpawn = false


local panel = Instance.new("Frame")
panel.Name = "Panel"
panel.Size = UDim2.new(0, 300, 0, 410)
panel.Position = UDim2.new(0.5, -150, 0.5, -100)
panel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
panel.BorderSizePixel = 0
panel.Active = true
panel.Draggable = true
panel.Parent = screenGui


local title = Instance.new("TextLabel")
title.Name = "Title"
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 0.9
title.Text = "Steal A Gubby v1.7"
title.Font = Enum.Font.SourceSansBold
title.TextSize = 24
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Parent = panel


local button = Instance.new("TextButton")
button.Name = "ActionButton"
button.Size = UDim2.new(0, 120, 0, 40)
button.Position = UDim2.new(0.5, -60, 0, 50)
button.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button.Text = "Auto lock OFF"
button.Font = Enum.Font.SourceSans
button.TextSize = 22
button.TextColor3 = Color3.fromRGB(255, 255, 255)
button.Parent = panel

local button2 = Instance.new("TextButton")
button2.Name = "ActionButton"
button2.Size = UDim2.new(0, 120, 0, 40)
button2.Position = UDim2.new(0.5, -60, 0, 100)
button2.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button2.Text = "Auto collect money OFF"
button2.Font = Enum.Font.SourceSans
button2.TextSize = 13
button2.TextColor3 = Color3.fromRGB(255, 255, 255)
button2.Parent = panel


local intBox = Instance.new("TextBox")
intBox.Name = "IntOnlyBox"
intBox.Size = UDim2.new(0, 120, 0, 35)
intBox.Position = UDim2.new(0.5, -60, 0, 150)
intBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
intBox.Text = "25"
intBox.PlaceholderText = "Enter player's walkspeed"
intBox.Font = Enum.Font.SourceSans
intBox.TextSize = 13
intBox.TextColor3 = Color3.fromRGB(255, 255, 255)
intBox.ClearTextOnFocus = false
intBox.Parent = panel

local button3 = Instance.new("TextButton")
button3.Name = "ActionButton"
button3.Size = UDim2.new(0, 120, 0, 40)
button3.Position = UDim2.new(0.5, -60, 0, 200)
button3.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button3.Text = "Delete lasers"
button3.Font = Enum.Font.SourceSans
button3.TextSize = 13
button3.TextColor3 = Color3.fromRGB(255, 255, 255)
button3.Parent = panel

local button4 = Instance.new("TextButton")
button4.Name = "ActionButton"
button4.Size = UDim2.new(0, 120, 0, 40)
button4.Position = UDim2.new(0.5, -60, 0, 250)
button4.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button4.Text = "Euro repair"
button4.Font = Enum.Font.SourceSans
button4.TextSize = 13
button4.TextColor3 = Color3.fromRGB(255, 255, 255)
button4.Parent = panel

local closebutton = Instance.new("TextButton")
closebutton.Name = "ActionButton"
closebutton.Size = UDim2.new(0, 40, 0, 40)
closebutton.Position = UDim2.new(0, 0, 0, 0)
closebutton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closebutton.Text = "x"
closebutton.TextColor3 = Color3.fromRGB(255, 255, 255)
closebutton.Font = Enum.Font.SourceSans
closebutton.TextSize = 20
closebutton.Parent = panel

local button5 = Instance.new("TextButton")
button5.Name = "ActionButton"
button5.Size = UDim2.new(0, 120, 0, 40)
button5.Position = UDim2.new(0.5, -60, 0, 360)
button5.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button5.Text = "Go up"
button5.Font = Enum.Font.SourceSans
button5.TextSize = 13
button5.TextColor3 = Color3.fromRGB(255, 255, 255)
button5.Parent = panel

local button6 = Instance.new("TextButton")
button6.Name = "ActionButton"
button6.Size = UDim2.new(0, 120, 0, 40)
button6.Position = UDim2.new(0.5, -60, 0, 305)
button6.BackgroundColor3 = Color3.fromRGB(70, 130, 180)
button6.Text = "Player ESP OFF"
button6.Font = Enum.Font.SourceSans
button6.TextSize = 13
button6.TextColor3 = Color3.fromRGB(255, 255, 255)
button6.Parent = panel


local function filterToInt(text)
	
	local filtered = text:match("^%-?%d*") or ""
	return filtered
end

local lastValid = ""

intBox:GetPropertyChangedSignal("Text"):Connect(function()
	local filtered = filterToInt(intBox.Text)
	if intBox.Text ~= filtered then
		intBox.Text = filtered
	end
	lastValid = intBox.Text
end)


intBox.FocusLost:Connect(function()
	
	if intBox.Text == "" or intBox.Text == "-" then
		intBox.Text = "25"
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(intBox.Text)
	else
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(intBox.Text)
	end
end)


local bs3 = false

button5.MouseButton1Click:Connect(function()
	if bs3 == false then
		button5.Text = "Go down"
		game.Players.LocalPlayer.Character.Humanoid.HipHeight = 23
		bs3 = true
	else
		button5.Text = "Go up"
		game.Players.LocalPlayer.Character.Humanoid.HipHeight = 2
		bs3 = false
	end
	
end)



screenGui.Parent = player:WaitForChild("PlayerGui")

local bs = false
local bs2 = false

local plrsHouseName = game.Players.LocalPlayer:WaitForChild("OwnedHouse")

local plrsHouse = plrsHouseName.Value



button.MouseButton1Click:Connect(function()
	if bs == false then bs = true
		button.Text = "Auto lock ON"
	else bs = false 
		button.Text = "Auto lock OFF"
	end
end)

button2.MouseButton1Click:Connect(function()
	if bs2 == false then bs2 = true
		button2.Text = "Auto collect money ON"
	else bs2 = false
		button2.Text = "Auto collect money OFF"
	end
end)

button3.MouseButton1Click:Connect(function()
	local houses = plrsHouse.Parent
	for _, house in houses:GetChildren() do
		print(house.Name)
		if house:FindFirstChild("Lasers") then
			house:FindFirstChild("Lasers"):Destroy()
		end
	end
end)

button4.MouseButton1Click:Connect(function()
	local houses = plrsHouse.Parent
	for _, house in houses:GetChildren() do
		for _, v in house:GetChildren() do
			if v.Name == "Part" then
				v:Destroy()
			end
		end
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	
	if bs == true then
		local plrsLocker = plrsHouse:FindFirstChild("LockPart")
		if plrsLocker == nil then plrsLocker = plrsHouse.LockParts.LockPart end
		local c = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		plrsLocker.CanCollide = false
		plrsLocker.CFrame = CFrame.new(c.X,c.Y+10,c.Z)
		wait(.001)
		plrsLocker.CFrame = CFrame.new(c.X,c.Y,c.Z)
	end
	if bs2 == true then
		for _,display in plrsHouse.Display:GetChildren() do
			local c = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
			display.CollectPart.CanCollide = false
			display.CollectPart.CFrame = CFrame.new(c.X,c.Y+10,c.Z)
			wait(.001)
			display.CollectPart.CFrame = CFrame.new(c.X,c.Y,c.Z)
		end
	end
end)

local bs4 = false

button6.MouseButton1Click:Connect(function()
	if bs4 == false then
		button6.Text = "Show players ON"
		for _, player in game.Players:GetChildren() do
			local c = player.Character
			local highlight = Instance.new("Highlight",c)
			highlight.FillColor = Color3.new(1, 0, 0)
			highlight.OutlineColor = Color3.new(1, 0, 0)
			highlight.FillTransparency = 0.7
		end
		bs4 = true
	else
		button6.Text = "Show players OFF"
		for _, player in game.Players:GetChildren() do
			player.Character.Highlight:Destroy()
		end
		bs4 = false
	end
end)


closebutton.MouseButton1Click:Connect(function()
	bs = false
	bs2 = false
	panel:Destroy()
end)
