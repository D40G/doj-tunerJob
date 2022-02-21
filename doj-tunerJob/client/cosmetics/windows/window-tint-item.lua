
local QBCore = exports['qb-core']:GetCoreObject()

local windows = {
    "windscreen",
    "windscreen_r",
    "window_lf",
    "window_rf",
    "window_lr",
    "window_rr",
    "window_lm",
    "window_rm",
}
exports['qb-target']:AddTargetBone(windows, {
    options = {
        {
            event = "doj:client:openWindowTintMenu",
            icon = "fas fa-circle",
            label = "Apply window tint",
            item = 'tint_supplies',
        },
    },
    distance = 1.5
})

RegisterNetEvent('doj:client:openWindowTintMenu', function()
	local playerPed	= PlayerPedId()
    local coords	= GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
		QBCore.Functions.Notify("Cannot Install while inside vehicle", "error", 3500)
        return
    end
	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 3.5) then
		local vehicle = nil
		if IsPedInAnyVehicle(playerPed, false) then
			vehicle = GetVehiclePedIsIn(playerPed, false)
		else
			vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
		end
		if DoesEntityExist(vehicle) then
            if Config.isVehicleOwned then
                local plate = GetVehicleNumberPlateText(vehicle)
                QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
                    if owned then
                        TriggerEvent("doj:client:windowTintMenu")
                    else
                        QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
                    end
                end, plate)
            else
                TriggerEvent("doj:client:windowTintMenu")
            end        
		end
	else
		QBCore.Functions.Notify("There is no vehicle nearby", "error", 3500)
	end
end)

RegisterNetEvent('doj:client:applyTint', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.0, 0, 71)
	if args == 1 then 
        if Config.skillbarRemoveTint == "reload-skillbar" then
            local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
            if finished ~= 100 then
                ClearPedTasks(playerPed)
                TriggerEvent("doj:client:windowTintMenu")
                QBCore.Functions.Notify("Failed to removed tint", "error", 3500)
            else
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 0)
                TriggerEvent("doj:client:windowTintMenu")
                QBCore.Functions.Notify("Windowtint removed", "success", 3500)
            end
        elseif Config.skillbarRemoveTint == "np-skillbar" then
            local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
            if finished ~= 100 then
                ClearPedTasks(playerPed)
                TriggerEvent("doj:client:windowTintMenu")
                QBCore.Functions.Notify("Failed to removed tint", "error", 3500)
            else
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 0)
                TriggerEvent("doj:client:windowTintMenu")
                QBCore.Functions.Notify("Windowtint removed", "success", 3500)
            end
        elseif Config.skillbarRemoveTint == "qb-skillbar" then
            local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
            Skillbar.Start({
                duration = math.random(2500,5000),
                pos = math.random(10, 30),
                width = math.random(10, 20),
            }, function()
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 0)
                TriggerEvent("doj:client:windowTintMenu")
                QBCore.Functions.Notify("Windowtint removed", "success", 3500)
            end, function()
                ClearPedTasks(playerPed)
                TriggerEvent("doj:client:windowTintMenu")
                QBCore.Functions.Notify("Failed to removed tint", "error", 3500)
            end)
        end
    elseif args == 2 then 
        QBCore.Functions.Progressbar("attempt_tint", "Attempting to apply 1% tint..", math.random(3700, 5200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "timetable@maid@cleaning_window@idle_b",
            anim = "idle_d",
            flags = 16,
        }, {
            model = "prop_rag_01",
            bone = 28422,
            coords = { x = -0.005, y = 0.00, z = 0.00},
            rotation = { x = 175.0, y = 160.0, z = 0.0},
        }, {}, function() -- Done
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 1)
                TriggerServerEvent('doj:server:removeTintSupplies')
                QBCore.Functions.Notify("Applied 1% tint", "success", 3500)
        end, function() -- Cancel
            ClearPedTasks(playerPed)
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    elseif args == 3 then
        QBCore.Functions.Progressbar("attempt_tint", "Attempting to apply 5% tint..", math.random(3700, 5200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "timetable@maid@cleaning_window@idle_b",
            anim = "idle_d",
            flags = 16,
        }, {
            model = "prop_rag_01",
            bone = 28422,
            coords = { x = -0.005, y = 0.00, z = 0.00},
            rotation = { x = 175.0, y = 160.0, z = 0.0},
        }, {}, function() -- Done
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 2)
                TriggerServerEvent('doj:server:removeTintSupplies')
                QBCore.Functions.Notify("Applied 5% tint", "success", 3500)
        end, function() -- Cancel
            ClearPedTasks(playerPed)
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    elseif args == 4 then 
        QBCore.Functions.Progressbar("attempt_tint", "Attempting to apply 15% tint..", math.random(3700, 5200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "timetable@maid@cleaning_window@idle_b",
            anim = "idle_d",
            flags = 16,
        }, {
            model = "prop_rag_01",
            bone = 28422,
            coords = { x = -0.005, y = 0.00, z = 0.00},
            rotation = { x = 175.0, y = 160.0, z = 0.0},
        }, {}, function() -- Done
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 3)
                TriggerServerEvent('doj:server:removeTintSupplies')
                QBCore.Functions.Notify("Applied 15% tint", "success", 3500)
        end, function() -- Cancel
            ClearPedTasks(playerPed)
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    elseif args == 5 then
        QBCore.Functions.Progressbar("attempt_tint", "Attempting to apply 25% tint..", math.random(3700, 5200), false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "timetable@maid@cleaning_window@idle_b",
            anim = "idle_d",
            flags = 16,
        }, {
            model = "prop_rag_01",
            bone = 28422,
            coords = { x = -0.005, y = 0.00, z = 0.00},
            rotation = { x = 175.0, y = 160.0, z = 0.0},
        }, {}, function() -- Done
                ClearPedTasks(playerPed)
                SetVehicleWindowTint(vehicle, 5)
                TriggerServerEvent('doj:server:removeTintSupplies')
                QBCore.Functions.Notify("Applied 25% tint", "success", 3500)
        end, function() -- Cancel
            ClearPedTasks(playerPed)
            QBCore.Functions.Notify("Canceled..", "error")
        end)
    else
        exports['qb-menu']:closeMenu()
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

RegisterNetEvent('doj:client:windowTintMenu', function()
    local playerPed	= PlayerPedId()
    ClearPedTasks(playerPed)
    exports['qb-menu']:openMenu({
		{
            header = "Window Tinting",
            txt = "",
            isMenuHeader = true
        },
        {
            header = "Window Tint",
            txt = "view available window tints",
            params = {
                event = "doj:client:windowTintList",
            }
        },
        {
            header = "Remove Tint",
            txt = "Remove current tint",
            params = {
                event = "doj:client:applyTint",
                args = 1
            }
        },
        {
            header = "Close",
            txt = "",
            params = {
                event = "doj:client:applyTint",
                args = 6
            }
        },
    })
end)

RegisterNetEvent('doj:client:windowTintList', function()
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
                event = "doj:client:applyTint",
                args = 2
            }
        },
        {
            header = "5% Tint",
            txt = "",
            params = {
                event = "doj:client:applyTint",
                args = 3
            }
        },
        {
            header = "15% Tint",
            txt = "",
            params = {
                event = "doj:client:applyTint",
                args = 4
            }
        },
        {
            header = "25% Tint",
            txt = "",
            params = {
                event = "doj:client:applyTint",
                args = 5
            }
        },
        {
            header = "< Return",
            txt = "",
            params = {
                event = "doj:client:windowTintMenu",
            }
        },
    })
end)
