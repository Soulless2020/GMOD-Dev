JoeFort = JoeFort or {}
/*

JoeFort:AddEnt("Barrier","Barriers",{
    classname = string,
    model = string,
    health = int,
    buildtime = int,
    neededresources = int,
    CanSpawn = function(ply, wep)

    end,
    OnSpawn = function(ply,ent)

    end,
    OnDamaged = function(ent, spawner, attacker)

    end,
    OnDestroyed = function(ent, spawner, attacker)

    end,
    OnRepaired = function(spawner, repairer, ent)

    end,
    OnRemoved = function(spawner, remover, ent)

    end,
    OnBuildEntitySpawned = function(spawner, ent)
    
    end,
})

*/

JoeFort.structs = {}
function JoeFort:AddEnt(name,category,data)
    if not name or not category or not data then return end
    if not data.classname or not data.model then return end
    JoeFort.structs[category] = JoeFort.structs[category] or {}

    data.name = name
    data.health = data.health or 100
    data.buildtime = data.buildtime or 10
    data.neededresources = data.neededresources or 25

    table.insert(JoeFort.structs[category], data)
end

function JoeFort:GetRessourcePool()
    return JoeFort.Ressources or 0
end

if file.Exists("sh_fort_config.lua", "LUA") then
    if SERVER then
        include("sh_fort_config.lua")
        AddCSLuaFile("sh_fort_config.lua")
    elseif CLIENT then
        include("sh_fort_config.lua")
    end
end

JoeFort.Ressources = JoeFort.Ressources or 250
if JoeFort.configoverride then return end

JoeFort:AddEnt("Concrete Barrier","Barriers",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/fortifications/concrete_barrier_02.mdl", -- enter the model name here, this is never the same as the classname
    health = 400, -- determines the health, 0 means invincible
    buildtime = 15, -- determines how long it takes to build
    neededresources = 50, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Sandbags","Barriers",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/valk/h4/unsc/props/sandbags/sandbags_straight.mdl", -- enter the model name here, this is never the same as the classname
    health = 250, -- determines the health, 0 means invincible
    buildtime = 5, -- determines how long it takes to build
    neededresources = 25, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Large Metal Barricade","Barriers",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/fortifications/metal_barrier_04.mdl", -- enter the model name here, this is never the same as the classname
    health = 1000, -- determines the health, 0 means invincible
    buildtime = 30, -- determines how long it takes to build
    neededresources = 100, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Large USNC","Barriers",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/valk/h4/unsc/props/barrier/blam_barrier_corner.mdl", -- enter the model name here, this is never the same as the classname
    health = 1100, -- determines the health, 0 means invincible
    buildtime = 30, -- determines how long it takes to build
    neededresources = 100, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Medium USNC","Barriers",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/valk/h4/unsc/props/barrier/barricade_large.mdl", -- enter the model name here, this is never the same as the classname
    health = 800, -- determines the health, 0 means invincible
    buildtime = 20, -- determines how long it takes to build
    neededresources = 75, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Small","Barriers",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/valk/h4/unsc/props/barrier/barrier.mdl", -- enter the model name here, this is never the same as the classname
    health = 550, -- determines the health, 0 means invincible
    buildtime = 10, -- determines how long it takes to build
    neededresources = 50, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Small Fence","Fences",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/props_c17/fence02b.mdl", -- enter the model name here, this is never the same as the classname
    health = 200, -- determines the health, 0 means invincible
    buildtime = 10, -- determines how long it takes to build
    neededresources = 30, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Medium Fence","Fences",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/props_c17/fence02a.mdl", -- enter the model name here, this is never the same as the classname
    health = 400, -- determines the health, 0 means invincible
    buildtime = 20, -- determines how long it takes to build
    neededresources = 50, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Large Fence 1","Fences",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/props_c17/fence03a.mdl", -- enter the model name here, this is never the same as the classname
    health = 600, -- determines the health, 0 means invincible
    buildtime = 30, -- determines how long it takes to build
    neededresources = 75, -- determines how many ressources will be taken away
    })

JoeFort:AddEnt("Large Fence 2","Fences",{
    classname = "", -- in case its an entity fill in, for props just leave “”
    model = "models/props_wasteland/interior_fence002d.mdl", -- enter the model name here, this is never the same as the classname
    health = 600, -- determines the health, 0 means invincible
    buildtime = 30, -- determines how long it takes to build
    neededresources = 75, -- determines how many ressources will be taken away
    })