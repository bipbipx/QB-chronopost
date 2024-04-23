fx_version 'cerulean'
game 'gta5'

author 'Bipbipx'
description 'Module de livraison Chronopost pour QB-Core'
version '1.0.0'

-- Dépendances nécessaires pour que le script fonctionne correctement
dependency 'qb-core'  -- Assure que qb-core est chargé avant votre script
dependency 'qb-banking'  -- Dépendance pour la gestion bancaire
dependency 'qb-newsjob'  -- Dépendance pour l'intégration avec le pôle emploi

shared_script '@qb-core/import.lua'  -- Importe les fonctions de base de QB-Core
shared_scripts {
    'config.lua'  -- Fichier de configuration partagé entre le client et le serveur
}

server_scripts {
    'client/main.lua'  -- Script côté serveur
}

client_scripts {
    'server/main.lua'  -- Script côté client
}


lua54 'yes'  -- Utilisez cette option si votre serveur exécute Lua 5.4
