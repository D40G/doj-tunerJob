Config = {}

-- Tunes Message                                -- Must choose ["chat" or "phone"] to recieve the tuning message
Config.checkTunesMessage    = "phone"


--Skillbars                                     -- Must choose one of the avalible skillbars ["reload-skillbar","np-skillbar","qb-skillbar"] links are in read me
Config.skillbarTurbo        = "qb-skillbar" 
Config.skillbarXenons       = "qb-skillbar" 
Config.skillbarRemoveTint   = "qb-skillbar"

Config.minigame = {
    correctBlocks = 3,    -- Number of correct blocks the player needs to click
    incorrectBlocks = 3,  -- Number of incorrect blocks after which the game will fail
    timetoShow = 3,       -- Time in secs for which the right blocks will be shown
    timetoLose = 10,      -- Maximum time after timetoshow expires for player to select the right blocks
} 


-- Main 
Config.isVehicleOwned = false                    --  [true or false] checks if the vehicle is owned

Config.tunerShopItems = {                                  
	[1] = { name = "engine",                price = 10000, amount = 500, info = {}, type = "item", slot = 1, },
    [2] = { name = "trasnmission",          price = 10000, amount = 500, info = {}, type = "item", slot = 2, },
    [3] = { name = "brakes",                price = 10000, amount = 500, info = {}, type = "item", slot = 3, },
    [4] = { name = "turbo",                 price = 10000, amount = 500, info = {}, type = "item", slot = 4, },
    [5] = { name = "stancerkit",            price = 10000, amount = 500, info = {}, type = "item", slot = 5, },
    [6] = { name = "tunerlaptop",           price = 10000, amount = 500, info = {}, type = "item", slot = 6, },
    [7] = { name = "hid_controller",        price = 5000, amount = 500, info = {}, type = "item", slot = 7, },
    [8] = { name = "underglow_controller",  price = 5000, amount = 500, info = {}, type = "item", slot = 8, },
    [9] = { name = "key_unprogramed",       price = 5000, amount = 500, info = {}, type = "item", slot = 9, },
    [10] = { name = "obd_scanner",          price = 5000, amount = 500, info = {}, type = "item", slot = 10, },
    [11] = { name = "headlights",           price = 5000, amount = 500, info = {}, type = "item", slot = 11, },
    [12] = { name = "repairkit",            price = 5000, amount = 500, info = {}, type = "item", slot = 12, },
    [13] = { name = "tire",                 price = 5000, amount = 500, info = {}, type = "item", slot = 13, },
    [14] = { name = "tint_supplies",        price = 5000, amount = 500, info = {}, type = "item", slot = 14, },
}


Config.workbenchCraftingItems = {
    [1] = { name = "engine",                amount = 50, info = {},costs = {["steel"] = 5,         ["iron"] = 5, }, type = "item", slot = 1, threshold = 0, points = 1}, 
    [2] = { name = "trasnmission",          amount = 50, info = {},costs = {["aluminum"] = 5,      ["iron"] = 5, }, type = "item", slot = 2, threshold = 0, points = 1}, 
    [3] = { name = "brakes",                amount = 50, info = {},costs = {["aluminum"] = 5,      ["steel"] = 5, }, type = "item", slot = 3, threshold = 0, points = 1}, 
    [4] = { name = "turbo",                 amount = 50, info = {},costs = {["aluminum"] = 5,      ["steel"] = 5, }, type = "item", slot = 4, threshold = 0, points = 1}, 
    [5] = { name = "stancerkit",            amount = 50, info = {},costs = {["rubber"] = 5,        ["aluminum"] = 5, }, type = "item", slot = 5, threshold = 0, points = 1},
    [6] = { name = "tunerlaptop",           amount = 50, info = {},costs = {["plastic"] = 5,       ["electronics"] = 5, }, type = "item", slot = 6, threshold = 0, points = 1},
    [7] = { name = "hid_controller",        amount = 50, info = {},costs = {["electronics"] = 5,   ["metalscrap"] = 5, }, type = "item", slot = 7, threshold = 0, points = 1},
    [8] = { name = "underglow_controller",  amount = 50, info = {},costs = {["plastic"] = 5,       ["metalscrap"] = 5, }, type = "item", slot = 8, threshold = 0, points = 1},
    [9] = { name = "key_unprogramed",       amount = 50, info = {},costs = {["rubber"] = 5,        ["steel"] = 5, }, type = "item", slot = 9, threshold = 0, points = 1},
    [10] = { name = "obd_scanner",          amount = 50, info = {},costs = {["plastic"] = 5,       ["electronics"] = 5, }, type = "item", slot = 10, threshold = 0, points = 1},
    [11] = { name = "headlights",           amount = 50, info = {},costs = {["plastic"] = 5,       ["rubber"] = 5, }, type = "item", slot = 11, threshold = 0, points = 1},
    [12] = { name = "repairkit",            amount = 50, info = {},costs = {["rubber"] = 5,        ["metalscrap"] = 5, }, type = "item", slot = 12, threshold = 0, points = 1},
    -- [13] = { name = "tire",                 amount = 50, info = {},costs = {["plastic"] = 5,       ["electronics"] = 5, }, type = "item", slot = 13, threshold = 0, points = 1},
    -- [14] = { name = "tint_supplies",     amount = 50, info = {},costs = {["aluminum"] = 5,      ["steel"] = 5, }, type = "item", slot = 14, threshold = 0, points = 1},
} 
-- Unused Crafting items --
-- 'glass',
-- 'copper',



Config.Chop = {
    Active = true,
    DebugZone = false,
    ChopZoneText = 'Vehicle Chopping',
}

Config.One = {
    Active = true,
    DebugZone = false,
    Workbench = vector3(121.828, -3024.856, 7.041),
    Workstation = vector3(126.128, -3040.884, 7.041),
    WorkbenchText = 'Tuner Workbench - Bay #1',
    WorkstationText = 'Tuner Workstation - Bay #1',
}

Config.Two = {
    Active = false,
    DebugZone = false,
    Workbench = vector3(0, 0, 0),
    Workstation = vector3(0, 0, 0),
    WorkbenchText = 'Tuner Workbench - Bay #2',
    WorkstationText = 'Tuner Workstation - Bay #2',
}

Config.Three = {
    Active = false,
    DebugZone = false,
    Workbench = vector3(0, 0, 0),
    Workstation = vector3(0, 0, 0),
    WorkbenchText = 'Tuner Workbench - Bay #3',
    WorkstationText = 'Tuner Workstation - Bay #3',
}

Config.Four = {
    Active = false,
    DebugZone = false,
    Workbench = vector3(0, 0, 0),
    Workstation = vector3(0, 0, 0),
    WorkbenchText = 'Tuner Workbench - Bay #4',
    WorkstationText = 'Tuner Workstation - Bay #4',
}

Config.Five = {
    Active = false,
    DebugZone = false,
    Workbench = vector3(0, 0, 0),
    Workstation = vector3(0, 0, 0),
    WorkbenchText = 'Tuner Workbench - Bay #5',
    WorkstationText = 'Tuner Workstation - Bay #5',
}








