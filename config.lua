Config = {}

-- Coordonnées du bureau où les joueurs peuvent commencer le job de livreur
Config.JobStart = {
    coords = vector3(-268.41, -957.67, 31.22),
    name = "Chronopost Office",
    heading = 337.15
}

-- Point de spawn du véhicule de livraison
Config.VehicleSpawn = {
    coords = vector3(-272.37, -956.33, 31.22),
    heading = 318.46
}

-- Modèle du véhicule de livraison
Config.VehicleModel = 'burrito'

-- Points de livraison dans la ville
Config.DeliveryLocations = {
    { coords = vector3(103.23, -146.34, 54.20), label = "123 Street, Los Santos" },
    { coords = vector3(215.79, -142.67, 54.50), label = "124 Street, Los Santos" },
    { coords = vector3(120.52, -129.42, 54.56), label = "125 Street, Los Santos" },
    { coords = vector3(85.73, -117.55, 54.13), label = "126 Street, Los Santos" },
    { coords = vector3(52.75, -104.25, 54.67), label = "127 Street, Los Santos" },
    -- Ajoutez d'autres points au besoin
}

-- Paramètre pour la récompense finale après toutes les livraisons
Config.Reward = 500  -- La récompense en dollars pour la livraison complète des colis
