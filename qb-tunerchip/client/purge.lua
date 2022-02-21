-- local DEFAULT_PURGE_CONFIG = {
--   infernus = {
--     [1] = {
--       scale: 0.5,
--       density: 3,
--       color: { 255, 255, 255 },
--       position: { 0.0, 0.0, 0.0 },
--       rotation: { 0.0, 0.0, 0.0 }
--     }
--   }
-- }

--------------------------------------------------------------------------------

-- local modelConfig = {}
-- local entityConfig = {}
--
-- local function AddVehicleModelNitroPurgeNozzle() end
-- local function RemoveVehicleModelNitroPurgeNozzle() end
-- local function SetVehicleModelNitroPurgeNozzleScale() end
-- local function SetVehicleModelNitroPurgeNozzleDensity() end
-- local function SetVehicleModelNitroPurgeNozzleColor() end
-- local function SetVehicleModelNitroPurgeNozzlePosition() end
-- local function SetVehicleModelNitroPurgeNozzleRotation() end
--
-- local function AddVehicleNitroPurgeNozzle() end
-- local function RemoveVehicleNitroPurgeNozzle() end
-- local function SetVehicleNitroPurgeNozzleScale() end
-- local function SetVehicleNitroPurgeNozzleDensity() end
-- local function SetVehicleNitroPurgeNozzleColor() end
-- local function SetVehicleNitroPurgeNozzlePosition() end 
-- local function SetVehicleNitroPurgeNozzleRotation() end

--------------------------------------------------------------------------------

local vehicles = {}
local particles = {}

function IsVehicleNitroPurgeEnabled(vehicle)
  return vehicles[vehicle] == true
end

function SetVehicleNitroPurgeEnabled(vehicle, enabled)
  if IsVehicleNitroPurgeEnabled(vehicle) == enabled then
    return
  end

  if enabled then
    local bone = GetEntityBoneIndexByName(vehicle, 'bumper_f')
    local pos = GetWorldPositionOfEntityBone(vehicle, bone)
    local off = GetOffsetFromEntityGivenWorldCoords(vehicle, pos.x, pos.y, pos.z)
    local ptfxs = {}

    for i=0,3 do
      local leftPurge = CreateVehiclePurgeSpray(vehicle, off.x - 1.65, off.y + 0.50, off.z + -0.3, 60.0, -20.0, 0.0, 0.4)
      local rightPurge = CreateVehiclePurgeSpray(vehicle, off.x + -0.12, off.y + 0.50, off.z + -0.3  , 60.0, 20.0, 0.0, 0.4)

      table.insert(ptfxs, leftPurge)
      table.insert(ptfxs, rightPurge)
    end

    vehicles[vehicle] = true
    particles[vehicle] = ptfxs
  else
    if particles[vehicle] and #particles[vehicle] > 0 then
      for _, particleId in ipairs(particles[vehicle]) do
        StopParticleFxLooped(particleId)
      end
    end

    vehicles[vehicle] = nil
    particles[vehicle] = nil
  end
end

function CreateVehiclePurgeSpray(vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale)
  UseParticleFxAssetNextCall('core')
  return StartParticleFxLoopedOnEntity('ent_sht_steam', vehicle, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, false, false, false)
end

RegisterCommand('purge', function()
  local vehModel = GetEntityModel(currentVehicle)
  local player = PlayerPedId()
  local vehicle = GetVehiclePedIsIn(player)
  
  SetVehicleNitroPurgeEnabled(vehicle, true)
  Wait(2000)
  SetVehicleNitroPurgeEnabled(vehicle, false)
end)


function CreateVehicleLightTrail(vehicle, bone, scale)
  UseParticleFxAssetNextCall('core')
  local ptfx = StartParticleFxLoopedOnEntityBone('veh_light_red_trail', vehicle, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, bone, scale, false, false, false)
  SetParticleFxLoopedEvolution(ptfx, "speed", 1.0, false)
  return ptfx
end

function StopVehicleLightTrail(ptfx, duration)
  Citizen.CreateThread(function()
    local startTime = GetGameTimer()
    local endTime = GetGameTimer() + duration
    while GetGameTimer() < endTime do 
      Citizen.Wait(0)
      local now = GetGameTimer()
      local scale = (endTime - now) / duration
      SetParticleFxLoopedScale(ptfx, scale)
      SetParticleFxLoopedAlpha(ptfx, scale)
    end
    StopParticleFxLooped(ptfx)
  end)
end