local QBCore = exports['qb-core']:GetCoreObject()

--========================================================= CheckTunes
exports['qb-target']:AddTargetModel(`s_m_y_xmech_02`, {
    options = {
        {
            event = "doj:client:checkVehicleMods",
            icon = "fas fa-car",
            label = "Check Vehicle Mods",
        },
    },
    distance = 10.0 
}) 

local ImportShop= {
	{934.401, -966.435, 38.753 ,218.689, "s_m_y_xmech_02"},
	{130.925, -3029.502, 6.041 ,252.643, "s_m_y_xmech_02"},
}
CreateThread(function()
	for _,v in pairs(ImportShop) do
		RequestModel(GetHashKey(v[5]))
	  	while not HasModelLoaded(GetHashKey(v[5])) do
			Wait(1)
	  	end
	  	RequestAnimDict("amb@world_human_smoking@male@male_a@base")
	  	while not HasAnimDictLoaded("amb@world_human_smoking@male@male_a@base") do
			Wait(1)
	  	end
	  	ped =  CreatePed(0, v[5],v[1],v[2],v[3], false, true)
	  	SetEntityHeading(ped, v[4])
	  	FreezeEntityPosition(ped, true)
	  	SetEntityInvincible(ped, true)
	  	SetBlockingOfNonTemporaryEvents(ped, true)
	  	TaskPlayAnim(ped,"amb@world_human_smoking@male@male_a@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
	end
end)

RegisterNetEvent('doj:client:checkVehicleMods', function()
	local ped = PlayerPedId()
	local veh = GetVehiclePedIsIn(ped, false)
	local time = 5000
	local plate = GetVehicleNumberPlateText(veh)
	if IsPedInAnyVehicle(ped, false) then
		if Config.isVehicleOwned then
			QBCore.Functions.TriggerCallback('qb-garage:server:checkVehicleOwner', function(owned)
				if owned then
					QBCore.Functions.Progressbar("Checking-mods", "Checking for Vehicle Mods...", time, false, true, {
						disableMovement = true,
						disableCarMovement = false,
						disableMouse = false,
						disableCombat = true,
					}, {}, {}, {}, function() -- Done
						SetVehicleEngineOn(veh, false, false, true)
						checkVehicleMods()
						SetVehicleEngineOn(veh, true, false, false) 
					end, function()
						QBCore.Functions.Notify("Cancelled..", "error")
					end)
				else
					QBCore.Functions.Notify("Nobody owns this vehicle", "error", 3500)
				end
			end, plate)
		else
			QBCore.Functions.Progressbar("Checking-mods", "Checking for Vehicle Mods...", time, false, true, {
				disableMovement = true,
				disableCarMovement = false,
				disableMouse = false,
				disableCombat = true,
			}, {}, {}, {}, function() -- Done
				SetVehicleEngineOn(veh, false, false, true)
				checkVehicleMods()
				SetVehicleEngineOn(veh, true, false, false) 
			end, function()
				QBCore.Functions.Notify("Cancelled..", "error")
			end)
		end
	else
        QBCore.Functions.Notify("Cant help you without a vehicle!", "error", 3500)
	end
end)

function checkVehicleMods()
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


