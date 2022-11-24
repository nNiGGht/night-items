ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('esx:playerLoaded', function(playerId)
    local xPlayer = ESX.GetPlayerFromId(playerId)
    MySQL.Async.fetchScalar("SELECT armour FROM users WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.getIdentifier()
        }, function(data)
        if (data ~= nil) then
            TriggerClientEvent('night:checkarmordogg', playerId, data)
        end
    end)
end)

RegisterServerEvent('night:armoryenile')
AddEventHandler('night:armoryenile', function(updateArmour)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    MySQL.Async.execute("UPDATE users SET armour = @armour WHERE identifier = @identifier", { 
        ['@identifier'] = xPlayer.getIdentifier(),
        ['@armour'] = tonumber(updateArmour)
    })
end)

-- hp items

ESX.RegisterUsableItem('ifak', function(source)
  local pl = ESX.GetPlayerFromId(source)
  local src = source
  TriggerClientEvent('night:useitemifak', source)
end)

RegisterServerEvent('night:removeifak')
AddEventHandler('night:removeifak', function()
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 local src = source
	xPlayer.removeInventoryItem("ifak", 1)
	TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['ifak'],'remove',1)
end)

ESX.RegisterUsableItem('kandondurucu', function(source)
	local player = ESX.GetPlayerFromId(source)
	local src = source
	TriggerClientEvent('night:useitemkan', source)
end)

RegisterServerEvent('night:removeoxy')
AddEventHandler('night:removeoxy', function()
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 local src = source
 	xPlayer.removeInventoryItem('kandondurucu', 1)
	TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['kandondurucu'],'remove',1)
end)

ESX.RegisterUsableItem('bandage', function(source)
	local player = ESX.GetPlayerFromId(source)
	local src = source
	TriggerClientEvent('night:bandagekullan', source)
end)

RegisterServerEvent('night:removebandage')
AddEventHandler('night:removebandage', function()
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 local src = source
	xPlayer.removeInventoryItem('bandage', 1)
	TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['bandage'],'remove',1)
end)

ESX.RegisterUsableItem('medikit', function(source)
	local player = ESX.GetPlayerFromId(source)
	local src = source
	TriggerClientEvent('night:medkitkullan', source)
end)

RegisterServerEvent('night:removemedkit')
AddEventHandler('night:removemedkit', function()
 local source = tonumber(source)
 local xPlayer = ESX.GetPlayerFromId(source)
 local src = source
	xPlayer.removeInventoryItem('medikit', 1)
	TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['medikit'],'remove',1)
end)

ESX.RegisterUsableItem('parachute', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('parachute', 1)
	TriggerClientEvent('night:startparasut', source)
end)

-- armor items

ESX.RegisterUsableItem('mediumarmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('night:mediumarmor', source)
end)

RegisterServerEvent('night:removemediumarmor')
AddEventHandler('night:removemediumarmor', function(item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local src = source
    xPlayer.removeInventoryItem("mediumarmor", 1)
    TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['mediumarmor'],'remove',1)
end)

ESX.RegisterUsableItem('fullarmor', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('night:fullarmor', source)
end)

RegisterServerEvent('night:removefullarmor')
AddEventHandler('night:removefullarmor', function(item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local src = source
    xPlayer.removeInventoryItem("fullarmor", 1)
    TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['fullarmor'],'remove',1)
end)

--[[ ESX.RegisterUsableItem('joint', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('night:usejointasf', source)
end)

RegisterServerEvent('night:removefjoint')
AddEventHandler('night:removejoint', function(item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local src = source
    xPlayer.removeInventoryItem("joint", 1)
    TriggerClientEvent('inventory:client:ItemBox',src,ESX.GetItems()['joint'],'remove',1)
end) ]]