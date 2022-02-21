
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('doj:client:openNeonMenuWorkStation', function()
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    local plate = GetVehicleNumberPlateText(vehicle)
	if IsPedSittingInAnyVehicle(playerPed) then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                if Config.isVehicleOwned then
                    QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                        if owned then
                            TriggerEvent("doj:client:neonMenuWorkStation")
                        else
                            QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
                        end
                    end, plate)
                else
                    TriggerEvent("doj:client:neonMenuWorkStation")
                end 
            else
                TriggerEvent("doj:client:workStationCosmetics")
                QBCore.Functions.Notify('You are missing a Neon Controller', 'error', 3500)
            end
        end, "underglow_controller")
	else
		QBCore.Functions.Notify("You need to be inside a vehicle to use this", "error", 3500)
    end
end)

RegisterNetEvent('doj:client:applyNeonPostionWorkStation', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    TriggerEvent("doj:client:neonToggleMenuWorkStation")
	if args == 1 then
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4) 
        SetVehicleNeonLightEnabled(vehicle, 0, true)
        SetVehicleNeonLightEnabled(vehicle, 1, true)
        SetVehicleNeonLightEnabled(vehicle, 2, true)
        SetVehicleNeonLightEnabled(vehicle, 3, true)
    elseif args == 2 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightEnabled(vehicle, 0, false)
        SetVehicleNeonLightEnabled(vehicle, 1, false)
        SetVehicleNeonLightEnabled(vehicle, 2, false)
        SetVehicleNeonLightEnabled(vehicle, 3, false)
    else
        TriggerEvent("doj:client:neonMenuWorkStation")
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)




RegisterNetEvent('doj:client:neonMenuWorkStation', function()
    exports['qb-menu']:openMenu({
		{
            header = "Tuner Work Station: Underglow",
            txt = "adjust vehicle underglow",
            isMenuHeader = true
        },
        {
            header = "Toggle Neon",
            txt = "",
            params = {
                event = "doj:client:neonToggleMenuWorkStation",
            }
        },
        {
            header = "Change Color",
            txt = "",
            params = {
                event = "doj:client:neonColorMenuWorkStation",
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

RegisterNetEvent('doj:client:neonToggleMenuWorkStation', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Underglow",
            txt = "toggle underglow on/off",
            isMenuHeader = true
        },
        {
            header = "Turn On",
            txt = "",
            params = {
                event = "doj:client:applyNeonPostionWorkStation",
                args = 1
            }
        },
        {
            header = "Turn Off",
            txt = "",
            params = {
                event = "doj:client:applyNeonPostionWorkStation",
                args = 2
            }
        },
        {
            header = "< Return",
            params = {
                event = "doj:client:applyNeonPostionWorkStation",
                args = 3
            }
        },
    })
end)


RegisterNetEvent('doj:client:applyNeonColorWorkStation', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    TriggerEvent("doj:client:neonColorMenuWorkStation")
	if args == 1 then
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4) 
        SetVehicleNeonLightsColour(vehicle, 222, 222, 255)
    elseif args == 2 then
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4) 
        SetVehicleNeonLightsColour(vehicle, 2, 21, 255)
    elseif args == 3 then
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4) 
        SetVehicleNeonLightsColour(vehicle, 3, 83, 255)
    elseif args == 4 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 0, 255, 140)
    elseif args == 5 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 94,	255, 1)
    elseif args == 6 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 255, 255, 0)
    elseif args == 7 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 255, 150, 0)
    elseif args == 8 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 255, 62, 0)
    elseif args == 9 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 255, 1, 1)
    elseif args == 10 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 255, 50, 100)
    elseif args == 11 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 255, 5, 190)
    elseif args == 12 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 35,	1, 255) 
    elseif args == 13 then 
        TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        SetVehicleNeonLightsColour(vehicle, 15, 3, 255)     
    else
        TriggerEvent("doj:client:neonMenuWorkStation")
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)
RegisterNetEvent('doj:client:neonColorMenuWorkStation', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Underglow",
            txt = "adjust underglow color",
            isMenuHeader = true
        },
        {
            header = "White",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 1
            }
        },
        {
            header = "Blue",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 2
            }
        },
        {
            header = "Electric Blue",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 3
            }
        },
        {
            header = "Mint Green",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 4
            }
        },
        {
            header = "Lime Green",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 5
            }
        },
        {
            header = "Yellow",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 6
            }
        },
        {
            header = "Golden Shower",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 7
            }
        },
        {
            header = "Orange",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 8
            }
        },
        {
            header = "Red",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 9
            }
        },
        {
            header = "Pony Pink",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 10
            }
        },
        {
            header = "Hot Pink",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 11
            }
        },
        {
            header = "Purple",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 12
            }
        },
        {
            header = "Blacklight",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 13
            }
        },
        {
            header = "< Return",
            txt = "",
            params = {
                event = "doj:client:applyNeonColorWorkStation",
                args = 14
            }
        },
    })
end)