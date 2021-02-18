fx_version 'cerulean'
game 'gta5'

author 'NRTnarathip'
description 'Testla Car'
version '0.1.0'

server_scripts {
    '@es_extended/locale.lua',
    'server/server.lua',
    'config.lua',
    'functions.lua'
}

client_scripts {
    '@es_extended/locale.lua',  
    'client/client.lua',
    'config.lua',
    'functions.lua'
}

dependencies {
	'es_extended'
}
