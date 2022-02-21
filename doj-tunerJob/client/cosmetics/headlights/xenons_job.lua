
local QBCore = exports['qb-core']:GetCoreObject()

--========================================================== Headlights

RegisterNetEvent('doj:client:xenonMenuWorkStation', function()
	local playerPed	= PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed)
	local plate = GetVehicleNumberPlateText(vehicle)
	if IsPedSittingInAnyVehicle(playerPed) then
		QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
				if Config.isVehicleOwned then
					QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned) 
						if owned then
							TriggerEvent("doj:client:xenonControllerMenuWorkStation")
						else
							QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
						end
					end, plate)
				else
					TriggerEvent("doj:client:xenonControllerMenuWorkStation")
				end
            else
                TriggerEvent("doj:client:workStationCosmetics")
                QBCore.Functions.Notify('You are missing a Xenon Remote', 'error', 3500) 
            end
        end, "hid_controller")
	else
		QBCore.Functions.Notify("You need to be inside a vehicle to use this", "error")
    end
end)

RegisterNetEvent('doj:client:xenonQuickInstallWorkStation', function()
	local playerPed	= PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed)
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			SetVehicleModKit(vehicle, 0)
			ToggleVehicleMod(vehicle, 22, true)
			QBCore.Functions.Notify("Xenons Installed")
			TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
			TriggerEvent("doj:client:xenonControllerMenuWorkStation")
			CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
			TriggerServerEvent('updateVehicle', CurrentVehicleData)
		else
			TriggerEvent("doj:client:xenonControllerMenuWorkStation")
			QBCore.Functions.Notify('You are missing Xenon Headlights', 'error', 3500)
		end
	end, "headlights")
end)

RegisterNetEvent('doj:client:xenonControllerMenuWorkStation', function()
	exports['qb-menu']:openMenu({
		{
			header = "Tuner Work Station: Xenon Lights",
			txt = "install Xenons",
			isMenuHeader = true
		},
		{
			header = "Install Xenons",
			params = {
				event = "doj:client:xenonQuickInstallWorkStation",
			}
		},
		{
			header = "Available colors",
			txt = "",
			params = {
				event = "doj:client:xenonControllerMenuListWorkStation",
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

RegisterNetEvent('doj:client:applyXenonColorWorkStation', function(args)  
    local args = tonumber(args)
    local playerPed	= PlayerPedId()
	local vehicle = GetVehiclePedIsIn(playerPed, false)
    TriggerEvent("doj:client:xenonControllerMenuListWorkStation")
	if args == 1 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4) 
		SetVehicleHeadlightsColour(vehicle, 0)
    elseif args == 2 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4) 
		SetVehicleHeadlightsColour(vehicle, -1)      
    elseif args == 3 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4) 
		SetVehicleHeadlightsColour(vehicle, 1)    
    elseif args == 4 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4) 
		SetVehicleHeadlightsColour(vehicle, 2)    
    elseif args == 5 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 3)
	elseif args == 6 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 4)    
	elseif args == 7 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 5)    
	elseif args == 8 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 6)    
	elseif args == 9 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 7)    
	elseif args == 10 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 8)    
	elseif args == 11 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 9)   
	elseif args == 12 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 10)    
	elseif args == 13 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 11)    
	elseif args == 14 then
		TriggerEvent("qb-customs:client:playSoundEffect", "wrench", 0.4)
		SetVehicleHeadlightsColour(vehicle, 12)    
    else
        TriggerEvent("doj:client:xenonControllerMenuWorkStation")  
        CurrentVehicleData = QBCore.Functions.GetVehicleProperties(vehicle)
        TriggerServerEvent('updateVehicle', CurrentVehicleData)
    end
end)

RegisterNetEvent('doj:client:xenonControllerMenuListWorkStation', function()
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
					event = "doj:client:applyXenonColorWorkStation",
					args = 1
				}
			},
			{
				header = "Ice blue",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 2
				}
			},
			{
				header = "Blue",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 3
				}
			},
			{
				header = "Electric Blue",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 4
				}
			},
			{
				header = "Mint Green",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 5
				}
			},
			{
				header = "Lime Green",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 6
				}
			},
			{
				header = "Yellow",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 7
				}
			},
			{
				header = "Golden",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 8
				}
			},
			{
				header = "Orange",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 9
				}
			},
			{
				header = "Red",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 10
				}
			},
			{
				header = "Pony Pink ",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 11
				}
			},
			{
				header = "Hot Pink",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 12
				}
			},
			{
				header = "Purple",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 13
				}
			},
			{
				header = "Blacklight",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 14
				}
			}, 
			{
				header = "< return",
				txt = "",
				params = {
					event = "doj:client:applyXenonColorWorkStation",
					args = 15
				}
			},
		})
end)


