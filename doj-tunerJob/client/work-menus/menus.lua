
local QBCore = exports['qb-core']:GetCoreObject()

-- Workbench
RegisterNetEvent('doj:client:workbenchMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = "Workbench",
            isMenuHeader = true,
        },
        {
            header = "Workbench Crafting", 
            txt = "Craft useful items",
            params = {
                event = "inventory:client:tunerWorkbench",
            }
        },
        {
            header = "Workbench Storage", 
            txt = "Store important items",
            params = {
                event = "doj:client:tunerStorage",
            }
        },
        {
            header = "Cancel",
            txt = "",
            params = {
                event = ""
            }
        },
    })
end)

RegisterNetEvent('doj:client:workbenchMenuWalkUp', function()
    exports['qb-menu']:showHeader({
        {
            header = "Workbench",
            isMenuHeader = true,
        },
        {
            header = "Workbench Crafting", 
            txt = "Craft useful items",
            params = {
                event = "inventory:client:tunerWorkbench",
            }
        },
        {
            header = "Workbench Storage", 
            txt = "Store important items",
            params = {
                event = "doj:client:tunerStorage",
            }
        },
        {
            header = "Workbench Shop", 
            txt = "Buy items for the job",
            params = {
                event = "inventory:client:tunerShop",
            }
        },
        {
            header = "Cancel",
            txt = "",
            params = {
                event = "doj:client:workbenchMenuWalkUp"
            }
        },
    })
end)

-- workstation
RegisterNetEvent('doj:client:workStationMainMenu', function()
    exports['qb-menu']:showHeader({
        {
            header = "Tuner Work Station:",
            text = "Vehicle",
            isMenuHeader = true,
        },
        {
            header = "Access", 
            params = {
                event = "doj:client:workStationOptions",
            }
        },
    })
end)

RegisterNetEvent('doj:client:workStationOptions', function()
    exports['qb-menu']:openMenu({
        {
            header = "Tuner Work Station:",
            text = "Main Menu",
            isMenuHeader = true,
        },
        {
            header = "Vehicle Care", 
            txt = "extra options",
            params = {
                event = "doj:client:workStationMainMenuExtra", 
            }
        },
        {
            header = "Cosmetic Upgrades", 
            txt = "install mods",
            params = {
                event = "doj:client:workStationCosmetics", 
            }
        },
        {
            header = "Performance Upgrades", 
            txt = "install mods",
            params = {
                event = "doj:client:workStationPerformance", 
            }
        },
        {
            header = "exit",
            txt = "",
            params = {
                event = "doj:client:workStationMainMenu"
            }
        },
    })
end)

RegisterNetEvent('doj:client:workStationMainMenuExtra', function()
    exports['qb-menu']:openMenu({
        {
            header = "Tuner Work Station:",
            text = "Vehicle Care",
            isMenuHeader = true,
        },
        {
            header = "Repair", 
            txt = "fully repair body and engine",
            params = {
                event = "doj:client:WorkstationRepair",
            }
        },
        {
            header = "Check Vehicle Mods", 
            txt = "checks for active vehicle mods",
            params = {
                event = "doj:client:checkVehicleModsWorkStation",  
            }
        },
        {
            header = "Program a Key", 
            txt = "Adds the vehicles info to a key",
            params = {
                event = "doj:client:programVehicleKey",  
            }
        },
        {
            header = "< Return",
            txt = "main menu", 
            params = {
                event = "doj:client:workStationOptions",
            }
        },
    })
end)

RegisterNetEvent('doj:client:workStationCosmetics', function() 
    exports['qb-menu']:openMenu({
        {
            header = "Tuner Work Station: Upgrades",
            text = "Cosmetics",
            isMenuHeader = true,
        },
        {
            header = "Neon Underglow", 
            txt = "",
            params = {
                event = "doj:client:openNeonMenuWorkStation", 
            }
        },
        
        {
            header = "Headlights", 
            txt = "",
            params = {
                event = "doj:client:xenonMenuWorkStation", 
            }
        },
        {
            header = "Window Tinting", 
            txt = "",
            params = {
                event = "doj:client:openWindowTintMenuWorkStation",
            }
        },
        {
            header = "Camber", 
            txt = "",
            params = {
                event = "doj:client:openCamberMenuWorkStation",
            }
        },
        {
            header = "< Return",
            txt = "main menu",
            params = {
                event = "doj:client:workStationOptions"
            }
        },
    })
end)

RegisterNetEvent('doj:client:workStationPerformance', function()
    exports['qb-menu']:openMenu({
        {
            header = "Tuner Work Station: Upgrades",
            text = "Performance",
            isMenuHeader = true,
        },
        {
            header = "Engine", 
            params = {
                event = "doj:client:workStationEnginesMenu",
            }
        },
        {
            header = "Transmission", 
            params = {
                event = "doj:client:workStationTransmissionMenu",
            }
        }, 
        {
            header = "Brakes", 
            params = {
                event = "doj:client:workStationBrakesMenu",
            }
        },
        {
            header = "Turbo", 
            params = {
                event = "doj:client:workStationTurboMenu",
            }
        },
        {
            header = "Nitrous", 
            params = {
                event = "doj:client:workStationNitrousMenu",
            }
        },
        {
            header = "Tuning", 
            txt = "",
            params = {
                event = "doj:client:openTunerchipMenu",  
            }
        },    
        {
            header = "< Return",
            txt = "Main Menu",
            params = {
                event = "doj:client:workStationOptions"
            }
        },
    })
end)


-------------------------------------------------------------------------- On foot
-- RegisterNetEvent('doj:client:workStationMainMenuOnFoot', function()
--     exports['qb-menu']:showHeader({
--         {
--             header = "Tuner Work Station:",
--             text = "On foot",
--             isMenuHeader = true,
--         },
--         {
--             header = "Access", 
--             params = {
--                 event = "doj:client:workStationOptionsOnFoot",
--             }
--         },
--     })
-- end)

-- RegisterNetEvent('doj:client:workStationOptionsOnFoot', function()
--     exports['qb-menu']:openMenu({
--         {
--             header = "Tuner Work Station:",
--             text = "On foot",
--             isMenuHeader = true,
--         },
--         {
--             header = "< Return",
--             txt = "",
--             params = {
--                 event = "doj:client:workStationMainMenuOnFoot"
--             }
--         },
--     })
-- end)