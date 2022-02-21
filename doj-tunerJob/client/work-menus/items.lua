
local QBCore = exports['qb-core']:GetCoreObject()

-- Shop

RegisterNetEvent("inventory:client:tunerShop", function(dropId)
	local ShopItems = {} 
	ShopItems.label = "Tuner Shop"
	ShopItems.items = Config.tunerShopItems
	ShopItems.slots = #Config.tunerShopItems
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end)

--- Storage

RegisterNetEvent('doj:client:tunerStorage', function()
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "workbench", {
        maxweight = 4000000,
        slots = 300,
    })  
    TriggerEvent("inventory:client:SetCurrentStash", "workbench")
end)

--- Crafting

RegisterNetEvent("inventory:client:tunerWorkbench", function(dropId)
	local crafting = {}
	crafting.label = "Tuner Crafting"
	crafting.items = GetWorkbenchThresholdItems()
	TriggerServerEvent("inventory:server:OpenInventory", "crafting", math.random(1, 99), crafting)
end)

function GetWorkbenchThresholdItems()
	WorkbenchItemsToItemInfo()
	local items = {}
	for k, item in pairs(Config.workbenchCraftingItems) do
		if QBCore.Functions.GetPlayerData().metadata["craftingrep"] >= Config.workbenchCraftingItems[k].threshold then
			items[k] = Config.workbenchCraftingItems[k]
		end
	end
	return items
end

function WorkbenchItemsToItemInfo()
	itemInfos = {
		[1] = 	{costs = QBCore.Shared.Items["steel"]["label"] .. ": 5x</br>" .. 		QBCore.Shared.Items["iron"]["label"] .. ": 5x "},
		[2] = 	{costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 5x</br>" .. 	QBCore.Shared.Items["iron"]["label"] .. ": 5x "},
		[3] = 	{costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 5x</br>" .. 	QBCore.Shared.Items["steel"]["label"] .. ": 5x "},
		[4] = 	{costs = QBCore.Shared.Items["aluminum"]["label"] .. ": 5x</br>" .. 	QBCore.Shared.Items["steel"]["label"] .. ": 5x "},
        [5] = 	{costs = QBCore.Shared.Items["rubber"]["label"] .. ": 5x</br>" .. 		QBCore.Shared.Items["aluminum"]["label"] .. ": 5x "},
        [6] = 	{costs = QBCore.Shared.Items["plastic"]["label"] .. ": 5x</br>" ..		QBCore.Shared.Items["electronics"]["label"] .. ": 5x "}, 
        [7] = 	{costs = QBCore.Shared.Items["electronics"]["label"] .. ": 5x</br>" .. 	QBCore.Shared.Items["metalscrap"]["label"] .. ": 5x "}, 
        [8] = 	{costs = QBCore.Shared.Items["plastic"]["label"] .. ": 5x</br>" .. 		QBCore.Shared.Items["metalscrap"]["label"] .. ": 5x "}, 
		[9] = 	{costs = QBCore.Shared.Items["rubber"]["label"] .. ": 5x</br>" .. 		QBCore.Shared.Items["steel"]["label"] .. ": 5x "},  
        [10] = 	{costs = QBCore.Shared.Items["plastic"]["label"] .. ": 5x</br>" ..		QBCore.Shared.Items["electronics"]["label"] .. ": 5x "},  
		[11] = 	{costs = QBCore.Shared.Items["plastic"]["label"] .. ": 5x</br>" .. 		QBCore.Shared.Items["rubber"]["label"] .. ": 5x "},  
        [12] = 	{costs = QBCore.Shared.Items["rubber"]["label"] .. ": 5x</br>" .. 		QBCore.Shared.Items["metalscrap"]["label"] .. ": 5x "}, 
		-- [13] = 	{costs = QBCore.Shared.Items["plastic"]["label"] .. ": 5x</br>" .. 	QBCore.Shared.Items["electronics"]["label"] .. ": 5x "},  
		-- [14] = 	{costs = QBCore.Shared.Items["plastic"]["label"] .. ": 5x</br>" .. 	QBCore.Shared.Items["electronics"]["label"] .. ": 5x "},  
	}

	local items = {}
	for k, item in pairs(Config.workbenchCraftingItems) do
		local itemInfo = QBCore.Shared.Items[item.name:lower()]
		items[item.slot] = {
			name = itemInfo["name"],
			amount = tonumber(item.amount),
			info = itemInfos[item.slot],
			label = itemInfo["label"],
			description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
			weight = itemInfo["weight"], 
			type = itemInfo["type"], 
			unique = itemInfo["unique"], 
			useable = itemInfo["useable"], 
			image = itemInfo["image"],
			slot = item.slot,
			costs = item.costs,
			threshold = item.threshold,
			points = item.points,
		}
	end
	Config.workbenchCraftingItems = items
end

