local QBCore = exports['qb-core']:GetCoreObject()


local function trim(value)
	if not value then return nil end
    return (string.gsub(value, '^%s*(.-)%s*$', '%1'))
end

RegisterNetEvent('doj:client:workStationNitrousMenu', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            exports['qb-menu']:openMenu({
                {
                    header = "Nitrous Menu",
                    txt = "give vehicle a boost",
                    isMenuHeader = true
                },
                {
                    header = "Install Nitrous",
                    txt = "",
                    params = {
                        event = "doj:client:applyNitrousWorkStation",
                        args = 1
                    }
                },
                {
					header = "< Return",
					txt = "Performance Menu",
                    params = {
                        event = "doj:client:applyNitrousWorkStation",
                        args = 2
                    }
                },
            })
        else
            TriggerEvent("doj:client:workStationPerformance")
            QBCore.Functions.Notify('You are missing nitrous', 'error', 3500)
        end
    end, "nitrous") 
end)

RegisterNetEvent('doj:client:applyNitrousWorkStation', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
	if args == 1 then 
        Skillbar.Start({
            duration = math.random(2500,5000),
            pos = math.random(10, 30),
            width = math.random(10, 20),
        }, function()
            QBCore.Functions.Progressbar("use_nos", "Connecting NOS...", math.random(1000,3700), false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TriggerEvent("doj:client:workStationNitrousMenu")
                TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items['nitrous'], "remove")
                TriggerServerEvent("QBCore:Server:RemoveItem", 'nitrous', 1)
                local CurrentVehicle = GetVehiclePedIsIn(PlayerPedId())
                local Plate = trim(GetVehicleNumberPlateText(CurrentVehicle))
                TriggerServerEvent('nitrous:server:LoadNitrous', Plate)
            end)
        end, function()
            TriggerEvent("doj:client:workStationNitrousMenu")
            QBCore.Functions.Notify("Failed to apply nitrous", "error", 3500)
        end)
    else
        TriggerEvent('doj:client:workStationPerformance') 
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)


-- Tunerchip
RegisterNetEvent('doj:client:openTunerchipMenu', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            exports['qb-menu']:openMenu({
                {
                    header = "Tune Vehicle",
                    txt = "give vehicle a boost",
                    isMenuHeader = true
                },
                {
                    header = "Open Tablet",
                    txt = "",
                    params = {
                        event = "doj:client:openTabletWorkStation",
                        args = 1
                    }
                },
                {
					header = "< Return",
					txt = "Performance Menu",
                    params = {
                        event = "doj:client:openTabletWorkStation",
                        args = 2
                    }
                },
            })
        else
            TriggerEvent("doj:client:workStationPerformance")
            QBCore.Functions.Notify('You are missing a Tuning Tablet', 'error', 3500)
        end
    end, "tunerlaptop") 
end)

RegisterNetEvent('doj:client:openTabletWorkStation', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
	if args == 1 then 
        TriggerEvent("qb-tunerchip:client:openChip")   
    else
        TriggerEvent('doj:client:workStationPerformance') 
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)