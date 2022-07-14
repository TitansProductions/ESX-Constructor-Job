fx_version 'bodacious'
games { 'gta5' }

author 'Nosmakos | The Owls'
description 'ESX Constructors Job'
version '1.3.0'

ui_page 'html/ui.html'

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'locales/gr.lua',
	'config.lua',
	'client/progressBars.lua',
	'client/main.lua'
}

server_scripts {
	'@es_extended/locale.lua',
	"@mysql-async/lib/MySQL.lua",
	'locales/en.lua',
	'locales/gr.lua',
	'config.lua',
	'server/main.lua'
}
  
files {
    'html/ui.html'
}

dependency 'es_extended'
