
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('doj:client:openNeonMenu', function()
    local playerPed	= PlayerPedId()
	if IsPedSittingInAnyVehicle(playerPed) then
        local vehicle = GetVehiclePedIsIn(playerPed)
        local plate = GetVehicleNumberPlateText(vehicle)
        if Config.isVehicleOwned then
            QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                if owned then
                    TriggerEvent("doj:client:neonMenu")
                else
                    QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
                end
            end, plate)
        else
            TriggerEvent("doj:client:neonMenu")
        end
	else
		QBCore.Functions.Notify("You need to be inside a vehicle to use this", "error", 3500)
    end
end)

RegisterNetEvent('doj:client:applyNeonPostion', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    TriggerEvent("doj:client:neonToggleMenu")
	if args == 1 then 
        SetVehicleNeonLightEnabled(vehicle, 0, true)
        SetVehicleNeonLightEnabled(vehicle, 1, true)
        SetVehicleNeonLightEnabled(vehicle, 2, true)
        SetVehicleNeonLightEnabled(vehicle, 3, true)
    elseif args == 2 then 
        SetVehicleNeonLightEnabled(vehicle, 0, false)
        SetVehicleNeonLightEnabled(vehicle, 1, false)
        SetVehicleNeonLightEnabled(vehicle, 2, false)
        SetVehicleNeonLightEnabled(vehicle, 3, false)
    end
end)

RegisterNetEvent('doj:client:applyNeonColor', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
    TriggerEvent("doj:client:neonColorMenu")
	if args == 1 then 
        SetVehicleNeonLightsColour(vehicle, 222, 222, 255)
    elseif args == 2 then 
        SetVehicleNeonLightsColour(vehicle, 2, 21, 255)
    elseif args == 3 then 
        SetVehicleNeonLightsColour(vehicle, 3, 83, 255)
    elseif args == 4 then 
        SetVehicleNeonLightsColour(vehicle, 0, 255, 140)
    elseif args == 5 then 
        SetVehicleNeonLightsColour(vehicle, 94,	255, 1)
    elseif args == 6 then 
        SetVehicleNeonLightsColour(vehicle, 255, 255, 0)
    elseif args == 7 then 
        SetVehicleNeonLightsColour(vehicle, 255, 150, 0)
    elseif args == 8 then 
        SetVehicleNeonLightsColour(vehicle, 255, 62, 0)
    elseif args == 9 then 
        SetVehicleNeonLightsColour(vehicle, 255, 1, 1)
    elseif args == 10 then 
        SetVehicleNeonLightsColour(vehicle, 255, 50, 100)
    elseif args == 11 then 
        SetVehicleNeonLightsColour(vehicle, 255, 5, 190)
    elseif args == 12 then 
        SetVehicleNeonLightsColour(vehicle, 35,	1, 255) 
    elseif args == 13 then 
        SetVehicleNeonLightsColour(vehicle, 15, 3, 255)     
    else
        exports['qb-menu']:closeMenu()
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

RegisterNetEvent('doj:client:neonMenu', function()
    exports['qb-menu']:openMenu({
		{
            header = "Neon Underglow",
            txt = "adjust vehicle underglow",
            isMenuHeader = true
        },
        {
            header = "Toggle Neon",
            txt = "",
            params = {
                event = "doj:client:neonToggleMenu",
            }
        },
        {
            header = "Change Color",
            txt = "",
            params = {
                event = "doj:client:neonColorMenu",
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 14
            }
        },
    })
end)

RegisterNetEvent('doj:client:neonToggleMenu', function()
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
                event = "doj:client:applyNeonPostion",
                args = 1
            }
        },
        {
            header = "Turn Off",
            txt = "",
            params = {
                event = "doj:client:applyNeonPostion",
                args = 2
            }
        },
        {
            header = "< return",
            txt = "",
            params = {
                event = "doj:client:neonMenu",
            }
        },
    })
end)

RegisterNetEvent('doj:client:neonColorMenu', function()
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
                event = "doj:client:applyNeonColor",
                args = 1
            }
        },
        {
            header = "Blue",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 2
            }
        },
        {
            header = "Electric Blue",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 3
            }
        },
        {
            header = "Mint Green",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 4
            }
        },
        {
            header = "Lime Green",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 5
            }
        },
        {
            header = "Yellow",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 6
            }
        },
        {
            header = "Golden Shower",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 7
            }
        },
        {
            header = "Orange",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 8
            }
        },
        {
            header = "Red",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 9
            }
        },
        {
            header = "Pony Pink",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 10
            }
        },
        {
            header = "Hot Pink",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 11
            }
        },
        {
            header = "Purple",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 12
            }
        },
        {
            header = "Blacklight",
            txt = "",
            params = {
                event = "doj:client:applyNeonColor",
                args = 13
            }
        },
        {
            header = "< return",
            txt = "",
            params = {
                event = "doj:client:neonMenu",
            }
        },
    })
end)