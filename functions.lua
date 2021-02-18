function CreateBlipAll()
    for _,rowBlip in pairs(Config.Blips) do
		local blip = AddBlipForCoord(rowBlip.pos)
		SetBlipSprite (blip, rowBlip.sprite)
		SetBlipDisplay(blip, rowBlip.display)
		SetBlipScale  (blip, rowBlip.scale)
		SetBlipColour (blip, rowBlip.colour)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(rowBlip.description)
		EndTextCommandSetBlipName(blip)
	end
end
RegisterCommand('setfuel', function(source,args) 
    print(args[1])
    SetVehicleFuelLevel(GetVehiclePedIsIn(playerPed, false), args[1]*1.0)
end)
function notify(string)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(string)
    DrawNotification(true, false)
end
function alert(msg)
    SetTextComponentFormat("STRING")
    AddTextComponentString(msg)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
function AddFuelVehicle(rowMarkers,vehiclePed)
     
    local vhFuel = GetVehicleFuelLevel(GetVehiclePedIsIn(playerPed, false))
    if  vhFuel == 100.0 then
        notify('Can\'t Charger Because Fuel Is Fully')
        return
    end
    notify('Please Wait Refueling..')
    while true do
        local vhPos = GetEntityCoords(vehiclePed)
        local distVehicle = Vdist(vhPos.x, vhPos.y, vhPos.z, rowMarkers.pos.x, rowMarkers.pos.y, rowMarkers.pos.z)
        if distVehicle < 1.5 then 
            local fuelVH = GetVehicleFuelLevel(vehiclePed)
            if fuelVH < 100.0 then
                SetVehicleFuelLevel(vehiclePed, fuelVH+1.0)
            else
                notify("Fuel Is Fully..")
                break
            end
        else 
            return
        end
        Citizen.Wait(500)
    end
end
function CreateMarkerAll()
    for i,rowMarkers in pairs(Config.Markers) do
        local pos = rowMarkers.pos
        local pedPos = GetEntityCoords(playerPed)
        local distance = Vdist(pedPos.x, pedPos.y, pedPos.z, pos.x, pos.y, pos.z)
        if distance < 20.0 then
            local scale = rowMarkers.scale
            local rgba = rowMarkers.rgba
            DrawMarker(rowMarkers.type, pos.x, pos.y, pos.z,
                0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                scale[1], scale[2], scale[3],
                rgba[1], rgba[2], rgba[3], rgba[4],
                false, true, 2, false, nil, nil, false)
        end
    end
end