
local QBCore = exports['qb-core']:GetCoreObject()

--========================================================== Turbo
RegisterNetEvent('doj:server:removeTurbo', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('turbo', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['turbo'], "remove", 1)
    TriggerClientEvent('QBCore:Notify', source, "Turbo has been installed", 'success')
end)

QBCore.Functions.CreateUseableItem("turbo", function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("doj:client:applyTurbo", src) 
	end
end)

--========================================================== Headlights
RegisterNetEvent('doj:server:removeXenon', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('headlights', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['headlights'], "remove", 1)
    TriggerClientEvent('QBCore:Notify', source, "Xenon Headlights Installed", 'success')
end)

QBCore.Functions.CreateUseableItem("headlights", function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent("doj:client:applyXenons", src)
	end
end)

QBCore.Functions.CreateUseableItem("hid_controller", function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent('doj:client:xenonMenu', src)
	end
end)

--========================================================== Tire Repair
QBCore.Functions.CreateUseableItem("tire", function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent('doj:client:replacePoppedTire', src) 
	end
end)

RegisterNetEvent('doj:server:removeTire', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('tire', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tire'], "remove", 1)
    TriggerClientEvent('QBCore:Notify', source, "Tire replaced", 'success')
end)

--========================================================== suspension

QBCore.Functions.CreateUseableItem("coilovers", function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent('doj:client:coiloverMenu', src) 
	end 
end)

--========================================================== Neons

QBCore.Functions.CreateUseableItem("underglow_controller", function(source, item)
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent('doj:client:openNeonMenu', src)
	end
end) 

--========================================================== Windowtint

QBCore.Functions.CreateUseableItem("tint_supplies", function(source, item) 
    local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName(item.name) ~= nil then
        TriggerClientEvent('doj:client:openWindowTintMenu', src)
	end
end)

RegisterNetEvent('doj:server:removeTintSupplies', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('tint_supplies', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tint_supplies'], "remove", 1)
end)

