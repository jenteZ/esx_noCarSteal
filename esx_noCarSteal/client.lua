Citizen.CreateThread(function() 
    while true do              
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId())) then
            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId())
            local lock = GetVehicleDoorLockStatus(veh)

            if lock == 7 then
                SetVehicleDoorsLocked(veh, 2)
            end
                 
            local pedd = GetPedInVehicleSeat(veh, -1)

            if pedd then                   
                SetPedCanBeDraggedOut(pedd, false)
            end             
        end   
        Citizen.Wait(0)                                    
    end
end)


Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = GetPlayerPed(-1)
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
            local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
            local lock = GetVehicleDoorLockStatus(veh)
            if lock == 4 then
                ClearPedTasks(ped)
            end
        end
    end
end)