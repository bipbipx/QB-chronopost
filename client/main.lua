QBCore = exports['qb-core']:GetCoreObject()

local vanModel = 'burrito'  -- Modèle du véhicule, peut être changé selon votre choix

-- Fonction pour faire apparaître le van
function SpawnVan()
    QBCore.Functions.SpawnVehicle(vanModel, function(veh)
        SetVehicleNumberPlateText(veh, "CHRONO" .. tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, Config.VehicleSpawnPoint.heading)
        SetVehicleOnGroundProperly(veh)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
    end, Config.VehicleSpawnPoint.coords, true)
end

-- Fonction pour démarrer les livraisons
function StartDeliveries()
    SpawnVan()  -- Appel de la fonction pour faire apparaître le van
    QBCore.Functions.Notify("Prenez le van et commencez les livraisons.", "primary", 7500)

    for i, loc in ipairs(Config.DeliveryLocations) do
        Citizen.Wait(1000)  -- Un petit délai avant de commencer à recevoir les emplacements de livraison
        DeliverPackage(loc)
    end
end

-- Fonction pour gérer la livraison à un point spécifique
function DeliverPackage(loc)
    local delivered = false
    local blip = AddBlipForCoord(loc.x, loc.y, loc.z)
    SetBlipRoute(blip, true)

    while not delivered do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())
        if #(playerCoords - loc) < 20.0 then
            QBCore.Functions.DrawText3D(loc.x, loc.y, loc.z, "[E] Livrer le colis")
            if IsControlJustReleased(0, 38) then  -- 'E' pour livrer
                delivered = true
                RemoveBlip(blip)
                TriggerServerEvent('qb-chronopost:packageDelivered')
                QBCore.Functions.Notify("Colis livré!", "success", 5000)
            end
        end
    end
end

RegisterNetEvent('qb-chronopost:startDeliveries')
AddEventHandler('qb-chronopost:startDeliveries', function()
    StartDeliveries()
end)

RegisterNetEvent('qb-chronopost:allPackagesDelivered')
AddEventHandler('qb-chronopost:allPackagesDelivered', function()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    if IsVehicleModel(vehicle, GetHashKey(vanModel)) then
        QBCore.Functions.DeleteVehicle(vehicle)
    end
    QBCore.Functions.Notify("Toutes les livraisons sont terminées. Retournez le van.", "info", 5000)
end)
