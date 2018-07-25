detector = {
	{436.12911987305,-981.74456787109,30.698616027832},
	{1853.9157714844,3685.1645507813,34.267040252686},
	{150.28442382813,-1038.9141845703,29.377796173096},
	{-2965.7385253906,482.98623657227,15.697046279907},
	{-109.62287902832,6463.9565429688,31.626707077026},
	{-1213.9013671875,-328.85900878906,37.790740966797},
	{314.78491210938,-277.10101318359,54.17448425293},
	{-350.55902099609,-48.381637573242,49.036476135254},
	{233.11387634277,215.99319458008,106.28667449951},
	{259.75921630859,204.9874420166,106.28321838379},
	{1175.0679931641,2704.3557128906,38.097732543945}
} --List of locations, for the weapons-detectors placed. Currently placed detectors, are at banks and policestations.

weapons = {
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_PROXMINE",
	"WEAPON_SNOWBALL",
	"WEAPON_RAILGUN",
	"WEAPON_KNIFE",
	"WEAPON_NIGHTSTICK",
	"WEAPON_HAMMER",
	"WEAPON_BAT",
	"WEAPON_GOLFCLUB",
	"WEAPON_CROWBAR",
	"WEAPON_PISTOL",
	"WEAPON_COMBATPISTOL",
	"WEAPON_APPISTOL",
	"WEAPON_PISTOL50",
	"WEAPON_MICROSMG",
	"WEAPON_SMG",
	"WEAPON_ASSAULTSMG",
	"WEAPON_ASSAULTRIFLE",
	"WEAPON_CARBINERIFLE",
	"WEAPON_ADVANCEDRIFLE",
	"WEAPON_MG",
	"WEAPON_COMBATMG",
	"WEAPON_PUMPSHOTGUN",
	"WEAPON_SAWNOFFSHOTGUN",
	"WEAPON_ASSAULTSHOTGUN",
	"WEAPON_BULLPUPSHOTGUN",
	"WEAPON_STUNGUN",
	"WEAPON_SNIPERRIFLE",
	"WEAPON_HEAVYSNIPER",
	"WEAPON_REMOTESNIPER",
	"WEAPON_GRENADELAUNCHER",
	"WEAPON_GRENADELAUNCHER_SMOKE",
	"WEAPON_RPG",
	"WEAPON_STINGER",
	"WEAPON_MINIGUN",
	"WEAPON_GRENADE",
	"WEAPON_STICKYBOMB",
	"WEAPON_SMOKEGRENADE",
	"WEAPON_BZGAS",
	"WEAPON_MOLOTOV",
	"WEAPON_FIREEXTINGUISHER",
	"WEAPON_PETROLCAN",
	"WEAPON_BALL",
	"WEAPON_FLARE",
	"WEAPON_SNSPISTOL",
	"WEAPON_BOTTLE",
	"WEAPON_GUSENBERG",
	"WEAPON_SPECIALCARBINE",
	"WEAPON_HEAVYPISTOL",
	"WEAPON_BULLPUPRIFLE",
	"WEAPON_DAGGER",
	"WEAPON_VINTAGEPISTOL",
	"WEAPON_FIREWORK",
	"WEAPON_MUSKET",
	"WEAPON_HEAVYSHOTGUN",
	"WEAPON_MARKSMANRIFLE",
	"WEAPON_HOMINGLAUNCHER",
	"WEAPON_PROXMINE",
	"WEAPON_SNOWBALL",
	"WEAPON_FLAREGUN",
	"WEAPON_GARBAGEBAG",
	"WEAPON_HANDCUFFS",
	"WEAPON_COMBATPDW",
	"WEAPON_MARKSMANPISTOL",
	"WEAPON_KNUCKLE",
	"WEAPON_HATCHET",
	"WEAPON_RAILGUN",
	"WEAPON_MACHETE",
	"WEAPON_MACHINEPISTOL",
	"WEAPON_SWITCHBLADE",
	"WEAPON_REVOLVER",
	"WEAPON_DBSHOTGUN",
	"WEAPON_COMPACTRIFLE",
	"WEAPON_AUTOSHOTGUN",
	"WEAPON_BATTLEAXE",
	"WEAPON_COMPACTLAUNCHER",
	"WEAPON_MINISMG",
	"WEAPON_PIPEBOMB",
	"WEAPON_POOLCUE",
	"WEAPON_WRENCH"
} --Full list of weapons that the code checks for.

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
			for i = 1, #detector do
				detectors = detector[i]
				--DrawMarker(27, detectors[1], detectors[2], detectors[3], 0, 0, 0, 0, 0, 0, 5.0, 5.0, 2.0, 0, 157, 0, 0--[[Alpha]], 0, 0, 2, 0, 0, 0, 0) --If alpha is 255, you should be able to see green circles, for placed detectors. Used to debug.
				if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), detectors[1], detectors[2], detectors[3], true ) < 1.5 then
					TriggerServerEvent('checkthis')
				end
			end
	end
end)


RegisterNetEvent("runthat")
AddEventHandler("runthat", function()
	checkingthis() 
end)

function checkingthis()
	local paused = false
	local player = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(player)

	for i=1,#weapons, 1 do
	local weaponHash = GetHashKey(weapons[i])
	  if HasPedGotWeapon(player, weaponHash, false) and not paused then
	  	paused = true
	  	TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "detector", 0.3) --Plays the sound for the person, and people in the radius of 10 meters, if a weapons i detected.
	  	--[[Need to code something here, to trigger a message only for cops.]]--
	  	reset() --Resets the timer.
	  	break
	  end
	end
end

function reset()
	Wait(5000)
	paused = false
end