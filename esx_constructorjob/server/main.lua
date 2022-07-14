ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

RegisterServerEvent("esx_constructorjob:giveStorageItem")
AddEventHandler("esx_constructorjob:giveStorageItem", function(itemType)
	local xPlayer = ESX.GetPlayerFromId(source)
	local item = xPlayer.getInventoryItem(itemType)

    if Config.ExtendedVersion == "1.1" then
        if item.limit ~= -1 and item ~= nil and item.count >= item.limit then

            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('max_tools'))
            return
        end
        
        xPlayer.addInventoryItem(itemType, 1)

    elseif Config.ExtendedVersion == "1.2" then

        if xPlayer.canCarryItem(itemType, 1) then
            xPlayer.addInventoryItem(itemType, 1)
        else
            TriggerClientEvent('esx:showNotification', xPlayer.source, _U('max_tools'))
        end

    else
        print("[Constructor Job] Config.ExtendedVersion is not supported. Please, specify one of the supported versions (1.1, 1.2).")
    end
    
end)


RegisterServerEvent('esx_constructorjob:performConstruction')
AddEventHandler('esx_constructorjob:performConstruction', function(type, jobGrade, hasUniform)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if not hasUniform then

        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('required_uniform'))

        return
    end

    local requiredTool = xPlayer.getInventoryItem(Config.ConstructionTools[type])


    if requiredTool == nil or requiredTool.count == 0 then
        TriggerClientEvent('esx:showNotification', xPlayer.source, _U('required_tool'))

        return
    end

    TriggerClientEvent("esx_constructorjob:startConstruction", _source, type, jobGrade)
end)

RegisterServerEvent('esx_constructorjob:giveConstructionMoney')
AddEventHandler('esx_constructorjob:giveConstructionMoney', function(grade, money) -- add also coords check.
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then

        if money > 0 then
            print("^1[Constructors] - There was an effort of Injection Hacking - " .. GetPlayerName(xPlayer.source) .. "^7")

            if Config.SendToDiscord then
                sendToDiscord(Config.DISCORD_LOG_TEXT_TITLE, "There was an effort of Injection Hacking - " .. GetPlayerName(xPlayer.source) .. ".")
            end

            return
        end
        
        if xPlayer.job.name == "builder" then

            xPlayer.addMoney(Config.ConstructionGradesManagement[grade].actionsPayment)

        else
            print("^1[Constructors] - There was an effort of Injection Hacking - " .. GetPlayerName(xPlayer.source) .. "^7")
            
            if Config.SendToDiscord then
                sendToDiscord(Config.DISCORD_LOG_TEXT_TITLE, "There was an effort of Injection Hacking - " .. GetPlayerName(xPlayer.source) .. ".")
            end
            
        end
    end
end)

RegisterServerEvent("esx_constructorjob:upgradeRole")
AddEventHandler("esx_constructorjob:upgradeRole", function(workedAmount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local grade   = xPlayer.job.grade_name 

    if xPlayer then

        local requiredActions = Config.ConstructionGradesManagement[grade].actionsNextPromotion

        if requiredActions > 0 and requiredActions ~= nil then

            if workedAmount == requiredActions then

                local promotionGrade = Config.ConstructionGradesManagement[grade].actionsNextPromotionGrade
    
                if ESX.DoesJobExist("builder", promotionGrade) then
                    xPlayer.setJob("builder", promotionGrade)
                end
    
            end

        end

    end
end)


-- METHOD FOR SENDING MESSAGES ON CHANNELS
function sendToDiscord(name, message, color)
	local connect = {
		  {
			  ["color"] = color,
			  ["title"] = "**".. name .."**",
			  ["description"] = message,
			  ["footer"] = {
			  ["text"] = Config.FOOTER_TEXT,
		  },
	  }
  }

  PerformHttpRequest(Config.DISCORD_WEBHOOK_LOGS_CH, function(err, text, headers) end, 'POST', json.encode({username = Config.DISCORD_NAME, embeds = connect, avatar_url = Config.DISCORD_IMAGE}), { ['Content-Type'] = 'application/json' })

end