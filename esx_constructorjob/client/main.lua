ESX = nil

local hasUniform =  false
local isWorking = false
local heading, workedAmount = 0, 0
local location = nil
local IsDead = false

constructionLocationsList = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	Citizen.Wait(2000)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('esx_constructorjob:hasEnteredMarker', function(zone)

end)

AddEventHandler('esx_constructorjob:hasExitedMarker', function(zone)
	ESX.UI.Menu.CloseAll()
	CurrentAction = nil
end)

AddEventHandler('esx:onPlayerDeath', function()
	IsDead = true
end)

AddEventHandler('playerSpawned', function(spawn) 
	IsDead = false
end)


function cleanPlayer(playerPed)
	ClearPedBloodDamage(playerPed)
	ResetPedVisibleDamage(playerPed)
	ClearPedLastWeaponDamage(playerPed)
	ResetPedMovementClipset(playerPed, 0)
end

function setUniform(outfit, playerPed)
	TriggerEvent('skinchanger:getSkin', function(skin)
		if skin.sex == 0 then
			if Config.Uniforms[outfit].male then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[outfit].male)
			else
				-- no outfit for male
			end
		else
			if Config.Uniforms[outfit].female then
				TriggerEvent('skinchanger:loadClothes', skin, Config.Uniforms[outfit].female)
				SetPedComponentVariation(playerPed, 2, 32, 0, 0) -- changing hair client-side
			else
				-- no outfit for female
			end
		end
	end)
end

function OpenCloakroomMenu()
	local playerPed = PlayerPedId(-1)

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'constructor_cloakroom_menu', {
		title    = _U('cloakroom_title'),
		align    = 'top-right', 
		elements = {
			{label = _U('citizen_outfit'), value = 'citizen_wear'},
            {label = _U('working_outfit'), value = 'build_wear'},
            {label = _U('working_storage'), value = 'storage'}
		}
	}, function(data, menu)
		cleanPlayer(playerPed)

		if data.current.value == 'citizen_wear' then
			ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
				TriggerEvent('skinchanger:loadSkin', skin)
			end)
			hasUniform = false
		elseif data.current.value == 'build_wear' then
			setUniform(ESX.PlayerData.job.grade_name, playerPed)
			hasUniform = true
		elseif data.current.value == "storage" then
			OpenStorageActionsMenu()
		end

	end, function(data, menu)
		menu.close()

        CurrentAction     = 'constructor_cloakroom_menu'
		CurrentActionMsg  = _U('press_to_open')
		CurrentActionData = {}
	end)
end

function OpenStorageActionsMenu()
	elements = {
		{label = _U('storage_jackhammer'), value = 'jackhammer'},
		{label = _U('storage_hammer'), value = 'hammer'},
		{label = _U('storage_electricwelder'), value = "electricwelder"}
	}

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'cloakroom', {
		title    = _U('storage_title'),
		align    = 'top-right', 
		elements = elements 
	}, function(data, menu)

		if data.current.value == "none" then return end

		TriggerServerEvent('esx_constructorjob:giveStorageItem', data.current.value)
	
	end, function(data, menu)
		menu.close()

        CurrentAction     = 'constructor_cloakroom_menu'
		CurrentActionData = {}
	end)
end

-- Enter / Exit marker events, and draw markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'builder' then
			local coords = GetEntityCoords(PlayerPedId())
			local isInMarker, letSleep, currentZone = false, true

			for k,v in pairs(Config.ConstructorZoneActions) do
				local distance = GetDistanceBetweenCoords(coords, v.Pos.x, v.Pos.y, v.Pos.z, true)

				if distance < Config.DrawDistance then
					letSleep = false
					DrawMarker(v.Type, v.Pos.x, v.Pos.y, v.Pos.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Size.x, v.Size.y, v.Size.z, v.Color.r, v.Color.g, v.Color.b, 100, false, false, 2, v.Rotate, nil, nil, false)
				end

				if distance < v.Size.x then
					isInMarker, currentZone = true, k

					CurrentAction     = v.Action
					CurrentActionMsg  = v.ActionMsg
					CurrentActionData = {}

					location = vector3(v.Pos.x, v.Pos.y, v.Pos.z)

					heading = v.Heading

				end
			end

			if (isInMarker and not HasAlreadyEnteredMarker) or (isInMarker and LastZone ~= currentZone) then
				HasAlreadyEnteredMarker, LastZone = true, currentZone
				TriggerEvent('esx_constructorjob:hasEnteredMarker', currentZone)
			end

			if not isInMarker and HasAlreadyEnteredMarker then
				HasAlreadyEnteredMarker = false
				TriggerEvent('esx_constructorjob:hasExitedMarker', LastZone)
			end

			if letSleep then
				Citizen.Wait(1000)
			end
		else
			Citizen.Wait(30000)
		end
	end
end)

RegisterNetEvent("esx_constructorjob:startConstruction")
AddEventHandler("esx_constructorjob:startConstruction", function(type, jobGrade)
	local playerPed = PlayerPedId(-1)

	isWorking = true
	constructionLocationsList[location] = 1

	if location ~= nil then
		ESX.Game.Teleport(playerPed, vector3(location.x, location.y, location.z - 1.0))
		SetEntityHeading(playerPed, heading)
	end

	Citizen.Wait(1000)
	SetEntityInvincible(PlayerPedId(-1), true)

	if IsPedArmed(playerPed, 7) then
		SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true)
		Citizen.Wait(4000)
	end

	TaskStartScenarioInPlace(playerPed, type, 0, true) 

	if Config.ScenarioProgressBars then
		startUI(Config.ScenarioTime, ' ')
	end

	Wait(Config.ScenarioTime)
	ClearPedTasks(playerPed)
	TriggerServerEvent('esx_constructorjob:giveConstructionMoney', jobGrade, 0)

	isWorking = false
	SetEntityInvincible(PlayerPedId(-1), false)

	workedAmount = workedAmount + 1

	if Config.ConstructionGradesManagement then

		TriggerServerEvent("esx_constructorjob:upgradeRole", workedAmount)

	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		if ESX.PlayerData and ESX.PlayerData.job and ESX.PlayerData.job.name == 'builder' then
			local sleep = true

			if isWorking then
				sleep = false
				DisableAllControlActions(0)
			end
	
			if sleep then
				Citizen.Wait(1000)
			end
		else
			Citizen.Wait(30000)
		end
	end
end)

-- Clear construction activities.
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000 * Config.ActionsResetTime)
		
		if ESX.PlayerData and ESX.PlayerData.job and ESX.PlayerData.job.name == 'builder' then
			constructionLocationsList = {}
		end
	end
end)

-- Key Controls
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if ESX.PlayerData.job and ESX.PlayerData.job.name == 'builder' then

			if CurrentAction and not IsDead then

				if not containsConstructionLocation(location) then

					ESX.ShowHelpNotification(CurrentActionMsg, true)

					if IsControlJustReleased(0, 38) then

						if CurrentAction == 'constructor_cloakroom_menu' then 
							OpenCloakroomMenu()
						else

							TriggerServerEvent('esx_constructorjob:performConstruction', CurrentAction, ESX.PlayerData.job.grade_name, hasUniform)
						end

						CurrentAction = nil
					end

				else
					ESX.ShowHelpNotification(_U('action_not_available'), true)
				end
			end
		else
			Citizen.Wait(30000)
		end
	end
end)

Citizen.CreateThread(function()

	local blip = AddBlipForCoord(Config.ConstructionBlip.x, Config.ConstructionBlip.y, Config.ConstructionBlip.z)
	SetBlipSprite(blip, Config.ConstructionBlip.id)
	SetBlipDisplay(blip, 4)
	SetBlipScale(blip, Config.ConstructionBlip.scale)
	SetBlipColour(blip, Config.ConstructionBlip.colour)
	SetBlipAsShortRange(blip, true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString(Config.ConstructionBlip.title)
	EndTextCommandSetBlipName(blip)

end)

function containsConstructionLocation(val)
	if constructionLocationsList[val] then
		return true
	else
		return false
	end
end

