
local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('doj:client:openCamberMenuWorkStation', function()
    exports['qb-menu']:openMenu({
        {
            header = "Tuner Work Station: Camber",
            txt = "adjust vehicle ride height & camber",
            isMenuHeader = true
        },
        {
            header = "Install Camber arms",
            txt = "",
            params = {
                event = "doj:client:RenzuStancerOptions",
                args = 1                
            }
        },
        {
            header = "Adjust",
            txt = "",
            params = {
                event = "doj:client:RenzuStancerOptions",
                args = 2
            }
        },
        {
            header = "< Return",
            txt = "Cosmetic Menu",
            params = {
                event = "doj:client:workStationCosmetics",
            }
        },
    })
end)


RegisterNetEvent('doj:client:RenzuStancerOptions', function(args)
    local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
    local args = tonumber(args)
	if args == 1 then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                QBCore.Functions.Progressbar("accepted", "Installing camber arms...", 3700, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function() -- Done
                    Skillbar.Start({
                        duration = math.random(2500,5000),
                        pos = math.random(10, 30),
                        width = math.random(10, 20),
                    }, function()
                        TriggerEvent('doj:client:openCamberMenuWorkStation')
                        TriggerServerEvent('renzu_stancer:addstancerForTuner')
                    end, function()
                        TriggerEvent('doj:client:openCamberMenuWorkStation')
                        QBCore.Functions.Notify("Failed to install camber arms", "error")
                    end)
                end, function()
                    TriggerEvent('doj:client:openCamberMenuWorkStation')
                    QBCore.Functions.Notify("Failed to install camber arms", "error")
                end)
            else
                TriggerEvent('doj:client:openCamberMenuWorkStation')
                QBCore.Functions.Notify("You dont have any camber arms to install", "error")
            end
        end, "stancerkit")
    else
        exports.renzu_stancer:OpenStancer()
    end
end)

