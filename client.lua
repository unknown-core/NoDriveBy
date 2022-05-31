-- CONFIG --

-- Allow passengers to shoot
local passengerDriveBy = true

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1)

		playerPed = GetPlayerPed(-1)
		car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if GetPedInVehicleSeat(car, -1) == playerPed then
				SetPlayerCanDoDriveBy(PlayerId(), false)
			elseif passengerDriveBy then
				SetPlayerCanDoDriveBy(PlayerId(), true)
			else
				SetPlayerCanDoDriveBy(PlayerId(), false)
			end
		end
	end
end)
Citizen.CreateThread( function()
 while true do
    Citizen.Wait(1)
    RestorePlayerStamina(PlayerId(), 1.0)
	-- it's that simple
	end
end)

local isIntrunk = false

-- RegisterCommand('trunkgetin', function(source, args, rawCommand)
--  local pos = GetEntityCoords(GetPlayerPed(-1), false)
--  local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
--  if DoesEntityExist(vehicle) and GetVehicleDoorLockStatus(vehicle) == 1 and not kidnapped then
--   if not isIntrunk then
--    AttachEntityToEntity(GetPlayerPed(-1), vehicle, -1, 0.0, -2.2, 0.5, 0.0, 0.0, 0.0, false, false, false, false, 20, true)
--    RaiseConvertibleRoof(vehicle, false)
--    if IsEntityAttached(GetPlayerPed(-1)) then
--     RequestAnimDict('timetable@floyd@cryingonbed@base')
--     while not HasAnimDictLoaded('timetable@floyd@cryingonbed@base') do
--      Citizen.Wait(1)
--     end
--     TaskPlayAnim(GetPlayerPed(-1), 'timetable@floyd@cryingonbed@base', 'base', 1.0, -1, -1, 1, 0, 0, 0, 0)
--    end
--   end
--   isIntrunk = true
--  end
-- end)

-- RegisterCommand('trunkgetout', function(source, args, rawCommand)
--  local pos = GetEntityCoords(GetPlayerPed(-1), false)
--  local vehicle = GetClosestVehicle(pos.x, pos.y, pos.z, 5.0, 0, 71)
--  if DoesEntityExist(vehicle) and GetVehicleDoorLockStatus(vehicle) == 1 and not kidnapped then
--   if isIntrunk then
--    DetachEntity(GetPlayerPed(-1), 0, true)
--    SetEntityVisible(GetPlayerPed(-1), true)
--    ClearPedTasksImmediately(GetPlayerPed(-1))
--   end
--   isInTrunk = false
--  end
-- end)
