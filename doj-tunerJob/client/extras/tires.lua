
local QBCore = exports['qb-core']:GetCoreObject()
local propModel = nil
local propSpawned = nil

function GetClosestVehicleTire(vehicle)
	local tireBones = {"wheel_lf", "wheel_rf", "wheel_lm1", "wheel_rm1", "wheel_lm2", "wheel_rm2", "wheel_lm3", "wheel_rm3", "wheel_lr", "wheel_rr"}
	local tireIndex = {
		["wheel_lf"] = 0,
		["wheel_rf"] = 1,
		["wheel_lm1"] = 2,
		["wheel_rm1"] = 3,
		["wheel_lm2"] = 45,
		["wheel_rm2"] = 47,
		["wheel_lm3"] = 46,
		["wheel_rm3"] = 48,
		["wheel_lr"] = 4,
		["wheel_rr"] = 5,
	}
	local player = PlayerId()
	local plyPed = GetPlayerPed(player)
	local plyPos = GetEntityCoords(plyPed, false)
	local minDistance = 1.2
	local closestTire = nil
	for a = 1, #tireBones do
		local bonePos = GetWorldPositionOfEntityBone(vehicle, GetEntityBoneIndexByName(vehicle, tireBones[a]))
		local distance = Vdist(plyPos.x, plyPos.y, plyPos.z, bonePos.x, bonePos.y, bonePos.z)
		if closestTire == nil then
			if distance <= minDistance then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		else
			if distance < closestTire.boneDist then
				closestTire = {bone = tireBones[a], boneDist = distance, bonePos = bonePos, tireIndex = tireIndex[tireBones[a]]}
			end
		end
	end
	return closestTire
end

function loadAnimDict(dict)
	while (not HasAnimDictLoaded(dict)) do
		RequestAnimDict(dict)
		Wait(0)
	end
end

RegisterNetEvent('doj:client:replacePoppedTire', function()
	local animDict = "anim@heists@box_carry@"
	local playerPed		= PlayerPedId()
	local x,y,z = table.unpack(GetEntityCoords(playerPed))
	DetachEntity(propSpawned, 1, 1)
	DeleteObject(propSpawned)
	propSpawned = nil
	Wait(100)
	loadAnimDict(animDict)
	TaskPlayAnim(playerPed, animDict, "idle", 3.0, -8, -1, 63, 0, 0, 0, 0 )
	propModel = 'prop_wheel_tyre'
	bone = GetPedBoneIndex(playerPed, 60309)
	propSpawned = CreateObject(GetHashKey(propModel), x, y, z + 0.2, true, true, true)
	AttachEntityToEntity(propSpawned, playerPed, bone, 0.10, 0.26, 0.32, 90.0, 110.0, 0.0, true, true, false, true, 1, true)
end)

function deleteProp()
	exports['textUi']:DrawTextUi('hide')
	DetachEntity(propSpawned, 1, 1)
	DeleteObject(propSpawned)
	ClearPedTasks(PlayerPedId())
	propSpawned = nil
end

CreateThread(function()
	local playerPed	= PlayerPedId()
	while true do Wait(0)
		if propSpawned then
			if not IsPedInAnyVehicle(playerPed) then
				local coords = GetEntityCoords(playerPed)
				local vehicle = GetClosestVehicle(coords.x, coords.y, coords.z, 3.5, 0, 71)
				if vehicle ~= nil then
					local tire = GetClosestVehicleTire(vehicle)
					if tire ~= nil then 
						exports['textUi']:DrawTextUi('show', "Press [E] to replace tire")
						if IsControlJustPressed(1, 38) then
							exports['textUi']:DrawTextUi('show', "Replacing Tire")
							ClearPedSecondaryTask(playerPed)
							TaskStartScenarioInPlace(playerPed, 'world_human_gardener_plant', 0, false)
							Wait(5000)
							SetVehicleTyreFixed(vehicle, tire.tireIndex, 0, 1)
							TriggerServerEvent('doj:server:removeTire')
							deleteProp()
						end
					else
						exports['textUi']:DrawTextUi('show', "Move closer to a tire</br>Press [X] put away")
					end
				end
				if IsControlJustPressed(1, 73) then
					exports['textUi']:DrawTextUi('show', "Putting tire away")
					Wait(500)
					deleteProp()
				end
			end
		end
	end
end)


