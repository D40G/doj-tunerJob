
local QBCore = exports['qb-core']:GetCoreObject()

if Config.One.Active then 
    workstationOne = CircleZone:Create(Config.One.Workstation, 4.0, {
        name="Tunershop-workstation-one",
        heading=0.0,
        debugPoly=Config.One.DebugZone,
        useZ=true,
    })
    workstationOne:onPlayerInOut(function(isPointInside)
        if isPointInside then
            local playerPed	= PlayerPedId()
            local coords	= GetEntityCoords(playerPed)
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    if IsPedSittingInAnyVehicle(playerPed) then
                        text = Config.One.WorkstationText
                        exports['textUi']:DrawTextUi('show', text)
                        TriggerEvent('doj:client:workStationMainMenu')
                    else
                        text = Config.One.WorkstationText..'</br>Vehicle is Required'
                        exports['textUi']:DrawTextUi('show', text)
                    end
                else
                    -- do nothing
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
    workbenchZone = CircleZone:Create(Config.One.Workbench, 1.0, {
        name="Tunershop-workbench-one",
        heading=0.0,
        debugPoly=Config.One.DebugZone,
        useZ=true,
    })
    workbenchZone:onPlayerInOut(function(isPointInside)
        if isPointInside then
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    text = Config.One.WorkbenchText
                    exports['textUi']:DrawTextUi('show', text)
                    TriggerEvent('doj:client:workbenchMenuWalkUp') 
                else
                    -- do nothing if they dont work as a tuner
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
end

if Config.Two.Active then
    workstationTwo = CircleZone:Create(Config.Two.Workstation, 4.0, {
        name="Tunershop-workstation-two",
        heading=0.0,
        debugPoly=Config.Two.DebugZone,
        useZ=true,
    })
    workstationTwo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            local playerPed	= PlayerPedId()
            local coords	= GetEntityCoords(playerPed)
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    if IsPedSittingInAnyVehicle(playerPed) then
                        text = Config.Two.WorkstationText
                        exports['textUi']:DrawTextUi('show', text)
                        TriggerEvent('doj:client:workStationMainMenu')
                    else
                        text = Config.Two.WorkstationText..'</br>Vehicle is Required'
                        exports['textUi']:DrawTextUi('show', text)
                    end
                else
                    -- do nothing
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
    workbenchTwo = CircleZone:Create(Config.Two.Workbench, 1.0, {
        name="Tunershop-workbench-two",
        heading=0.0,
        debugPoly=Config.Two.DebugZone,
        useZ=true,
    })
    workbenchTwo:onPlayerInOut(function(isPointInside)
        if isPointInside then
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    text = Config.Two.WorkbenchText
                    exports['textUi']:DrawTextUi('show', text)
                    TriggerEvent('doj:client:workbenchMenuWalkUp') 
                else
                    -- do nothing if they dont work as a tuner
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
end

if Config.Three.Active then
    workstationThree = CircleZone:Create(Config.Three.Workstation, 4.0, {
        name="Tunershop-workstation-three",
        heading=0.0,
        debugPoly=Config.Three.DebugZone,
        useZ=true,
    })
    workstationThree:onPlayerInOut(function(isPointInside)
        if isPointInside then
            local playerPed	= PlayerPedId()
            local coords	= GetEntityCoords(playerPed)
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    if IsPedSittingInAnyVehicle(playerPed) then
                        text = Config.Three.WorkstationText
                        exports['textUi']:DrawTextUi('show', text)
                        TriggerEvent('doj:client:workStationMainMenu')
                    else
                        text = Config.Three.WorkstationText..'</br>Vehicle is Required'
                        exports['textUi']:DrawTextUi('show', text)
                    end
                else
                    -- do nothing
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
    workbenchThree = CircleZone:Create(Config.Three.Workbench, 1.0, {
        name="Tunershop-workbench-three",
        heading=0.0,
        debugPoly=Config.Three.DebugZone,
        useZ=true,
    })
    workbenchThree:onPlayerInOut(function(isPointInside)
        if isPointInside then
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    text = Config.Three.WorkbenchText
                    exports['textUi']:DrawTextUi('show', text)
                    TriggerEvent('doj:client:workbenchMenuWalkUp') 
                else
                    -- do nothing if they dont work as a tuner
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
end

if Config.Four.Active then
    workstationFour = CircleZone:Create(Config.Four.Workstation, 4.0, {
        name="Tunershop-workstation-four",
        heading=0.0,
        debugPoly=Config.Four.DebugZone,
        useZ=true,
    })
    workstationFour:onPlayerInOut(function(isPointInside)
        if isPointInside then
            local playerPed	= PlayerPedId()
            local coords	= GetEntityCoords(playerPed)
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    if IsPedSittingInAnyVehicle(playerPed) then
                        text = Config.Four.WorkstationText
                        exports['textUi']:DrawTextUi('show', text)
                        TriggerEvent('doj:client:workStationMainMenu')
                    else
                        text = Config.Four.WorkstationText..'</br>Vehicle is Required'
                        exports['textUi']:DrawTextUi('show', text)
                    end
                else
                    -- do nothing
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
    workbenchFour = CircleZone:Create(Config.Four.Workbench, 1.0, {
        name="Tunershop-workbench-four",
        heading=0.0,
        debugPoly=Config.Four.DebugZone,
        useZ=true,
    })
    workbenchFour:onPlayerInOut(function(isPointInside)
        if isPointInside then
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    text = Config.Four.WorkbenchText
                    exports['textUi']:DrawTextUi('show', text)
                    TriggerEvent('doj:client:workbenchMenuWalkUp') 
                else
                    -- do nothing if they dont work as a tuner
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
end

if Config.Five.Active then
    workstationFive = CircleZone:Create(Config.Five.Workstation, 4.0, {
        name="Tunershop-workstation-five",
        heading=0.0,
        debugPoly=Config.Five.DebugZone,
        useZ=true,
    })
    workstationFive:onPlayerInOut(function(isPointInside)
        if isPointInside then
            local playerPed	= PlayerPedId()
            local coords	= GetEntityCoords(playerPed)
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    if IsPedSittingInAnyVehicle(playerPed) then
                        text = Config.Five.WorkstationText
                        exports['textUi']:DrawTextUi('show', text)
                        TriggerEvent('doj:client:workStationMainMenu')
                    else
                        text = Config.Five.WorkstationText..'</br>Vehicle is Required'
                        exports['textUi']:DrawTextUi('show', text)
                    end
                else
                    -- do nothing
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
    workbenchFive = CircleZone:Create(Config.Five.Workbench, 1.0, {
        name="Tunershop-workbench-five",
        heading=0.0,
        debugPoly=Config.Five.DebugZone,
        useZ=true,
    })
    workbenchFive:onPlayerInOut(function(isPointInside)
        if isPointInside then
            QBCore.Functions.GetPlayerData(function(PlayerData)
                if PlayerData.job.name == "tuner" then
                    text = Config.Five.WorkbenchText
                    exports['textUi']:DrawTextUi('show', text)
                    TriggerEvent('doj:client:workbenchMenuWalkUp') 
                else
                    -- do nothing if they dont work as a tuner
                end
            end)
        else
            exports['qb-menu']:closeMenu()
            exports['textUi']:HideTextUi('hide')
        end
    end)
end











