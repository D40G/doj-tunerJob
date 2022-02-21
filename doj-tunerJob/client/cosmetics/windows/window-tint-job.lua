
local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('doj:client:openWindowTintMenuWorkStation', function()
	local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    local plate = GetVehicleNumberPlateText(vehicle)
	if IsPedSittingInAnyVehicle(playerPed) then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                if Config.isVehicleOwned then
                    QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                        if owned then
                            TriggerEvent("doj:client:windowTintMenuWorkStation")
                        else
                            QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
                        end
                    end, plate)
                else
                    TriggerEvent("doj:client:windowTintMenuWorkStation")
                end
            else
                TriggerEvent("doj:client:workStationCosmetics")
                QBCore.Functions.Notify('You are missing Tint Supplies', 'error', 3500)
            end
        end, "tint_supplies")
	else
		QBCore.Functions.Notify("There is no vehicle nearby", "error", 3500)
	end
end)

RegisterNetEvent('doj:client:windowTintMenuWorkStation', function()
    local playerPed	= PlayerPedId()
    ClearPedTasks(playerPed)
    exports['qb-menu']:openMenu({
		{
            header = "Tuner Work Station: Window Tinting",
            txt = "apply darker tint",
            isMenuHeader = true
        },
        {
            header = "Available Window Tint",
            txt = "",
            params = {
                event = "doj:client:windowTintListWorkStation",
            }
        },
        {
            header = "Remove Tint",
            txt = "",
            params = {
                event = "doj:client:applyTintWorkStation",
                args = 1
            }
        },
        {
            header = "< Return",
            txt = "Cosmetic Menu",
            params = {
                event = "doj:client:workStationCosmetics",
            }
        },
    })
end)

RegisterNetEvent('doj:client:applyTintWorkStation', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
	if args == 1 then 
        SetVehicleWindowTint(vehicle, 0)
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        TriggerEvent("doj:client:windowTintMenuWorkStation")
        QBCore.Functions.Notify("Windowtint removed", "success", 3500)
        TriggerEvent("doj:client:windowTintMenuWorkStation")
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    elseif args == 2 then 
        SetVehicleWindowTint(vehicle, 1)
        QBCore.Functions.Notify("Applied 1% tint", "success", 3500)
        TriggerEvent("doj:client:windowTintListWorkStation")
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
    elseif args == 3 then
        SetVehicleWindowTint(vehicle, 2)
        QBCore.Functions.Notify("Applied 5% tint", "success", 3500)
        TriggerEvent("doj:client:windowTintListWorkStation")
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
    elseif args == 4 then 
        SetVehicleWindowTint(vehicle, 3)
        QBCore.Functions.Notify("Applied 15% tint", "success", 3500)
        TriggerEvent("doj:client:windowTintListWorkStation")
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
    elseif args == 5 then
        SetVehicleWindowTint(vehicle, 5)
        QBCore.Functions.Notify("Applied 25% tint", "success", 3500)
        TriggerEvent("doj:client:windowTintListWorkStation")
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
    else
        TriggerEvent("doj:client:windowTintMenuWorkStation")
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end 
end)

RegisterNetEvent('doj:client:windowTintListWorkStation', function()
    exports['qb-menu']:openMenu({
		{
            header = "Window Tint",
            txt = "apply vehicle tint",
            isMenuHeader = true
        },
        {
            header = "1% Tint",
            txt = "",
            params = {
                event = "doj:client:applyTintWorkStation",
                args = 2
            }
        },
        {
            header = "5% Tint",
            txt = "",
            params = {
                event = "doj:client:applyTintWorkStation",
                args = 3
            }
        },
        {
            header = "15% Tint",
            txt = "",
            params = {
                event = "doj:client:applyTintWorkStation",
                args = 4
            }
        },
        {
            header = "25% Tint",
            txt = "",
            params = {
                event = "doj:client:applyTintWorkStation",
                args = 5
            }
        },
        {
            header = "< Return",
            txt = "",
            params = {
                event = "doj:client:applyTintWorkStation",
                args = 6
            }
        },
    })
end)