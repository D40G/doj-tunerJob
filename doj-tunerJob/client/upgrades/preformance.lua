local QBCore = exports['qb-core']:GetCoreObject()

-- Brakes
RegisterNetEvent('doj:client:workStationBrakesMenu', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            exports['qb-menu']:openMenu({
                {
                    header = "Tuner Work Station: Upgrades",
                    text = "Brakes",
                    isMenuHeader = true,
                },
                {
                    header = "Stage 2", 
                    params = {
                        event = "doj:client:applyBrakesWorkStation", 
                        args = 1
                    }
                },
                {
                    header = "Stage 3", 
                    params = {
                        event = "doj:client:applyBrakesWorkStation",
                        args = 2
                    }
                }, 
                {
                    header = "< Return",
                    txt = "Performance Menu",
                    params = {
                        event = "doj:client:applyBrakesWorkStation",
                        args = 3
                    }
                },
            })
        else
            TriggerEvent("doj:client:workStationPerformance")
            QBCore.Functions.Notify('You are missing a Brake Upgrade', 'error', 3500)
        end
    end, "brakes")
end)

RegisterNetEvent('doj:client:applyBrakesWorkStation', function(args) 
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
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 12, 1, false)
            TriggerEvent("doj:client:workStationBrakesMenu")
            QBCore.Functions.Notify("Stage 2 Brakes applied", "success", 3500)
            TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        end, function()
            TriggerEvent("doj:client:workStationBrakesMenu")
            QBCore.Functions.Notify("Failed to apply stage 2 brakes", "error", 3500)
        end)
    elseif args == 2 then 
        Skillbar.Start({
            duration = math.random(2500,5000),
            pos = math.random(10, 30),
            width = math.random(10, 20),
        }, function()
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 12, 2, false)
            TriggerEvent("doj:client:workStationBrakesMenu")
            QBCore.Functions.Notify("Stage 3 Brakes applied", "success", 3500)
            TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        end, function()
            TriggerEvent("doj:client:workStationBrakesMenu")
            QBCore.Functions.Notify("Failed to apply stage 3 brakes", "error", 3500)
        end)
    else
        TriggerEvent('doj:client:workStationPerformance') 
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

-- Engines
RegisterNetEvent('doj:client:workStationEnginesMenu', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            exports['qb-menu']:openMenu({
                {
                    header = "Tuner Work Station: Upgrades",
                    text = "Engines",
                    isMenuHeader = true,
                },
                {
                    header = "Stage 2", 
                    params = {
                        event = "doj:client:applyEnginesWorkStation",
                        args = 1
                    }
                },
                {
                    header = "Stage 3", 
                    params = {
                        event = "doj:client:applyEnginesWorkStation",
                        args = 2
                    }
                }, 
                {
                    header = "Stage 4", 
                    params = {
                        event = "doj:client:applyEnginesWorkStation",
                        args = 3
                    }
                }, 
                {
                    header = "< Return",
                    txt = "Performance Menu",
                    params = {
                        event = "doj:client:applyEnginesWorkStation",
                        args = 4
                    }
                },
            })
        else
            TriggerEvent("doj:client:workStationPerformance")
            QBCore.Functions.Notify('You are missing a Engine Upgrade', 'error', 3500)
        end
    end, "engine")
end)

RegisterNetEvent('doj:client:applyEnginesWorkStation', function(args) 
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
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 11, 1, false)
            TriggerEvent("doj:client:workStationEnginesMenu")
            TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
            QBCore.Functions.Notify("Stage 2 engine applied", "success", 3500)
        end, function()
            TriggerEvent("doj:client:workStationEnginesMenu")
            QBCore.Functions.Notify("Failed to apply stage 2 engine", "error", 3500)
        end)
    elseif args == 2 then 
        Skillbar.Start({
            duration = math.random(2500,5000),
            pos = math.random(10, 30),
            width = math.random(10, 20),
        }, function()
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 11, 2, false)
            TriggerEvent("doj:client:workStationEnginesMenu")
            TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
            QBCore.Functions.Notify("Stage 3 engine applied", "success", 3500)
        end, function()
            TriggerEvent("doj:client:workStationEnginesMenu")
            QBCore.Functions.Notify("Failed to apply stage 3 engine", "error", 3500)
        end)
    elseif args == 3 then 
        Skillbar.Start({
            duration = math.random(2500,5000),
            pos = math.random(10, 30),
            width = math.random(10, 20),
        }, function()
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 11, 3, false)
            TriggerEvent("doj:client:workStationEnginesMenu")
            TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
            QBCore.Functions.Notify("Stage 4 engine applied", "success", 3500)
        end, function()
            TriggerEvent("doj:client:workStationEnginesMenu")
            QBCore.Functions.Notify("Failed to stage 4 engine", "error", 3500)
        end)
    else
        TriggerEvent('doj:client:workStationPerformance') 
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

-- Transmissions
RegisterNetEvent('doj:client:workStationTransmissionMenu', function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            exports['qb-menu']:openMenu({
                {
                    header = "Tuner Work Station: Upgrades",
                    text = "Transmissions",
                    isMenuHeader = true,
                },
                {
                    header = "Stage 2", 
                    params = {
                        event = "doj:client:applyTransmissionWorkStation",
                        args = 1
                    }
                },
                {
                    header = "Stage 3", 
                    params = {
                        event = "doj:client:applyTransmissionWorkStation",
                        args = 2
                    }
                }, 
                {
                    header = "< Return",
                    txt = "Performance Menu",
                    params = {
                        event = "doj:client:applyTransmissionWorkStation",
                        args = 3
                    }
                },
            })
        else
            TriggerEvent("doj:client:workStationPerformance")
            QBCore.Functions.Notify('You are missing a Trasnmission Upgrade', 'error', 3500)
        end
    end, "trasnmission") 
end)

RegisterNetEvent('doj:client:applyTransmissionWorkStation', function(args) 
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
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 13, 1, false)
            TriggerEvent("doj:client:workStationTransmissionMenu")
            QBCore.Functions.Notify("Stage 2 Transmission applied", "success", 3500)
            TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        end, function()
            TriggerEvent("doj:client:workStationTransmissionMenu")
            QBCore.Functions.Notify("Failed to apply stage 2 transmission", "error", 3500)
        end) 
    elseif args == 2 then 
        Skillbar.Start({
            duration = math.random(2500,5000),
            pos = math.random(10, 30),
            width = math.random(10, 20),
        }, function()
            SetVehicleModKit(vehicle, 0)
            SetVehicleMod(vehicle, 13, 2, false)
            TriggerEvent("doj:client:workStationTransmissionMenu")
            QBCore.Functions.Notify("Stage 3 Transmission applied", "success", 3500)
            TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
        end, function()
            TriggerEvent("doj:client:workStationTransmissionMenu")
            QBCore.Functions.Notify("Failed to apply stage 3 transmission", "error", 3500)
        end)
    else
        TriggerEvent('doj:client:workStationPerformance') 
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)