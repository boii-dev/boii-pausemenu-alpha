--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

local mapOpen = false

-- Thread to trigger menu on keypress
Citizen.CreateThread(function()
    while true do
        Wait(1)
        SetPauseMenuActive(false)
        if IsControlJustPressed(0, 200) then
            if not IsPauseMenuActive() then
                if mapOpen then
                    CloseMap()
                    mapOpen = false
                else
                    TriggerEvent("boii-pausemenu:OpenMenu")
                end
            end
        end
    end
end)

-- Event to open the menu
RegisterNetEvent("boii-pausemenu:OpenMenu")
AddEventHandler("boii-pausemenu:OpenMenu", function()
    TransitionToBlurred(1000)
    SetNuiFocus(true, true)
    SendNUIMessage({ open = true })
end)

-- Close button; closes menu
RegisterNUICallback('Close', function(data)
    ClosePause()
end)

-- Settings button; sends to GTA options
RegisterNUICallback('Settings', function(data)
    ClosePause()
    ActivateFrontendMenu(GetHashKey('FE_MENU_VERSION_MP_PAUSE'), 0, -1)
end)

-- Function to close menu
function ClosePause()
    TransitionFromBlurred(1000)
    SetNuiFocus(false, false)
    SendNUIMessage({ open = false })
end

-- Event to listen for map opening
RegisterCommand("map", function()
    mapOpen = not mapOpen
end)
