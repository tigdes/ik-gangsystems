Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	PlayerLoaded = true
    TriggerEvent("ik-gangsystems:başlat")
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
    TriggerEvent("ik-gangsystems:başlat")
end)


RegisterNetEvent("ik-gangsystems:başlat",function ()
    for k,v in pairs(Config) do
        if v.enable then
            local playerjob = ESX.PlayerData.job.name
            if playerjob == k then
                SetRelationshipBetweenGroups(1, GetHashKey(v.gangped), GetHashKey('PLAYER'))
                SetRelationshipBetweenGroups(1, GetHashKey(v.gangped), GetHashKey(v.gangped))
            else
                if playerjob == "police" or playerjob == "state" or playerjob == "sheriff" or playerjob == "swat" then
                    SetRelationshipBetweenGroups(5, GetHashKey(v.gangped), GetHashKey('PLAYER'))
                    SetRelationshipBetweenGroups(1, GetHashKey(v.gangped), GetHashKey(v.gangped))
                else
                    SetRelationshipBetweenGroups(3, GetHashKey(v.gangped), GetHashKey('PLAYER'))
                    SetRelationshipBetweenGroups(1, GetHashKey(v.gangped), GetHashKey(v.gangped))
                end
            end
        end
    end
end)
