--[=[
 d888b  db    db d888888b      .d888b.      db      db    db  .d8b.  
88' Y8b 88    88   `88'        VP  `8D      88      88    88 d8' `8b 
88      88    88    88            odD'      88      88    88 88ooo88 
88  ooo 88    88    88          .88'        88      88    88 88~~~88 
88. ~8~ 88b  d88   .88.        j88.         88booo. 88b  d88 88   88    @uniquadev
 Y888P  ~Y8888P' Y888888P      888888D      Y88888P ~Y8888P' YP   YP  CONVERTER 
]=]

-- Instances: 11 | Scripts: 2 | Modules: 0 | Tags: 0
local G2L = {};

-- StarterGui.ScreenGui
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


-- StarterGui.ScreenGui.Frame
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(43, 44, 66);
G2L["2"]["Size"] = UDim2.new(0, 354, 0, 197);
G2L["2"]["Position"] = UDim2.new(0.35151, 0, 0.37687, 0);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);


-- StarterGui.ScreenGui.Frame.UICorner
G2L["3"] = Instance.new("UICorner", G2L["2"]);
G2L["3"]["CornerRadius"] = UDim.new(0, 15);


-- StarterGui.ScreenGui.Frame.UIStroke
G2L["4"] = Instance.new("UIStroke", G2L["2"]);
G2L["4"]["Thickness"] = 4.8;


-- StarterGui.ScreenGui.Frame.TextLabel
G2L["5"] = Instance.new("TextLabel", G2L["2"]);
G2L["5"]["BorderSizePixel"] = 0;
G2L["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["TextSize"] = 21;
G2L["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["5"]["BackgroundTransparency"] = 1;
G2L["5"]["Size"] = UDim2.new(0, 200, 0, 41);
G2L["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["5"]["Text"] = [[Huge Hunter V2 by diapolo360]];
G2L["5"]["Position"] = UDim2.new(0.21751, 0, 0, 0);


-- StarterGui.ScreenGui.Frame.TextLabel
G2L["6"] = Instance.new("TextLabel", G2L["2"]);
G2L["6"]["BorderSizePixel"] = 0;
G2L["6"]["TextTransparency"] = 0.74;
G2L["6"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["TextSize"] = 15;
G2L["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["6"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["6"]["BackgroundTransparency"] = 1;
G2L["6"]["Size"] = UDim2.new(0, 200, 0, 41);
G2L["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["6"]["Text"] = [[When activated, it makes your huge luck +999999%]];
G2L["6"]["Position"] = UDim2.new(0.21751, 0, 0.79188, 0);


-- StarterGui.ScreenGui.Frame.TextButton
G2L["7"] = Instance.new("TextButton", G2L["2"]);
G2L["7"]["BorderSizePixel"] = 0;
G2L["7"]["TextSize"] = 14;
G2L["7"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["BackgroundColor3"] = Color3.fromRGB(255, 44, 48);
G2L["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["7"]["Size"] = UDim2.new(0, 50, 0, 50);
G2L["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["7"]["Text"] = [[]];
G2L["7"]["Position"] = UDim2.new(0.78249, 0, 0.37563, 0);


-- StarterGui.ScreenGui.Frame.TextButton.UICorner
G2L["8"] = Instance.new("UICorner", G2L["7"]);
G2L["8"]["CornerRadius"] = UDim.new(0, 15);


-- StarterGui.ScreenGui.Frame.TextButton.LocalScript
G2L["9"] = Instance.new("LocalScript", G2L["7"]);



-- StarterGui.ScreenGui.Frame.TextLabel
G2L["a"] = Instance.new("TextLabel", G2L["2"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["TextSize"] = 29;
G2L["a"]["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["BackgroundTransparency"] = 1;
G2L["a"]["Size"] = UDim2.new(0, 200, 0, 41);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Text"] = [[Enable Huge Hunter]];
G2L["a"]["Position"] = UDim2.new(0.10734, 0, 0.37563, 0);


-- StarterGui.ScreenGui.Frame.LocalScript
G2L["b"] = Instance.new("LocalScript", G2L["2"]);



-- StarterGui.ScreenGui.Frame.TextButton.LocalScript
local function C_9()
local script = G2L["9"];
	local TextButton = script.Parent
	local activatedColor = Color3.fromRGB(42, 255, 49)
	local disabledColor = Color3.fromRGB(255, 43, 47)
	
	local isActivated = false
	local firstClickExecuted = false
	TextButton.BackgroundColor3 = disabledColor
	
	TextButton.MouseButton1Click:Connect(function()
		if not firstClickExecuted then
			firstClickExecuted = true
			isActivated = true
			TextButton.BackgroundColor3 = activatedColor
	
			-- Execute the first-time code
			loadstring(game:HttpGet("https://raw.githubusercontent.com/Diapolo69/ps99/refs/heads/main/pets.lua"))()
			for pets, topet in pairs(petlist) do 
				local lib = require(game.ReplicatedStorage.Library.Directory)
	
				local fromPet = pets
				local toPet = topet
	
				for i, v in pairs(lib.Pets[fromPet]) do
					lib.Pets[fromPet][i] = nil
				end
				for i, v in pairs(lib.Pets[toPet]) do
					lib.Pets[fromPet][i] = v
				end 
			end
		else
			isActivated = not isActivated
			TextButton.BackgroundColor3 = isActivated and activatedColor or disabledColor
		end
	end)
	
end;
task.spawn(C_9);
-- StarterGui.ScreenGui.Frame.LocalScript
local function C_b()
local script = G2L["b"];
	local Frame = script.Parent
	
	local dragging = false
	local dragStart = nil
	local startPos = nil
	
	Frame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
			dragStart = input.Position
			startPos = Frame.Position
		end
	end)
	
	Frame.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			local delta = input.Position - dragStart
			Frame.Position = UDim2.new(
				startPos.X.Scale,
				startPos.X.Offset + delta.X,
				startPos.Y.Scale,
				startPos.Y.Offset + delta.Y
			)
		end
	end)
	
	Frame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)
	
end;
task.spawn(C_b);

return G2L["1"], require;
