
local QBCore = exports['qb-core']:GetCoreObject()

--========================================================== Headlights

RegisterNetEvent('doj:client:applyXenons', function()
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
			if Config.isVehicleOwned then
				local plate = GetVehicleNumberPlateText(vehicle)
				QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
					if owned then
						playAnim("mini@repair", "fixing_a_ped", 35000)
						if Config.skillbarXenons == "reload-skillbar" then
							local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
							if finished ~= 100 then
								QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
								if finished2 ~= 100 then
									QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
									ClearPedTasks(playerPed)
								else
									local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
									if finished3 ~= 100 then
										QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
										ClearPedTasks(playerPed)
									else
										QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
										FreezeEntityPosition(playerPed, true)
										time = math.random(3000,7000)
										TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
										Wait(time)
										SetVehicleModKit(vehicle, 0)
										ToggleVehicleMod(vehicle, 22, true)
										ClearPedTasks(playerPed)
										FreezeEntityPosition(playerPed, false)
										CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
										TriggerServerEvent('updateVehicle', CurrentVehicleData)
										TriggerServerEvent('doj:server:removeXenon')
									end
								end
							end
						elseif Config.skillbarXenons == "np-skillbar" then
							local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
							if finished ~= 100 then
								QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(3000,7000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 22, true)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('doj:server:removeXenon')
							end
						elseif Config.skillbarXenons == "qb-skillbar" then
							local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
							Skillbar.Start({
								duration = math.random(2500,5000),
								pos = math.random(10, 30),
								width = math.random(10, 20),
							}, function()
								QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(3000,7000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 22, true)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('doj:server:removeXenon')
							end, function()
								QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							end)
						end
					else
						QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
					end
				end, plate)
			else
				playAnim("mini@repair", "fixing_a_ped", 35000)
				if Config.skillbarXenons == "reload-skillbar" then
					local finished = exports["reload-skillbar"]:taskBar(math.random(5000,7500),math.random(2,4))
					if finished ~= 100 then
						QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					else
						local finished2 = exports["reload-skillbar"]:taskBar(math.random(2500,5000),math.random(3,5))
						if finished2 ~= 100 then
							QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
							ClearPedTasks(playerPed)
						else
							local finished3 = exports["reload-skillbar"]:taskBar(math.random(900,2000),math.random(5,7))
							if finished3 ~= 100 then
								QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
								ClearPedTasks(playerPed)
							else
								QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
								FreezeEntityPosition(playerPed, true)
								time = math.random(3000,7000)
								TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
								Wait(time)
								SetVehicleModKit(vehicle, 0)
								ToggleVehicleMod(vehicle, 22, true)
								ClearPedTasks(playerPed)
								FreezeEntityPosition(playerPed, false)
								CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
								TriggerServerEvent('updateVehicle', CurrentVehicleData)
								TriggerServerEvent('doj:server:removeXenon')
							end
						end
					end
				elseif Config.skillbarXenons == "np-skillbar" then
					local finished = exports["np-skillbar"]:taskBar(1000,math.random(3,5))
					if finished ~= 100 then
						QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					else
						QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
						FreezeEntityPosition(playerPed, true)
						time = math.random(3000,7000)
						TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
						Wait(time)
						SetVehicleModKit(vehicle, 0)
						ToggleVehicleMod(vehicle, 22, true)
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, false)
						CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
						TriggerServerEvent('updateVehicle', CurrentVehicleData)
						TriggerServerEvent('doj:server:removeXenon')
					end
				elseif Config.skillbarXenons == "qb-skillbar" then
					local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
					Skillbar.Start({
						duration = math.random(2500,5000),
						pos = math.random(10, 30),
						width = math.random(10, 20),
					}, function()
						QBCore.Functions.Notify("Success! Installing Xenon Headlights", "success", 3500)
						FreezeEntityPosition(playerPed, true)
						time = math.random(3000,7000)
						TriggerEvent('pogressBar:drawBar', time, 'Installing Xenon Headlights')
						Wait(time)
						SetVehicleModKit(vehicle, 0)
						ToggleVehicleMod(vehicle, 22, true)
						ClearPedTasks(playerPed)
						FreezeEntityPosition(playerPed, false)
						CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
						TriggerServerEvent('updateVehicle', CurrentVehicleData)
						TriggerServerEvent('doj:server:removeXenon')
					end, function()
						QBCore.Functions.Notify("Xenon Headlight installation failed!", "error", 3500)
						ClearPedTasks(playerPed)
					end)
				end
			end
		end
	else
		QBCore.Functions.Notify("There is no vehicle nearby", "error", 3500)
	end
end)

RegisterNetEvent('doj:client:xenonMenu', function()
	local playerPed	= PlayerPedId()
	if IsPedSittingInAnyVehicle(playerPed) then
		local vehicle = GetVehiclePedIsIn(playerPed)
		local plate = GetVehicleNumberPlateText(vehicle)
		if Config.isVehicleOwned then
			QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
				if owned then
					TriggerEvent("doj:client:xenonControllerMenu")
				else
					QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
				end
			end, plate)
		else
			TriggerEvent("doj:client:xenonControllerMenu")
		end
	else
		QBCore.Functions.Notify("You need to be inside a vehicle to use this", "error")
    end
end)

RegisterNetEvent('doj:client:xenonQuickInstall', function()
	local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
	SetVehicleModKit(vehicle, 0)
	ToggleVehicleMod(vehicle, 22, true)
	QBCore.Functions.Notify("Xenons Installed")
	TriggerEvent("doj:client:xenonControllerMenu")
end)

RegisterNetEvent('doj:client:applyXenonColor', function(args) 
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
    TriggerEvent("doj:client:xenonControllerMenuList")
	if args == 1 then 
		SetVehicleHeadlightsColour(vehicle, 0)
    elseif args == 2 then 
		SetVehicleHeadlightsColour(vehicle, -1)      
    elseif args == 3 then 
		SetVehicleHeadlightsColour(vehicle, 1)    
    elseif args == 4 then 
		SetVehicleHeadlightsColour(vehicle, 2)    
    elseif args == 5 then
		SetVehicleHeadlightsColour(vehicle, 3)
	elseif args == 6 then
		SetVehicleHeadlightsColour(vehicle, 4)    
	elseif args == 7 then
		SetVehicleHeadlightsColour(vehicle, 5)    
	elseif args == 8 then
		SetVehicleHeadlightsColour(vehicle, 6)    
	elseif args == 9 then
		SetVehicleHeadlightsColour(vehicle, 7)    
	elseif args == 10 then
		SetVehicleHeadlightsColour(vehicle, 8)    
	elseif args == 11 then
		SetVehicleHeadlightsColour(vehicle, 9)   
	elseif args == 12 then
		SetVehicleHeadlightsColour(vehicle, 10)    
	elseif args == 13 then
		SetVehicleHeadlightsColour(vehicle, 11)    
	elseif args == 14 then
		SetVehicleHeadlightsColour(vehicle, 12)    
    else
        TriggerEvent("doj:client:workStationMainMenu")
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)



RegisterNetEvent('doj:client:xenonControllerMenu', function()
	exports['qb-menu']:openMenu({
		{
			header = "Xenon Menu",
			txt = "install Xenons",
			isMenuHeader = true
		},
		{
			header = "Install Xenons",
			params = {
				event = "doj:client:xenonQuickInstall",
			}
		},
		{
			header = "Available colors",
			txt = "",
			params = {
				event = "doj:client:xenonControllerMenuList",
			}
		},
	})
end)


RegisterNetEvent('doj:client:xenonControllerMenuList', function()
		exports['qb-menu']:openMenu({
			{
				header = "Xenon Menu",
				txt = "adjust vehicle headlight color",
				isMenuHeader = true
			},
			{
				header = "Stock",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 1
				}
			},
			{
				header = "Ice blue",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 2
				}
			},
			{
				header = "Blue",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 3
				}
			},
			{
				header = "Electric Blue",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 4
				}
			},
			{
				header = "Mint Green",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 5
				}
			},
			{
				header = "Lime Green",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 6
				}
			},
			{
				header = "Yellow",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 7
				}
			},
			{
				header = "Golden",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 8
				}
			},
			{
				header = "Orange",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 9
				}
			},
			{
				header = "Red",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 10
				}
			},
			{
				header = "Pony Pink ",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 11
				}
			},
			{
				header = "Hot Pink",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 12
				}
			},
			{
				header = "Purple",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 13
				}
			},
			{
				header = "Blacklight",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 14
				}
			},
			{
				header = "Close",
				txt = "",
				params = {
					event = "doj:client:applyXenonColor",
					args = 15
				}
			},
		})
end)


