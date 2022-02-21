local QBCore = exports['qb-core']:GetCoreObject()

--========================================================= CheckTunes
RegisterNetEvent('doj:client:checkVehicleModsWorkStation', function() 
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local plate = GetVehicleNumberPlateText(veh)
	QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
		if HasItem then
			QBCore.Functions.Progressbar("repair-clean", "Plugging in OBD2 Scanner...", 5000, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				QBCore.Functions.Notify("Scanner ready")
				exports["memorygame"]:thermiteminigame(Config.minigame.correctBlocks, Config.minigame.incorrectBlocks, Config.minigame.timetoShow, Config.minigame.timetoLose,
				function()
					QBCore.Functions.Notify('Input was accepted', "success")
					QBCore.Functions.Progressbar("accepted", "Requesting info...", 3700, false, true, {
						disableMovement = true,
						disableCarMovement = true,
						disableMouse = false,
						disableCombat = true,
					}, {}, {}, {}, function() -- Done
						checkVehicleModsWorkStation()
						TriggerEvent("doj:client:workStationMainMenuExtra")
					end, function() -- Cancel
						QBCore.Functions.Notify("Canceled!", "error")
					end)
				end,
				function()
					TriggerEvent("doj:client:workStationMainMenuExtra")
					QBCore.Functions.Notify('Unable to check for mods, keep trying!', "error")
				end)
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		else
			TriggerEvent("doj:client:workStationMainMenuExtra")
			QBCore.Functions.Notify('You are missing a OBD2 Scanner', 'error', 3500)
		end
	end, "obd_scanner") 
end)


function checkVehicleModsWorkStation()
	local ped = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(ped)
	local vehProps = QBCore.Functions.GetVehicleProperties(vehicle)
	local model = GetEntityModel(vehicle)
	local modelName = GetDisplayNameFromVehicleModel(model)
	local modCount = GetNumVehicleMods(vehicle, modType)
	vehProps.modEngine = vehProps.modEngine + 1
	vehProps.modBrakes = vehProps.modBrakes + 1
	vehProps.modSuspension = vehProps.modSuspension + 1
	vehProps.modTransmission = vehProps.modTransmission + 1
	vehProps.windowTint = vehProps.windowTint + 1
	TriggerEvent('doj:client:workStationOptions')
	if Config.checkTunesMessage == "chat" then
		TriggerEvent('chat:addMessage', { 
			template = '<div class="chat-message advert"><div class="chat-message-body"><strong>Sport Race | Diagnostics</strong><br>Model: {0}<br>Tint: {1}<br>Brakes: {2}<br>Engine: {3}<br>Suspension: {4}<br>Transmission: {5}<br>Turbo: {6}<br>Headlights: {7}</div>',
			args = {
				modelName,
				tostring(vehProps.windowTint).. '/6',
				tostring(vehProps.modBrakes).. '/' .. GetNumVehicleMods(vehicle, 12),
				tostring(vehProps.modEngine).. '/' .. GetNumVehicleMods(vehicle,11),
				tostring(vehProps.modSuspension).. '/' .. GetNumVehicleMods(vehicle,15),
				tostring(vehProps.modTransmission).. '/' .. GetNumVehicleMods(vehicle,13),
				tostring(vehProps.modTurbo),
				tostring(vehProps.modXenon),
			} 
		})
		QBCore.Functions.Notify("Vehicle Mod List Recieved", "success")
	elseif Config.checkTunesMessage == "phone" then 
		QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
			if HasItem then
				TriggerServerEvent('qb-phone:server:sendNewMail', {
					sender = "Tuning List",
					subject = "Vehicle Diagnostics",
					message = "Model: "..modelName.."<br />Tint: "..tostring(vehProps.windowTint).. "/6<br />Brakes: "..tostring(vehProps.modBrakes).. "/" .. GetNumVehicleMods(vehicle, 12).."<br />Engine: "..tostring(vehProps.modEngine).. "/" .. GetNumVehicleMods(vehicle,11).."<br />Suspension: "..tostring(vehProps.modSuspension).. "/" .. GetNumVehicleMods(vehicle,15).."<br />Transmission: "..tostring(vehProps.modTransmission).. "/" .. GetNumVehicleMods(vehicle,13).."<br />Turbo: "..tostring(vehProps.modTurbo).."<br />Xenons: "..tostring(vehProps.modXenon),
				})
				QBCore.Functions.Notify("Vehicle Mod List Recieved", "success")
			else
			  QBCore.Functions.Notify("Mod List was sent to your phone but you dont have one", "error" , 5000)
			end
		end, 'phone')
	end
end

