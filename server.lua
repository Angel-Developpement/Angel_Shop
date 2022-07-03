ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('angel_shop:BuyEau')
AddEventHandler('angel_shop:BuyEau', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 3
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('water', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('angel_shop:BuySoda')
AddEventHandler('angel_shop:BuySoda', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 3
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('soda', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('angel_shop:BuyPain')
AddEventHandler('angel_shop:BuyPain', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 3
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('bread', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('angel_shop:Buybolpistache')
AddEventHandler('angel_shop:Buybolpistache', function()

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)  
    local price = 3
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then

        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem('bolpistache', 1)
        TriggerClientEvent('esx:showNotification', source, "~g~Achats~w~ effectué !")
    else
         TriggerClientEvent('esx:showNotification', source, "Vous n'avez assez ~r~d\'argent")
    end
end)