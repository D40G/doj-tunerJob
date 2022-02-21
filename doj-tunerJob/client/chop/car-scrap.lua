
local QBCore = exports['qb-core']:GetCoreObject()

local disablecontrols = false
local allowedchop = true
local clientcooldown = false
local chopstarted = false
local deliveryspot = false
local chopdoor1 = false
local door1gone = false
local door1delivered = false
local chopdoor2 = false
local door2gone = false
local door2delivered = false
local chopdoor3 = false
local door3gone = false
local door3delivered = false
local chopdoor4 = false
local door4gone = false
local door4delivered = false
local chopdoor5 = false
local door5gone = false
local door5delivered = false
local chopdoor6 = false
local door6gone = false
local door6delivered = false
local chopdoor7 = false
local door7gone = false
local door7delivered = false
local chopdoor8 = false
local door8gone = false
local door8delivered = false

CarParts = {  --- 
    [1] = {["x"] = -1171.407, ["y"] = -2022.084, ["z"] = 13.188}, --- Driver Door
    [2] = {["x"] = -1168.504, ["y"] = -2024.773, ["z"] = 13.188}, --- Door 2
    [3] = {["x"] = -1172.122, ["y"] = -2022.964, ["z"] = 13.188}, --- Door 3
    [4] = {["x"] = -1169.503, ["y"] = -2025.63,  ["z"] = 13.188}, --- Door 4
    [5] = {["x"] = -1168.649, ["y"] = -2023.898, ["z"] = 13.161}, --- Hood
	[6] = {["x"] = -1173.204, ["y"] = -2024.876, ["z"] = 13.162}, --- Trunk
	[7] = {["x"] = -1171.524, ["y"] = -2023.18, ["z"] = 13.162}, --- Finish Car/Radio
}

ChopCarLocation = {
    [1] = {["x"] = -1170.757, ["y"] = -2024.234, ["z"] = 13.162},  
    [2] = {["x"] = -1164.609, ["y"] = -2022.647, ["z"] = 13.161}, 
}

if Config.Chop.Active then 
	local chopVehicleZone = CircleZone:Create(vector3(-1170.757, -2024.234, 13.162), 3.0, {
		name="chopcars",
		heading=0.0,
		debugPoly=Config.Chop.DebugZone,
		useZ=true,
	})
	chopVehicleZone:onPlayerInOut(function(isPointInside)
		if isPointInside and not chopstarted then
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				QBCore.Functions.GetPlayerData(function(PlayerData)
					if PlayerData.job.name == "tuner" then
						text = Config.Chop.ChopZoneText
						exports['textUi']:DrawTextUi('show', text)
						TriggerEvent("doj:client:chopShopMenu")
					else
						-- do nothing if they dont work as a tuner
						text = 'Not a tuner'
						exports['textUi']:DrawTextUi('show', text)
					end
				end)
			else
				text = Config.Chop.ChopZoneText..'</p>Vehicle is required!'
				exports['textUi']:DrawTextUi('show', text)
			end
		else
			exports['qb-menu']:closeMenu()
			exports['textUi']:HideTextUi('hide')
		end
	end)
	RegisterNetEvent('doj:client:chopShopMenu', function()
		exports['qb-menu']:showHeader({
			{
				header = "Vehicle Chopping",
				text = "collect usefull recources",
				isMenuHeader = true,
			},
			{
				header = "start", 
				txt = "",
				params = {
					event = "doj:client:startChopping",
				}
			},
		})
	end)
end

RegisterNetEvent('doj:client:startChopping', function()
	local myped = PlayerPedId()
	local vehicle2 = GetVehiclePedIsIn(myped, false)
	exports['textUi']:HideTextUi('hide')   
	if (GetPedInVehicleSeat(vehicle2, -1) == myped) then
		if not clientcooldown then
			local plate = GetVehicleNumberPlateText(vehicle2)
			TriggerServerEvent('doj:server:forceRemoveFromCar', plate)
			StartChopThisCar()
			Wait(1000)
			clientcooldown = true
		elseif clientcooldown and not chopstarted then
			QBCore.Functions.Notify("There is currently a cooldown for you, You must wait longer before doing this again.", "error")
		end
	else
		QBCore.Functions.Notify("You need to be the driver.", "error")	
	end
end)

function CarryingPart(partID)
	if DoesEntityExist(partID) then
		AttachEntityToEntity(partID, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.4, 0, 0, 0, 270.0, 60.0, true, true, false, true, 1, true)
		ClearPedTasks(PlayerPedId())
	else
		return
	end
	local Packaging = true
	loadAnimDict("anim@heists@narcotics@trash")
	while Packaging do Wait(5)
		if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@narcotics@trash", "walk", 3) then
			TaskPlayAnim(PlayerPedId(), "anim@heists@narcotics@trash", "walk", 8.0, 8.0, -1, 50, 0, false, false, false)
		end
		if not IsEntityAttachedToEntity(partID, PlayerPedId()) then
			Packaging = false
			DeleteEntity(partID)
		else
			local PedPosition = GetEntityCoords(PlayerPedId())
			local DistanceCheck = GetDistanceBetweenCoords(PedPosition, ChopCarLocation[2]["x"], ChopCarLocation[2]["y"], ChopCarLocation[2]["z"], true)
			QBCore.Functions.DrawText3D(ChopCarLocation[2]["x"], ChopCarLocation[2]["y"], ChopCarLocation[2]["z"] - 0.1, "[E] - Deliver Part")
			if DistanceCheck <= 2.0 then
				if IsControlJustPressed(0, 38) then
					disablecontrols = true
					DeleteEntity(partID)
					ClearPedTasksImmediately(PlayerPedId())
					Packaging = false
					if door1gone then
						TriggerServerEvent('doj:server:chopReward')
						door1gone = false
						door1delivered = true
						disablecontrols = false
						QBCore.Functions.Notify("Part Successfully Chopped", "success")
					elseif door2gone then
						TriggerServerEvent('doj:server:chopReward')
						door2gone = false
						door2delivered = true
						disablecontrols = false
						QBCore.Functions.Notify("Part Successfully Chopped", "success")
					elseif door3gone then
						TriggerServerEvent('doj:server:chopReward')
						door3gone = false
						door3delivered = true
						disablecontrols = false
						QBCore.Functions.Notify("Part Successfully Chopped", "success")
					elseif door4gone then
						TriggerServerEvent('doj:server:chopReward')
						door4gone = false
						door4delivered = true
						disablecontrols = false
						QBCore.Functions.Notify("Part Successfully Chopped", "success")
					end
				end
			end
		end
	end
end

function CarryingPartHood(partID)
	if DoesEntityExist(partID) then
		AttachEntityToEntity(partID, PlayerPedId(), GetPedBoneIndex(PlayerPedId(),  28422), 0.0, -0.03, 0.0, 5.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
		ClearPedTasks(PlayerPedId())
	else
		return
	end
	local Packaging = true
	loadAnimDict("anim@heists@box_carry@")
	while Packaging do Wait(5)
		if not IsEntityPlayingAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 3) then
			TaskPlayAnim(PlayerPedId(), "anim@heists@box_carry@", "idle", 8.0, 8.0, -1, 50, 0, false, false, false)
		end
		if not IsEntityAttachedToEntity(partID, PlayerPedId()) then
			Packaging = false
			DeleteEntity(partID)
		else
			local PedPosition = GetEntityCoords(PlayerPedId())
			local DistanceCheck = GetDistanceBetweenCoords(PedPosition, ChopCarLocation[2]["x"], ChopCarLocation[2]["y"], ChopCarLocation[2]["z"], true)
			QBCore.Functions.DrawText3D(ChopCarLocation[2]["x"], ChopCarLocation[2]["y"], ChopCarLocation[2]["z"] - 0.1, "[E] - Deliver Part")
			if DistanceCheck <= 2.0 then
				if IsControlJustPressed(0, 38) then
					DeleteEntity(partID)
					disablecontrols = true
					ClearPedTasksImmediately(PlayerPedId())
					Packaging = false
					if door5gone then
						TriggerServerEvent('doj:server:chopReward')
						door5gone = false
						door5delivered = true
						disablecontrols = false
						disablecontrols = false
						QBCore.Functions.Notify("Part Successfully Chopped", "success")
					elseif door6gone then
						TriggerServerEvent('doj:server:chopReward')
						door6gone = false
						disablecontrols = false
						door6delivered = true
						disablecontrols = false
						QBCore.Functions.Notify("Part Successfully Chopped", "success")
					elseif door7gone then
						TriggerServerEvent('doj:server:chopReward')
						door7gone = false
						disablecontrols = false
						door7delivered = true
						disablecontrols = false
						QBCore.Functions.Notify("Part Successfully Chopped", "success")
					elseif door8gone then
						TriggerServerEvent('doj:server:chopReward')
						door7gone = false
						disablecontrols = false
						door7delivered = true
						disablecontrols = false
						QBCore.Functions.Notify("Part Successfully Chopped", "success")
					end
				end
			end
		end
	end
end


function ChopDoors()
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local veh = GetClosestVehicle(ChopCarLocation[1]["x"], ChopCarLocation[1]["y"], ChopCarLocation[1]["z"], 4.001, 0, 70)
	local waitTime = 15000
	if chopdoor1 then
		SetVehicleDoorOpen(veh, 0, false, false)
        TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_WELDING", 0, true)
		QBCore.Functions.Notify("Taking off Door...", "primary")
		Wait(waitTime)
		QBCore.Functions.Notify("Door removed", "success")
		SetVehicleDoorBroken(veh, 0, true)
		ClearPedTasksImmediately(plyPed)
		chopdoor1 = false
		door1gone = true
		disablecontrols = false
		local PackageObject = CreateObject(GetHashKey("prop_car_door_01"), CarParts[1]["x"], CarParts[1]["y"], CarParts[1]["z"], true)
		SetEntityCollision(PackageObject, false, false)
		PlaceObjectOnGroundProperly(PackageObject)
		Wait(1000)
		CarryingPart(PackageObject)
	elseif chopdoor2 then
		SetVehicleDoorOpen(veh, 1, false, false)
		TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_WELDING", 0, true)
		QBCore.Functions.Notify("Taking off Door...", "primary")
		Wait(waitTime)
		QBCore.Functions.Notify("Door removed", "success")
		SetVehicleDoorBroken(veh, 1, true)
		ClearPedTasksImmediately(plyPed)
		chopdoor2 = false
		door2gone = true
		disablecontrols = false
		local PackageObject = CreateObject(GetHashKey("prop_car_door_01"), CarParts[2]["x"], CarParts[2]["y"], CarParts[2]["z"], true)
		SetEntityCollision(PackageObject, false, false)
		PlaceObjectOnGroundProperly(PackageObject)
		Wait(1000)
		CarryingPart(PackageObject)
	elseif chopdoor3 then
		SetVehicleDoorOpen(veh, 2, false, false)
		TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_WELDING", 0, true)
		QBCore.Functions.Notify("Taking off Door...", "primary")
		Wait(waitTime)
		QBCore.Functions.Notify("Door removed", "success")
		SetVehicleDoorBroken(veh, 2, true)
		ClearPedTasksImmediately(plyPed)
		chopdoor3 = false
		door3gone = true
		disablecontrols = false
		local PackageObject = CreateObject(GetHashKey("prop_car_door_01"), CarParts[3]["x"], CarParts[3]["y"], CarParts[3]["z"], true)
		SetEntityCollision(PackageObject, false, false)
		PlaceObjectOnGroundProperly(PackageObject)
		Wait(1000)
		CarryingPart(PackageObject)
	elseif chopdoor4 then
		SetVehicleDoorOpen(veh, 3, false, false)
		TaskStartScenarioInPlace(plyPed, "WORLD_HUMAN_WELDING", 0, true)
		QBCore.Functions.Notify("Taking off Door...", "primary")
		Wait(waitTime)
		QBCore.Functions.Notify("Door removed", "success")
		SetVehicleDoorBroken(veh, 3, true)
		ClearPedTasksImmediately(plyPed)
		chopdoor4 = false
		door4gone = true
		disablecontrols = false
		local PackageObject = CreateObject(GetHashKey("prop_car_door_01"), CarParts[4]["x"], CarParts[4]["y"], CarParts[4]["z"], true)
		SetEntityCollision(PackageObject, false, false)
		PlaceObjectOnGroundProperly(PackageObject)
		Wait(1000)
		CarryingPart(PackageObject)
	elseif chopdoor5 then
		SetVehicleDoorOpen(veh, 4, false, false)
		TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_BUM_BIN", 0, true)
		QBCore.Functions.Notify("Taking off Hood...", "primary")
		Wait(waitTime)
		QBCore.Functions.Notify("Hood removed", "success")
		SetVehicleDoorBroken(veh, 4, true)
		ClearPedTasksImmediately(plyPed)
		chopdoor5 = false
		door5gone = true
		disablecontrols = false
		local PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), CarParts[5]["x"], CarParts[5]["y"], CarParts[5]["z"], true)
		SetEntityCollision(PackageObject, false, false)
		PlaceObjectOnGroundProperly(PackageObject)
		Wait(1000)
		CarryingPartHood(PackageObject)
	elseif chopdoor6 then
		SetVehicleDoorOpen(veh, 5, false, false)
		TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_BUM_BIN", 0, true)
		QBCore.Functions.Notify("Taking off Trunk...", "primary")
		Wait(waitTime)
		QBCore.Functions.Notify("Trunk removed", "success")
		SetVehicleDoorBroken(veh, 5, true)
		ClearPedTasksImmediately(plyPed)
		chopdoor6 = false
		door6gone = true
		disablecontrols = false
		local PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), CarParts[6]["x"], CarParts[6]["y"], CarParts[6]["z"], true)
		SetEntityCollision(PackageObject, false, false)
		PlaceObjectOnGroundProperly(PackageObject)
		Wait(1000)
		CarryingPartHood(PackageObject)
	elseif chopdoor7 then
		TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_BUM_BIN", 0, true)
		QBCore.Functions.Notify("Removing Radio...", "primary")
		Wait(waitTime)
		QBCore.Functions.Notify("Radio removed", "success")
		ClearPedTasksImmediately(plyPed)
		chopdoor7 = false
		door7gone = true
		disablecontrols = false
		local PackageObject = CreateObject(GetHashKey("prop_cs_cardbox_01"), CarParts[7]["x"], CarParts[7]["y"] + 0.1, CarParts[7]["z"], true)
		SetEntityCollision(PackageObject, false, false)
		PlaceObjectOnGroundProperly(PackageObject)
		Wait(1000)
		CarryingPartHood(PackageObject)
	elseif chopdoor8 then
		TaskStartScenarioInPlace(plyPed, "PROP_HUMAN_BUM_BIN", 0, true)
		QBCore.Functions.Notify("Chopping vehicle...", "primary")
		Wait(waitTime)
		ClearPedTasksImmediately(plyPed)
		TriggerServerEvent('doj:server:chopRewardEntireVehicle')
		local vehchopping = GetClosestVehicle(ChopCarLocation[1]["x"], ChopCarLocation[1]["y"], ChopCarLocation[1]["z"], 4.001, 0, 70)
		chopstarted = false
		SetEntityAsNoLongerNeeded(vehchopping)
		DeleteEntity(vehchopping)
		QBCore.Functions.Notify("Sucessfully Chopped The Vehicle", "success")
		ResetChopping()
	end
end



CreateThread(function ()
	local ped = PlayerPedId()
	while true do Wait(0)
		if allowedchop and chopstarted and not door1gone and not door1delivered then 
			DrawMarker(27,CarParts[1]["x"], CarParts[1]["y"], CarParts[1]["z"] - 1.0, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[1]["x"], CarParts[1]["y"], CarParts[1]["z"], true ) < 1.0 and not chopdoor1 then
				QBCore.Functions.DrawText3D(CarParts[1]["x"], CarParts[1]["y"], CarParts[1]["z"] - 0.1, '[E] - Remove Driver Door')
				if(IsControlJustPressed(1, 38)) then
					disablecontrols = true
					chopdoor1 = true
					ChopDoors()
				end
			end
	  	end
	  	if allowedchop and chopstarted and not door2gone and door1delivered and not door2delivered then 
			DrawMarker(27,CarParts[2]["x"], CarParts[2]["y"], CarParts[2]["z"] - 0.8, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[2]["x"], CarParts[2]["y"], CarParts[2]["z"], true ) < 1.0 and not chopdoor2 then
				QBCore.Functions.DrawText3D(CarParts[2]["x"], CarParts[2]["y"], CarParts[2]["z"] - 0.1, "[E] - Remove Passenger Door")
				if(IsControlJustPressed(1, 38)) then
					disablecontrols = true
					chopdoor2 = true
					ChopDoors()
				end
			end
	  	end
	  	if allowedchop and chopstarted and not door3gone and door2delivered and not door3delivered then 
			DrawMarker(27,CarParts[3]["x"], CarParts[3]["y"], CarParts[3]["z"] - 0.8, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[3]["x"], CarParts[3]["y"], CarParts[3]["z"], true ) < 1.0 and not chopdoor3 then
				QBCore.Functions.DrawText3D(CarParts[3]["x"], CarParts[3]["y"], CarParts[3]["z"] - 0.1, "[E] - Remove Rear Driver Door")
				if(IsControlJustPressed(1, 38)) then
					disablecontrols = true
					chopdoor3 = true
					ChopDoors()
				end
			end
	  	end
	  	if allowedchop and chopstarted and not door4gone and door3delivered and not door4delivered then 
			DrawMarker(27,CarParts[4]["x"], CarParts[4]["y"], CarParts[4]["z"] - 0.8, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[4]["x"], CarParts[4]["y"], CarParts[4]["z"], true ) < 1.0 and not chopdoor4 then
				QBCore.Functions.DrawText3D(CarParts[4]["x"], CarParts[4]["y"], CarParts[4]["z"] - 0.1, "[E] - Remove Rear Passenger Door")
				if(IsControlJustPressed(1, 38)) then
					disablecontrols = true
					chopdoor4 = true
					ChopDoors()
				end
			end
	  	end
	  	if allowedchop and chopstarted and not door5gone and door4delivered and not door5delivered then 
			DrawMarker(27,CarParts[5]["x"], CarParts[5]["y"], CarParts[5]["z"] - 0.8, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[5]["x"], CarParts[5]["y"], CarParts[5]["z"], true ) < 1.0 and not chopdoor5 then
				QBCore.Functions.DrawText3D(CarParts[5]["x"], CarParts[5]["y"], CarParts[5]["z"] - 0.1, tostring("[E] - Remove Hood"))
				if(IsControlJustPressed(1, 38)) then
					disablecontrols = true
					chopdoor5 = true
					ChopDoors()
				end
			end
	  	end
	  	if allowedchop and chopstarted and not door6gone and door5delivered and not door6delivered then 
			DrawMarker(27,CarParts[6]["x"], CarParts[6]["y"], CarParts[6]["z"] - 0.8, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[6]["x"], CarParts[6]["y"], CarParts[6]["z"], true ) < 1.0 and not chopdoor6 then
				QBCore.Functions.DrawText3D(CarParts[6]["x"], CarParts[6]["y"], CarParts[6]["z"] - 0.1, tostring("[E] - Remove Trunk"))
				if(IsControlJustPressed(1, 38)) then
					disablecontrols = true
					chopdoor6 = true
					ChopDoors()
				end
			end
	  	end
	  	if allowedchop and chopstarted and not door7gone and door6delivered and not door7delivered then 
			DrawMarker(27,CarParts[7]["x"], CarParts[7]["y"], CarParts[7]["z"] - 0.8, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[7]["x"], CarParts[7]["y"], CarParts[7]["z"], true ) < 1.0 and not chopdoor7 then
				QBCore.Functions.DrawText3D(CarParts[7]["x"], CarParts[7]["y"], CarParts[7]["z"] - 0.1, tostring("[E] - Remove Radio"))
				if(IsControlJustPressed(1, 38)) then
					disablecontrols = true 
					chopdoor7 = true
					ChopDoors()
				end
			end
	  	end
	  	if allowedchop and chopstarted and not door8gone and door7delivered and not door8delivered then 
			DrawMarker(27,CarParts[7]["x"], CarParts[7]["y"], CarParts[7]["z"] - 0.8, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 255, 255, 255, 155, 0, 0, 2, 0, 0, 0, 0)
			if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[7]["x"], CarParts[7]["y"], CarParts[7]["z"], true ) < 1.0 and not chopdoor8 then
				QBCore.Functions.DrawText3D(CarParts[7]["x"], CarParts[7]["y"], CarParts[7]["z"] - 0.1, tostring("[E] - Chop Entire Vehicle"))
				if(IsControlJustPressed(1, 38)) and not chopdoor8 then
					disablecontrols = true 
					chopdoor8 = true
					ChopDoors()
				end
			end
		end
	  	if GetDistanceBetweenCoords(GetEntityCoords(ped), CarParts[1]["x"], CarParts[1]["y"], CarParts[1]["z"], true ) > 50 and chopstarted then 
	  		tofaraway()
	  	end
	end
end)

RegisterNetEvent('doj:client:forceRemoveFromCar', function(plate)
    local myped = PlayerPedId()
    local myvehicle = GetVehiclePedIsIn(myped, false)
    local myPlate = GetVehicleNumberPlateText(myvehicle)
    if myPlate == plate then
        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), ChopCarLocation[1]["x"], ChopCarLocation[1]["y"], ChopCarLocation[1]["z"], true ) < 5.0 then 
            TaskLeaveAnyVehicle(myped)
        end
    end
end)

CreateThread(function ()
	while true do Wait(0)
		if clientcooldown then
			Wait(900000)
			clientcooldown = false
			QBCore.Functions.Notify("Chop Reset")
		end 
	end
end)

function ResetChopping()
	disablecontrols = false
	allowedchop = true
	chopstarted = false
	chopdoor1 = false
	door1gone = false
	door1delivered = false
	chopdoor2 = false
	door2gone = false
	door2delivered = false
	chopdoor3 = false
	door3gone = false
	door3delivered = false
	chopdoor4 = false
	door4gone = false
	door4delivered = false
	chopdoor5 = false
	door5gone = false
	door5delivered = false
	chopdoor6 = false
	door6gone = false
	door6delivered = false
	chopdoor7 = false
	door7gone = false
	door7delivered = false
	chopdoor8 = false
	door8gone = false
	door8delivered = false
	deliveryspot = false
end

function tofaraway()
	local vehchopping = GetClosestVehicle(ChopCarLocation[1]["x"], ChopCarLocation[1]["y"], ChopCarLocation[1]["z"], 4.001, 0, 70)
	chopstarted = false
	DeleteEntity(vehchopping)
	QBCore.Functions.Notify("You moved to far away", "error")
end


function StartChopThisCar()
	local ped = PlayerPedId()
	local veh2 = GetVehiclePedIsIn (GetPlayerPed (-1), true)
	local vehiclePedIsIn = GetVehiclePedIsIn(ped, false)
	SetEntityCoords(veh2, ChopCarLocation[1]["x"], ChopCarLocation[1]["y"], ChopCarLocation[1]["z"])
	SetEntityHeading(veh2, 315.62)
	Wait(1)
	SetVehicleEngineOn(veh2, false, true)
	Wait(1)
	SetVehicleDoorOpen(veh2, 0, false, true)
	Wait(1)
	SetVehicleDoorOpen(veh2, 1, false, true)
	Wait(1)
	SetVehicleDoorOpen(veh2, 2, false, true)
	Wait(1)
	SetVehicleDoorOpen(veh2, 3, false, true)
	Wait(1)
	SetVehicleDoorOpen(veh2, 4, false, true)
	Wait(1)
	SetVehicleDoorOpen(veh2, 5, false, true)
	Wait(1)
	FreezeEntityPosition(veh2, true)
	Wait(1)
	TaskLeaveVehicle(ped, vehiclePedIsIn, 256)
	SetVehicleDoorsLocked(veh2, 2)
	SetEntityAsMissionEntity(veh2)
	Wait(1000)
	chopstarted = true
end

CreateThread(function()
	while true do
		Wait(1)
		local playerPed = PlayerPedId()
		if disablecontrols then
			DisableControlAction(1, 38, true) --Key: E
			DisableControlAction(1, 172, true) --Key: Up Arrow
			DisableControlAction(1, 173, true) --Key: Down Arrow
			DisableControlAction(1, 177, true) --Key: Backspace
			DisableControlAction(1, 176, true) --Key: Enter
			DisableControlAction(1, 71, true) --Key: W (veh_accelerate)
			DisableControlAction(1, 72, true) --Key: S (veh_brake)
			DisableControlAction(1, 34, true) --Key: A
			DisableControlAction(1, 35, true) --Key: D
			DisableControlAction(1, 75, true) --Key: F (veh_exit)
		else
			Wait(500)
		end
	end
end)