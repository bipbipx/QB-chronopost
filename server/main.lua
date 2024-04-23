QBCore = exports['qb-core']:GetCoreObject()

-- Débuter le job de livreur, vérifier si le joueur a le bon job
RegisterNetEvent('qb-chronopost:startJob', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.PlayerData.job.name == 'chronopost' then
        Player.Functions.AddItem('delivery_package', 10)  -- Simule la réception de colis à livrer
        TriggerClientEvent('QBCore:Notify', src, "Vous avez reçu vos colis, commencez les livraisons!", "success")
        TriggerClientEvent('qb-chronopost:startDeliveries', src)
    else
        TriggerClientEvent('QBCore:Notify', src, "Vous devez être employé de Chronopost pour effectuer ce job.", "error")
    end
end)

-- Gérer chaque livraison de colis
RegisterNetEvent('qb-chronopost:packageDelivered', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('delivery_package', 1)
    if Player.Functions.GetItemByName('delivery_package').amount == 0 then
        -- Tous les colis ont été livrés
        Player.Functions.AddMoney('bank', Config.Reward, "chronopost-delivery-bonus")  -- Ajout de la récompense directement à la banque
        TriggerClientEvent('QBCore:Notify', src, "Livraisons terminées, vous avez reçu $" .. Config.Reward .. " sur votre compte bancaire.", "success")
        TriggerClientEvent('qb-chronopost:allPackagesDelivered', src)
    end
end)

