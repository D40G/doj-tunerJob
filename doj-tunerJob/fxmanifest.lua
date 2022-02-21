
-- fx_version 'adamant'

description 'doj-tunerJob'

fx_version 'cerulean'


game 'gta5'

client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua',
	'config.lua',
	'client/chop/*.lua',
	'client/work-menus/*.lua',
	
	'client/extras/*.lua',
	'client/extras/check_tunes/*.lua',
	'client/upgrades/*.lua',

	'client/cosmetics/*.lua',
	'client/cosmetics/windows/*.lua',
	'client/cosmetics/underglow/*.lua',
	'client/cosmetics/headlights/*.lua',
}

server_scripts {
	'server/*.lua'
} 

lua54 'yes'