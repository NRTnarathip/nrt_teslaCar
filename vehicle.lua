Citizen.CreateThread(function()
    while true do 
        VehicleEngine(GetVehiclePedIsIn(playerPed))
        Citizen.Wait(0)
    end
end)