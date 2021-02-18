ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        local vehiclePed = GetVehiclePedIsIn(playerPed,false)
        if vehiclePed ~= nil then
            VehicleEngine(vehiclePed)
            for i,rowMarkers in pairs(Config.Markers) do
                local vhPos = GetEntityCoords(vehiclePed)
                local distVehicle = Vdist(vhPos.x, vhPos.y, vhPos.z, rowMarkers.pos.x, rowMarkers.pos.y, rowMarkers.pos.z)
                local vhHeading = GetEntityHeading(vehiclePed) - 180.0
                if distVehicle < 1.5 then
                    if vehiclePed and vhHeading < 10.0 and vhHeading > -10.0 then
                        alert('Press ~INPUT_HUD_SPECIAL~ To Charger')
                        if IsControlJustPressed(1, 48) then
                            AddFuelVehicle(rowMarkers,vehiclePed,distVehicle)
                        end
                    end
                end
            end 
        end
        Citizen.Wait(0)
    end
end)

Citizen.CreateThread(function() -- CreateBlips And Marker
    playerPed = GetPlayerPed(-1)
    while true do
        CreateBlipAll()
        CreateMarkerAll()
        Citizen.Wait(0)
    end
end)