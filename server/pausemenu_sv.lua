--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

-- Event to collect data from NUI callback and send a report
RegisterNetEvent('boii-pausemenu:SendReport')
AddEventHandler('boii-pausemenu:SendReport', function(data)
    local identifiers = ExtractIdentifiers(source)
    local NewReport = {
        playerid = source,
        fname = data.fname,
        lname = data.lname,
        reporttype = data.reporttype,
        subject = data.subject,
        description = data.description,
        discord = '<@' .. identifiers.discord:gsub('discord:', '') .. '>',
        license = identifiers.license:gsub('license2:', '')
    }
    SendWebhook(NewReport)
end)

-- Function to send data through webhook
function SendWebhook(data)
    local footerText = Config.Discord.BotData.Footer.Text
    local icon = Config.Discord.BotData.Footer.Icon
    local botName = Config.Discord.BotData.Name
    local botLogo = Config.Discord.BotData.Logo

    local report = {
        {
            title = '**Type:** ' .. data.reporttype,
            color = Config.Discord.Colour,
            footer = {
                text = footerText .. os.date('%c'),
                icon_url = icon,
            },
            description = string.format('**First name:** %s\n**Last name:** %s\n**Subject:** %s\n**Description:** %s\n**ID:** %s\n**Discord:** %s\n**License:** ||%s||',
                data.fname, data.lname, data.subject, data.description, data.playerid, data.discord, data.license)
        }
    }

    PerformHttpRequest(Config.Discord.Webhook, function(err, text, headers) end, 'POST', json.encode({
        username = botName,
        embeds = report,
        avatar_url = botLogo
    }), { ['Content-Type'] = 'application/json' })
end

-- Event to drop player
RegisterServerEvent('boii-pausemenu:DropPlayer')
AddEventHandler('boii-pausemenu:DropPlayer', function()
    DropPlayer(source, 'You disconnected from the server.')
end)

-- Function to grab identifiers
function ExtractIdentifiers(id)
    local identifiers = {
        steam = '',
        ip = '',
        discord = '',
        license = '',
        xbl = '',
        live = ''
    }

    for i = 0, GetNumPlayerIdentifiers(id) - 1 do
        local playerID = GetPlayerIdentifier(id, i)
        if string.find(playerID, 'steam') then
            identifiers.steam = playerID
        elseif string.find(playerID, 'ip') then
            identifiers.ip = playerID
        elseif string.find(playerID, 'discord') then
            identifiers.discord = playerID
        elseif string.find(playerID, 'license') then
            identifiers.license = playerID
        elseif string.find(playerID, 'xbl') then
            identifiers.xbl = playerID
        elseif string.find(playerID, 'live') then
            identifiers.live = playerID
        end
    end

    return identifiers
end
