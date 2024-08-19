--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 13 | Scripts: 2 | Modules: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

-- StarterGui.ScreenGui.CanvasGroup
G2L["2"] = Instance.new("CanvasGroup", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(53, 53, 81);
G2L["2"]["Size"] = UDim2.new(0, 330, 0, 187);
G2L["2"]["Position"] = UDim2.new(0.35341, 0, 0.38213, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.ScreenGui.CanvasGroup.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);


-- StarterGui.ScreenGui.CanvasGroup.LocalScript
G2L["4"] = Instance.new("LocalScript", G2L["2"]);


-- StarterGui.ScreenGui.CanvasGroup.LocalScript
G2L["5"] = Instance.new("LocalScript", G2L["2"]);


-- StarterGui.ScreenGui.CanvasGroup.Frame
G2L["6"] = Instance.new("Frame", G2L["2"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["Size"] = UDim2.new(0, 330, 0, 187);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.ScreenGui.CanvasGroup.Frame.UIGradient
G2L["7"] = Instance.new("UIGradient", G2L["6"]);
G2L["7"]["Rotation"] = 33;
G2L["7"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(41, 41, 62)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(53, 53, 81))};

-- StarterGui.ScreenGui.CanvasGroup.Frame.UICorner
G2L["8"] = Instance.new("UICorner", G2L["6"]);


-- StarterGui.ScreenGui.CanvasGroup.Frame.TextBox
G2L["9"] = Instance.new("TextBox", G2L["6"]);
G2L["9"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["9"]["PlaceholderColor3"] = Color3.fromRGB(179, 179, 179);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["TextSize"] = 15;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 55);
G2L["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["9"]["ClipsDescendants"] = true;
G2L["9"]["PlaceholderText"] = [[Enter Amount of Gems (Max 25b)]];
G2L["9"]["Size"] = UDim2.new(0, 200, 0, 50);
G2L["9"]["Position"] = UDim2.new(0.19697, 0, 0.31551, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Text"] = [[]];

-- StarterGui.ScreenGui.CanvasGroup.Frame.TextBox.UICorner
G2L["a"] = Instance.new("UICorner", G2L["9"]);


-- StarterGui.ScreenGui.CanvasGroup.Frame.TextButton
G2L["b"] = Instance.new("TextButton", G2L["6"]);
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["TextSize"] = 24;
G2L["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 55);
G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["b"]["Size"] = UDim2.new(0, 200, 0, 39);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Text"] = [[Start Spawning]];
G2L["b"]["Position"] = UDim2.new(0.19697, 0, 0.71658, 0);

-- StarterGui.ScreenGui.CanvasGroup.Frame.TextButton.UICorner
G2L["c"] = Instance.new("UICorner", G2L["b"]);


-- StarterGui.ScreenGui.CanvasGroup.Frame.TextLabel
G2L["d"] = Instance.new("TextLabel", G2L["6"]);
G2L["d"]["BorderSizePixel"] = 0;
G2L["d"]["BackgroundColor3"] = Color3.fromRGB(37, 37, 57);
G2L["d"]["TextSize"] = 14;
G2L["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
G2L["d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["d"]["Size"] = UDim2.new(0, 510, 0, 31);
G2L["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["d"]["Text"] = [[Made by @diapolo360]];
G2L["d"]["Position"] = UDim2.new(-0.54545, 0, 0, 0);

-- StarterGui.ScreenGui.CanvasGroup.LocalScript
local function C_4()
local script = G2L["4"];
	local UserInputService = game:GetService("UserInputService")
	
	local gui = script.Parent
	local dragging = false
	local dragInput, mousePos, framePos
	
	local function update(input)
		local delta = input.Position - mousePos
		gui.Position = UDim2.new(
			framePos.X.Scale,
			framePos.X.Offset + delta.X,
			framePos.Y.Scale,
			framePos.Y.Offset + delta.Y
		)
	end
	local frame = script.Parent
	
	local targetSize = UDim2.new(0, 330, 0, 187)
	local initialSize = UDim2.new(0, 330, 0, 30)
	local animationTime = 1
	
	local tweenService = game:GetService("TweenService")
	
	local tweenInfo = TweenInfo.new(
		animationTime,
		Enum.EasingStyle.Quad,
		Enum.EasingDirection.InOut
	)
	
	local tween = tweenService:Create(frame, TweenInfo.new(animationTime, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Size = targetSize})
	
	frame.Size = initialSize
	
	tween:Play()
	
	
	
	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			mousePos = input.Position
			framePos = gui.Position
	
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	
	UserInputService.InputChanged:Connect(function(input)
		if dragging and input == dragInput then
			update(input)
		end
	end)
	
end;
task.spawn(C_4);
-- StarterGui.ScreenGui.CanvasGroup.LocalScript
local function C_5()
local script = G2L["5"];
	local CanvasGroup = script.Parent
	local TextBox = CanvasGroup.Frame.TextBox
	local Button = CanvasGroup.Frame.TextButton
	local library = require(game.ReplicatedStorage.Library.Client.CurrencyCmds)
	local originalGetFunction = library.Get
	
	
	Button.MouseButton1Click:Connect(function()
		local poop = originalGetFunction("Diamonds")
		local desiredAmount = tonumber(TextBox.Text) or 0
		local increment = desiredAmount / 15 
		local delayTime = 0.1
		if desiredAmount > 0 and desiredAmount < 25000000001 then
			library.Get = function(currencyId)
				if currencyId == "Diamonds" then
					return poop
				else
					return originalGetFunction(currencyId)
				end
			end
	
			while poop < desiredAmount do
				poop = poop + increment
				print(library.Get("Diamonds"))
				wait(delayTime)
			end
		else
			local message = require(game.ReplicatedStorage.Library.Client.Message)
			message.Error("Hey you need to enter a number beetween 0 and 25b!")
		end
	end)
	
end;
task.spawn(C_5);

return G2L["1"], require;
