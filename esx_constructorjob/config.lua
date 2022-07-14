Config                            = {}

Config.Locale                     = 'en'

Config.DrawDistance               = 50.0

Config.ExtendedVersion            = "1.1"                                                                                                                                    -- Insert your es_extended version in order the script to work properly. Supported versions: "1.1" & "1.2"

Config.EnableJobActionsPromotion  = true                                                                                                                                     -- Set to false if you don't want the players to be auto-promoted to a higher grade based on the next promotion actions they have managed to perform.
Config.ActionsResetTime           = 10                                                                                                                                       -- All the actions for the client will be reset and startover based on the time that is set. The default is every 10 minutes.


Config.ConstructionTools          = { ['WORLD_HUMAN_HAMMERING'] = 'hammer', ['WORLD_HUMAN_CONST_DRILL'] = 'jackhammer', ['WORLD_HUMAN_WELDING'] = 'electricwelder' }         -- Each scenario is using its own required item when performing action in the specified location that can be found below where is Config.ConstructorZoneActions. You can also add multiple scenarios with the items of your interest.
-- Scenarios List: https://wiki.rage.mp/index.php?title=Scenarios

Config.ScenarioProgressBars       = true                                                                                                                                     -- To use progress bars while peforming action.
Config.ScenarioTime               = 10000                                                                                                                                    -- Timer is in milliseconds, 10000 = 10 Seconds.

Config.ConstructionBlip           = { title = "Construction Area", colour=17, scale = 1.0, id=566, x = -96.96, y = -1013.6, z = 27.28 }

Config.SendToDiscord              = false                                                                                                                                    -- Set to true if you want to send logs when a player is trying to cheat / inject events.
Config.DISCORD_NAME               = "[MY SERVER NAME]"                                                                                                                       -- Insert your discord server name, example: [MY SERVER]
Config.DISCORD_IMAGE              = "https://i.imgur.com/xxxxxx.png"                                                                                                         -- Insert your discord logo image, example: https://i.imgur.com/xxxxxx.png
Config.DISCORD_WEBHOOK_LOGS_CH    = "https://discord.com/api/webhooks/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"                         -- Insert the discord channel webhook that you have created for sending logs when a player is trying to cheat / inject events.

Config.DISCORD_LOG_TEXT_TITLE     = "[Constructors]"                                                                                                                         -- Insert the title text when a new message sent in the followed webhook channel.
Config.FOOTER_TEXT                = "© Your Server Name - Support Team"                                                                                                      -- Insert the footer text when a new message sent in the followed webhook channel.

Config.ConstructionGradesManagement = {

	['worker'] = {
		actionsPayment = math.random(20, 35),
		actionsNextPromotion = 30,
		actionsNextPromotionGrade = 1,
	},

	['supervisor'] = {
		actionsPayment = math.random(35, 50),
		actionsNextPromotion = 70,
		actionsNextPromotionGrade = 2,
	},

	['contractor'] = {
		actionsPayment = math.random(45, 70),
		actionsNextPromotion = 0,
		actionsNextPromotionGrade = nil,
	},
}

Config.ConstructorZoneActions = { 

	CloakroomActions = {
		Pos   = {x = -97.16, y = -1013.84, z = 27.50},
		Size  = {x = 1.0, y = 1.0, z = 1.0},
		Color = {r = 255, g = 140, b = 0},
		Type  = 20, 
		Rotate = true,
		Action = "constructor_cloakroom_menu",
		ActionMsg  = _U('press_to_open')
	},

	HammerA = {
		Pos   = {x = -146.6, y = -1034.96, z = 27.28},
		Teleport = {coords = vector3(-146.6, -1034.96, 26.30)},
		Heading = 343.12,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 69, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_HAMMERING",
		ActionMsg  = _U('press_to_work')
	},

	HammerB = {
		Pos   = {x = -136.28, y = -1005.84, z = 27.28},
		Teleport = {coords = vector3(-136.28, -1005.84, 26.28)},
		Heading = 159.68,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 69, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_HAMMERING",
		ActionMsg  = _U('press_to_work')
	},

	HammerC = {
		Pos   = {x = -166.8, y = -990.68, z = 21.28},
		Teleport = {coords = vector3(-166.8, -990.68, 20.28)},
		Heading = 75.6,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 69, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_HAMMERING",
		ActionMsg  = _U('press_to_work')
	},

	HammerD = {
		Pos   = {x = -159.68, y = -1087.04, z = 18.68},
		Teleport = {coords = vector3(-159.68, -1087.04, 17.68)},
		Heading = 348.36,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 69, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_HAMMERING",
		ActionMsg  = _U('press_to_work')
	},

	HammerE = {
		Pos   = {x = -167.16, y = -1052.72, z = 18.68},
		Teleport = {coords = vector3(-167.16, -1052.72, 17.68)},
		Heading = 83.84,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 69, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_HAMMERING",
		ActionMsg  = _U('press_to_work')
	},

	DrillA = {
		Pos   = {x = -127.84, y = -1097.92, z = 21.68},
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_CONST_DRILL",
		ActionMsg  = _U('press_to_work')
	},

	DrillB = {
		Pos   = {x = -157.36, y = -1100.28, z = 13.12},
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_CONST_DRILL",
		ActionMsg  = _U('press_to_work')
	},

	DrillC = {
		Pos   = {x = -149.44, y = -1096.88, z = 13.12},
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_CONST_DRILL",
		ActionMsg  = _U('press_to_work')
	},

	DrillD = {
		Pos   = {x = -149.12, y = -976.56, z = 21.28},
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_CONST_DRILL",
		ActionMsg  = _U('press_to_work')
	},

	DrillE = {
		Pos   = {x = -99.92, y = -967.6, z = 21.28},
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 0},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_CONST_DRILL",
		ActionMsg  = _U('press_to_work')
	},

	WeldingA = {
		Pos   = {x = -114.68, y = -1037.08, z = 27.32},
		Teleport = {coords = vector3(-114.68, -1037.08, 26.34)},
		Heading = 22.96,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 255},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_WELDING",
		ActionMsg  = _U('press_to_work')
	},

	WeldingB = {
		Pos   = {x = -123.28, y = -975.12, z = 27.28},
		Teleport = {coords = vector3(-123.28, -975.12, 26.28)},
		Heading = 254.12,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 255},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_WELDING",
		ActionMsg  = _U('press_to_work')
	},

	WeldingC = {
		Pos   = {x = -207.32, y = -1114.96, z = 22.88},
		Teleport = {coords = vector3(-207.32, -1114.96, 21.88)},
		Heading = 261.48,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 255},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_WELDING",
		ActionMsg  = _U('press_to_work')
	},

	WeldingD = {
		Pos   = {x = -114.88, y = -1036.28, z = 69.8},
		Teleport = {coords = vector3(-114.88, -1036.28, 68.8)},
		Heading = 112.12,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 255},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_WELDING",
		ActionMsg  = _U('press_to_work')
	},

	WeldingE = {
		Pos   = {x = -108.4, y = -1053.24, z = 73.36},
		Teleport = {coords = vector3(-108.4, -1053.24, 72.36)},
		Heading = 232.72,
		Size  = {x = 0.5, y = 1.0, z = 0.5},
		Color = {r = 255, g = 0, b = 255},
		Type  = 42, 
		Rotate = true,
		Action = "WORLD_HUMAN_WELDING",
		ActionMsg  = _U('press_to_work')
	},

}

Config.Uniforms = {
	worker = {
		male = {
			['tshirt_1'] = 15,      ['tshirt_2'] = 0,
			['torso_1'] = 73,       ['torso_2'] = 0,
            ['decals_1'] = -2,      ['decals_2'] = 0,
            ['watches_1'] = -1,     ['watches_2'] = -1,
            ['bracelets_1'] = -1,   ['bracelets_2'] = -1,
			['arms'] = 63,
			['pants_1'] = 53,       ['pants_2'] = 0,
			['shoes_1'] = 25,       ['shoes_2'] = 0,
			['chain_1'] = -1,       ['chain_2'] = 0,
			['ears_1'] = -2,        ['ears_2'] = 0,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['bproof_1'] = 3,      ['bproof_2'] = 0,
			['helmet_1'] = 25,      ['helmet_2'] = 0
		},
		female = { -- hairstyle 33, hands 159, legs 56, shoes 27, shirt 15, 68 overlay, hats 62
			['hair_1'] = 32,        ['hair_2'] = 0,
		    ['tshirt_1'] = 14,      ['tshirt_2'] = 0,
			['torso_1'] = 73,       ['torso_2'] = 0,
            ['decals_1'] = -2,      ['decals_2'] = 0,
            ['watches_1'] = -1,     ['watches_2'] = -1,
            ['bracelets_1'] = -1,   ['bracelets_2'] = -1,
			['arms'] = 158,
			['pants_1'] = 55,       ['pants_2'] = 0,
			['shoes_1'] = 26,       ['shoes_2'] = 0,
			['chain_1'] = -1,       ['chain_2'] = 0,
			['ears_1'] = -1,        ['ears_2'] = 0,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['bproof_1'] = -1,      ['bproof_2'] = 0,
			['helmet_1'] = 60,      ['helmet_2'] = 4
		}
	},

	supervisor = { -- hands 67, pants 40 - 2, shoes 25, armor 11 - 4, jacket 67 - 2
		male = {
			['tshirt_1'] = 15,   ['tshirt_2'] = 0,
			['torso_1'] = 66,    ['torso_2'] = 2,
            ['decals_1'] = -2,   ['decals_2'] = 0,
            ['watches_1'] = -1,   ['watches_2'] = -1,
            ['bracelets_1'] = -1,   ['bracelets_2'] = -1,
			['arms'] = 66,
			['pants_1'] = 39,    ['pants_2'] = 2,
			['shoes_1'] = 24,    ['shoes_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -2,     ['ears_2'] = 0,
			['glasses_1'] = -1, ['glasses_2'] = 0,
			['bproof_1'] = 10,   ['bproof_2'] = 4,
			['helmet_1'] = 25,  ['helmet_2'] = 2
		},
		female = { -- hairstyle 33, hands 159, legs 56, shoes 27, shirt 15, 68 overlay, hats 62
			['hair_1'] = 32,        ['hair_2'] = 0,
		    ['tshirt_1'] = 14,      ['tshirt_2'] = 0,
			['torso_1'] = 67,       ['torso_2'] = 0,
            ['decals_1'] = -2,      ['decals_2'] = 0,
            ['watches_1'] = -1,     ['watches_2'] = -1,
            ['bracelets_1'] = -1,   ['bracelets_2'] = -1,
			['arms'] = 158,
			['pants_1'] = 55,       ['pants_2'] = 0,
			['shoes_1'] = 26,       ['shoes_2'] = 0,
			['chain_1'] = -1,       ['chain_2'] = 0,
			['ears_1'] = -1,        ['ears_2'] = 0,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['bproof_1'] = -1,      ['bproof_2'] = 0,
			['helmet_1'] = 60,      ['helmet_2'] = 3
		},
	},

	contractor = { -- hands 67, pants 40 - 2, shoes 25, armor 11 - 4, jacket 67 - 2
		male = {
			['tshirt_1'] = 15,   ['tshirt_2'] = 0,
			['torso_1'] = 66,    ['torso_2'] = 1,
            ['decals_1'] = -2,   ['decals_2'] = 0,
            ['watches_1'] = -1,   ['watches_2'] = -1,
            ['bracelets_1'] = -1,   ['bracelets_2'] = -1,
			['arms'] = 66,
			['pants_1'] = 39,    ['pants_2'] = 1,
			['shoes_1'] = 24,    ['shoes_2'] = 0,
			['chain_1'] = -1,    ['chain_2'] = 0,
			['ears_1'] = -2,     ['ears_2'] = 0,
			['glasses_1'] = -1, ['glasses_2'] = 0,
			['bproof_1'] = 10,   ['bproof_2'] = 4,
			['helmet_1'] = 25,  ['helmet_2'] = 1
		},
		female = { -- hairstyle 33, hands 159, legs 56, shoes 27, shirt 15, 68 overlay, hats 62
			['hair_1'] = 32,        ['hair_2'] = 0,
		    ['tshirt_1'] = 14,      ['tshirt_2'] = 0,
			['torso_1'] = 67,       ['torso_2'] = 0,
            ['decals_1'] = -2,      ['decals_2'] = 0,
            ['watches_1'] = -1,     ['watches_2'] = -1,
            ['bracelets_1'] = -1,   ['bracelets_2'] = -1,
			['arms'] = 158,
			['pants_1'] = 55,       ['pants_2'] = 0,
			['shoes_1'] = 26,       ['shoes_2'] = 0,
			['chain_1'] = -1,       ['chain_2'] = 0,
			['ears_1'] = -1,        ['ears_2'] = 0,
			['glasses_1'] = -1,     ['glasses_2'] = 0,
			['bproof_1'] = -1,      ['bproof_2'] = 0,
			['helmet_1'] = 60,      ['helmet_2'] = 2
		}
	}
}