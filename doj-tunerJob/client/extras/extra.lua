
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('doj:client:programVehicleKey', function() 
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local time = 5000
	local plate = GetVehicleNumberPlateText(veh)
    local VehiclePed = GetVehiclePedIsIn(ped)
    local EntityModel = GetEntityModel(VehiclePed)
    local DisplayName = GetDisplayNameFromVehicleModel(EntityModel)

	if IsPedInAnyVehicle(ped, false) then
		QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
			if HasItem then
                QBCore.Functions.Progressbar("key-info", "Attempting to program a key...", time, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    exports["memorygame"]:thermiteminigame(Config.minigame.correctBlocks, Config.minigame.incorrectBlocks, Config.minigame.timetoShow, Config.minigame.timetoLose,
                    function()
                        QBCore.Functions.Notify('Success!', "success")
                        TriggerServerEvent('QBCore:Server:RemoveItem',"key_unprogramed", 1)
                        TriggerEvent("inventory:client:ItemBox",  QBCore.Shared.Items["key_unprogramed"], "remove", 1)
                        QBCore.Functions.Progressbar("accepted", "Programing key...", 5000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            local info = {model = DisplayName, plate = plate} 
                            TriggerServerEvent('QBCore:Server:AddItem',"key_programed", 1 , false, info)
                            TriggerEvent("inventory:client:ItemBox",  QBCore.Shared.Items["key_programed"], "add", 1)
                            QBCore.Functions.Notify('Keys have been successfully programed', 'success', 3500)
                            TriggerEvent("doj:client:workStationMainMenuExtra")
                        end, function() -- Cancel
                            TriggerEvent("doj:client:workStationMainMenuExtra")
                            QBCore.Functions.Notify("Canceled!", "error")
                        end)
                    end,
                    function()
                        TriggerEvent("doj:client:workStationMainMenuExtra")
                        QBCore.Functions.Notify('Unable to program the key, keep trying!', "error")
                    end)
                end, function()
                    TriggerEvent("doj:client:workStationMainMenuExtra")
                    QBCore.Functions.Notify("Cancelled..", "error")
                end)
			else
                TriggerEvent("doj:client:workStationMainMenuExtra")
				QBCore.Functions.Notify('You are missing a Carkey to program', 'error', 3500)
			end
		end, "key_unprogramed") 
	else
        TriggerEvent("doj:client:workStationMainMenuExtra")
        QBCore.Functions.Notify("Cant help you without a vehicle!", "error", 3500)
	end
end)

RegisterNetEvent('doj:client:WorkstationRepair', function()
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			QBCore.Functions.Progressbar("repair-body", "Repairing Body...", 3700, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				SetVehicleBodyHealth(plyVeh,1000)
				SetVehicleDeformationFixed(plyVeh)
				QBCore.Functions.Progressbar("repair-engine", "Repairing Engine...", 3700, false, true, {
					disableMovement = true,
					disableCarMovement = false,
					disableMouse = false,
					disableCombat = true,
				}, {}, {}, {}, function() -- Done
                    exports["memorygame"]:thermiteminigame(Config.minigame.correctBlocks, Config.minigame.incorrectBlocks, Config.minigame.timetoShow, Config.minigame.timetoLose,
                    function()
                        SetVehicleEngineHealth(plyVeh, 1000)
                        SetVehiclePetrolTankHealth(plyVeh, 4000.0)
                        SetVehicleFixed(plyVeh)
						QBCore.Functions.Notify("Vehicle has been fully repaired", "success")
                        QBCore.Functions.Progressbar("repair-clean", "Cleaning vehicle...", 2790, false, true, {
                            disableMovement = true,
                            disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            SetVehicleDirtLevel(plyVeh, 0.0)
                            TriggerEvent('doj:client:workStationOptions')
                            QBCore.Functions.Notify("Finished vehicle maintenance", "success")
                        end, function()
                            QBCore.Functions.Notify('Unable to clean vehicle!', "error")
                        end)
                    end,
                    function()
                        SetVehicleEngineHealth(plyVeh, 500)
                        SetVehiclePetrolTankHealth(plyVeh, 2000.0)
                        TriggerEvent("doj:client:workStationMainMenuExtra")
                        QBCore.Functions.Notify('Unable to repair vehicle engine, Something went wrong!', "error")
                    end)
				end, function()
                    QBCore.Functions.Notify('Unable to repair vehicle engine!', "error")
				end)
			end, function()
                QBCore.Functions.Notify('Unable to repair vehicle body!', "error")
			end)
		else
			TriggerEvent("doj:client:workStationMainMenuExtra")
		  	QBCore.Functions.Notify("You are missing a Repairkit", "error" , 5000)
		end
	end, 'repairkit')
end)