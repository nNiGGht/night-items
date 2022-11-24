ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

local citizen = false

RegisterNetEvent('night:checkarmordogg')
AddEventHandler('night:checkarmordogg', function(armour)
    Citizen.Wait(10000)
    SetPedArmour(PlayerPedId(), tonumber(armour))
    citizen = true
end)

local TimeFreshCurrentArmour = 60000

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if citizen == true then
            TriggerServerEvent('night:armoryenile', GetPedArmour(PlayerPedId()))
            Citizen.Wait(TimeFreshCurrentArmour)
        end
    end
end)

-- hp items

RegisterNetEvent("night:useitemifak")
AddEventHandler("night:useitemifak",function()
    local health = GetEntityHealth(PlayerPedId())
    local ped = GetPlayerPed(-1)
            if (health < 200)  then
                exports['mythic_progbar']:Progress({
                    name = "ifakkullan",
                    duration = 5000,
                    label = 'İfak Kullanılıyor... [DEL]',
                    useWhileDead = false,
                    canCancel = true,
                    controlDisables = {
                        disableMovement = false,
                        disableCarMovement = false,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    animation = {
                        animDict = "mp_arresting",
                        anim = "a_uncuff",
                        flags = 49,
                    },
                }, function(cancelled)
                    if not cancelled then
                        SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 35)
                        TriggerServerEvent('night:removeifak')
                    else
                        TriggerEvent("notification","İfak kullanmayı iptal ettin.")
                    end
                end)
            elseif (health == 200) then
                TriggerEvent("notification","Sağlık durumun şuanlık iyi görünüyor.")
          end
end)

RegisterNetEvent("night:useitemkan")
AddEventHandler("night:useitemkan",function()
    local health = GetEntityHealth(PlayerPedId())
            if (health < 200)  then
            exports['mythic_progbar']:Progress({
                name = "itemkan",
                duration = 2000,
                label = 'Oxy İçiyorsun... [DEL]',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "mp_suicide",
                    anim = "pill",
                    flags = 49,
                },
            }, function(cancelled)
                if not cancelled then
                    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 15)
                    TriggerServerEvent('night:removeoxy')
                end
            end)
        elseif (health == 200) then
            TriggerEvent("notification","Sağlık durumun şuanlık iyi görünüyor.")
        end
end)

RegisterNetEvent("night:bandagekullan")
AddEventHandler("night:bandagekullan",function()
    local health = GetEntityHealth(PlayerPedId())
    if (health < 200)  then
            exports['mythic_progbar']:Progress({
                name = "bandagekeke",
                duration = 3000,
                label = 'Bandaj Kullanılıyor... [DEL]',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@world_human_clipboard@male@idle_a",
                    anim = "idle_c",
                    flags = 50,
                },
            }, function(cancelled)
                if not cancelled then
                    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 25)
                    TriggerServerEvent('night:removebandage')
                end
            end)
        elseif (health == 200) then
            TriggerEvent("notification","Sağlık durumun şuanlık iyi görünüyor.")
      end
end)

RegisterNetEvent("night:medkitkullan")
AddEventHandler("night:medkitkullan",function()
    local health = GetEntityHealth(PlayerPedId())
    if (health < 200)  then
            exports['mythic_progbar']:Progress({
                name = "medkitkullan",
                duration = 7000,
                label = 'İlk Yardım Çantası Kullanılıyor... [DEL]',
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "mp_arresting",
                    anim = "a_uncuff",
                    flags = 49,
                },
            }, function(cancelled)
                if not cancelled then
                    SetEntityHealth(PlayerPedId(), GetEntityHealth(PlayerPedId()) + 60)
                    TriggerServerEvent('night:removemedkit')
                else
                    TriggerEvent("notification","İlkyardım çantasını kullanmayı iptal ettin.")
                end
            end)
        elseif (health == 200) then
            TriggerEvent("notification","Sağlık durumun şuanlık iyi görünüyor.")
      end
end)

-- armor items

RegisterNetEvent('night:mediumarmor')
AddEventHandler('night:mediumarmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'mediumarmor'

    exports['mythic_progbar']:Progress({
        name = "mediumarmor",
        duration = 7000,
        label = 'Çelik Yelek Giyiliyor... [DEL]',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "clothingshirt",
            anim = "try_shirt_neutral_d",
            flags = 49,
        },
    }, function(status)
        if not status then
            SetPedArmour(ped, 50)
            TriggerEvent('notification', 'Çelik yelek giydin.', 3)
            TriggerServerEvent("night:removemediumarmor")
        end
    end)
end)

RegisterNetEvent('night:fullarmor')
AddEventHandler('night:fullarmor', function()
    local inventory = ESX.GetPlayerData().inventory
    local ped = GetPlayerPed(-1)
    local armor = GetPedArmour(ped)
    local item = 'fullarmor'

    exports['mythic_progbar']:Progress({
        name = "fullarmor",
        duration = 7000,
        label = 'Çelik Yelek Giyiliyor... [DEL]',
        useWhileDead = false,
        canCancel = true,
        controlDisables = {
            disableMovement = false,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "clothingshirt",
            anim = "try_shirt_neutral_d",
            flags = 49,
        },
    },
    function(status)
        if not status then
            SetPedArmour(ped, 100)
            TriggerEvent('notification', 'Çelik yelek giydin.', 3)
            TriggerServerEvent("night:removefullarmor")
        end
    end)
end)
