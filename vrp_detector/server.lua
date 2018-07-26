--Settings--
local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP","vrp_detector")


RegisterServerEvent('checkthis')
AddEventHandler('checkthis', function()
	local source = source
    local user_id = vRP.getUserId({source})
    local player = vRP.getUserSource({user_id})
    local cop = vRP.hasGroup({user_id,"police"}) --Checks for police-group //Change this, to the name of the whitelist-group if not 'police'
    local ems = vRP.hasGroup({user_id,"ems"}) --Checks for ems-group //Change this, to the name of the whitelist-group if not 'ems'
    
	if cop or ems then --Checks to see, if you're police or ems. If not, runthat triggers.
	--Nothing runs, because you're allowed to pass through. Could put another trigger here?
	else
      TriggerClientEvent('runthat',player)
    end
end)
