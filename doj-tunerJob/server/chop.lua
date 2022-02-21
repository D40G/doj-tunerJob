

local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('doj:server:chopReward')
AddEventHandler('doj:server:chopReward', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local items = {
        'plastic',
        'metalscrap',
        'copper',
        'aluminum',
        'iron',
        'steel',
        'rubber',
        'glass',
        'electronics',
    }
    local returnAmount = math.random(1,3)
    local randomItems = items[math.random(1,8)]
    local itemfound = Player.Functions.GetItemByName(randomItems)
    if math.random(1, 5) <= 3 then
        Player.Functions.AddItem(randomItems, returnAmount, nil, info, {["quality"] = 100}) 
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[randomItems], "add", returnAmount)
    end
    Player.Functions.AddItem(randomItems, returnAmount, nil, info, {["quality"] = 100}) 
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[randomItems], "add", returnAmount)
end)

RegisterServerEvent('doj:server:chopRewardEntireVehicle')
AddEventHandler('doj:server:chopRewardEntireVehicle', function()
    local Player = QBCore.Functions.GetPlayer(source)
    local pay = math.random(50,100)
    Player.Functions.AddMoney('cash', pay, "scrap")
    TriggerClientEvent('QBCore:Notify', source, "+$"..pay, "success")
    local items = {
        'plastic',
        'metalscrap',
        'copper',
        'aluminum',
        'iron',
        'steel',
        'rubber',
        'glass',
        'electronics',
    }
    local returnAmount = math.random(15,20)
    local randomItems = items[math.random(1,8)]
    local itemfound = Player.Functions.GetItemByName(randomItems)
    Player.Functions.AddItem(randomItems, returnAmount, nil, info, {["quality"] = 100}) 
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[randomItems], "add", returnAmount)
end)

RegisterNetEvent('doj:server:forceRemoveFromCar', function(plate)
    local plate = plate
    TriggerClientEvent('doj:client:forceRemoveFromCar', -1, plate)
end)