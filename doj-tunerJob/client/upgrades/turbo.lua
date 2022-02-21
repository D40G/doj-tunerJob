
local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('doj:client:workStationTurboMenu', function()
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
			exports['qb-menu']:openMenu({
				{
					header = "Tuner Work Station: Upgrades",
					text = "Turbo",
					isMenuHeader = true,
				},
				{
					header = "Apply Turbo", 
					params = {
						event = "doj:client:applyTurboWorkStation",
						args = 1
					}
				},
				{
					header = "Remove Turbo", 
					params = {
						event = "doj:client:applyTurboWorkStation",
						args = 2
					}
				}, 
				{
					header = "< Return",
					txt = "Performance Menu",
					params = {
						event = "doj:client:applyTurboWorkStation",
						args = 3
					}
				},
			})
        else
            TriggerEvent("doj:client:workStationPerformance")
            QBCore.Functions.Notify('You are missing a Turbo Upgrade', 'error', 3500)
        end
    end, "turbo")
end)

RegisterNetEvent('doj:client:applyTurboWorkStation', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
	local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
	if args == 1 then 
		if IsToggleModOn(vehicle,18) then
			TriggerEvent("doj:client:workStationTurboMenu")
			QBCore.Functions.Notify("Vehicle already has a turbo installed", "error", 3500)
		else
			Skillbar.Start({
				duration = math.random(2500,5000),
				pos = math.random(10, 30),
				width = math.random(10, 20),
			}, function()
				SetVehicleModKit(vehicle, 0)
				ToggleVehicleMod(vehicle, 18, true)
				TriggerEvent("doj:client:workStationTurboMenu")
				QBCore.Functions.Notify("Turbo applied", "success", 3500)
				TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
			end, function()
				TriggerEvent("doj:client:workStationTurboMenu")
				QBCore.Functions.Notify("Failed to apply Turbo", "error", 3500)
			end)
		end
    elseif args == 2 then
		if not IsToggleModOn(vehicle,18) then
			TriggerEvent("doj:client:workStationTurboMenu")
			QBCore.Functions.Notify("Vehicle doesnt have a turbo to remove", "error", 3500)
		else
			Skillbar.Start({
				duration = math.random(2500,5000),
				pos = math.random(10, 30),
				width = math.random(10, 20),
			}, function()
				SetVehicleModKit(vehicle, 0)
				ToggleVehicleMod(vehicle, 18, false)
				TriggerEvent("doj:client:workStationTurboMenu")
				QBCore.Functions.Notify("Turbo removed", "success", 3500)
				TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
			end, function()
				TriggerEvent("doj:client:workStationTurboMenu")
				QBCore.Functions.Notify("Failed to remove Turbo", "error", 3500)
			end) 
		end
    else
        TriggerEvent('doj:client:workStationPerformance') 
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

--========================================================== Turbo as item
RegisterNetEvent('doj:client:applyTurbo', function()
	local playerPed	= PlayerPedId()
    local coords	= GetEntityCoords(playerPed)
    if IsPedSittingInAnyVehicle(playerPed) then
		QBCore.Functions.Notify("Cannot Install while inside vehicle", "error", 3500)
        ClearPedTasks(playerPed)
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
			local plate = GetVehicleNumberPlateText(vehicle)
			if Config.isVehicleOwned then
				QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
					if owned then
						playAnim("mini@repair", "fixing_a_ped", 35000)
						SetVehicleEngineOn(vehicle, false, false, true)
						SetVehicleDoorOpen(vehicle, 4, false, false)
						if Config.skillbarTurbo == "reload-skillbar" then
							local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
							if finished ~= 100 then
								QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
								if finished2 ~= 100 then
									QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
									ClearPedTasks(playerPed)
								else
									local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
									if finished3 ~= 100 then
										QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
										ClearPedTasks(playerPed)
									else
										QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
										FreezeEntityPosition(playerPed, true)
										time = math.random(7000,10000)
										TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
										Wait(time)
										SetVehicleModKit(vehicle, 0)
										ToggleVehicleMod(vehicle, 18, true)
										SetVehicleDoorShut(vehicle, 4, false)
										ClearPedTasks(playerPed)
										FreezeEntityPosition(playerPed, false)
										SetVehicleEngineOn(vehicle, true, true)
										CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
										TriggerServerEvent('updateVehicle', CurrentVehicleData)
										TriggerServerEvent('doj:server:removeTurbo')
									end
								end
							end
						elseif Config.skillbarTurbo == "np-skillbar" then
							local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
							if finished ~= 100 then
								QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(7000,10000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 18, true)
								SetVehicleDoorShut(vehicle, 4, false)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								SetVehicleEngineOn(vehicle, true, true)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('doj:server:removeTurbo')
							end
						elseif Config.skillbarTurbo == "qb-skillbar" then
							local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
							Skillbar.Start({
								duration = math.random(2500,5000),
								pos = math.random(10, 30),
								width = math.random(10, 20),
							}, function()
								QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(7000,10000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 18, true)
								SetVehicleDoorShut(vehicle, 4, false)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								SetVehicleEngineOn(vehicle, true, true)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('doj:server:removeTurbo')
							end, function()
								QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							end)
						end
					else
						QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
					end
				end, plate)
			else
				playAnim("mini@repair", "fixing_a_ped", 35000)
				SetVehicleEngineOn(vehicle, false, false, true)
				SetVehicleDoorOpen(vehicle, 4, false, false)
				if Config.skillbarTurbo == "reload-skillbar" then
					local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
					if finished ~= 100 then
						QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					else
						local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
						if finished2 ~= 100 then
							QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
							ClearPedTasks(playerPed)
						else
							local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
							if finished3 ~= 100 then
								QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(7000,10000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 18, true)
								SetVehicleDoorShut(vehicle, 4, false)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								SetVehicleEngineOn(vehicle, true, true)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('doj:server:removeTurbo')
							end
						end
					end
				elseif Config.skillbarTurbo == "np-skillbar" then
					local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
					if finished ~= 100 then
						QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					else
						QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
						FreezeEntityPosition(playerPed, true)
						time = math.random(7000,10000)
						TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
						Wait(time)
						SetVehicleModKit(vehicle, 0)
						ToggleVehicleMod(vehicle, 18, true)
						SetVehicleDoorShut(vehicle, 4, false)
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, false)
						SetVehicleEngineOn(vehicle, true, true)
						CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
						TriggerServerEvent('updateVehicle', CurrentVehicleData)
						TriggerServerEvent('doj:server:removeTurbo')
					end
				elseif Config.skillbarTurbo == "qb-skillbar" then
					local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
					Skillbar.Start({
						duration = math.random(2500,5000),
						pos = math.random(10, 30),
						width = math.random(10, 20),
					}, function()
						QBCore.Functions.Notify("Success! Installing Turbo", "success", 3500)
						FreezeEntityPosition(playerPed, true)
						time = math.random(7000,10000)
						TriggerEvent('pogressBar:drawBar', time, 'Installing Turbo')
						Wait(time)
						SetVehicleModKit(vehicle, 0)
						ToggleVehicleMod(vehicle, 18, true)
						SetVehicleDoorShut(vehicle, 4, false)
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, false)
						SetVehicleEngineOn(vehicle, true, true)
						CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
						TriggerServerEvent('updateVehicle', CurrentVehicleData)
						TriggerServerEvent('doj:server:removeTurbo')
					end, function()
						QBCore.Functions.Notify("Turbo installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					end)
				end
			end
		end
	else
		QBCore.Functions.Notify("There is no vehicle nearby", "error", 3500)
	end
end)

function playAnim(animDict, animName, duration)
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do 
      Wait(0) 
    end
    TaskPlayAnim(PlayerPedId(), animDict, animName, 1.0, -1.0, duration, 49, 1, false, false, false)
    RemoveAnimDict(animDict)
end