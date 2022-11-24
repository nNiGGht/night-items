fx_version 'adamant'
games { 'gta5' }

client_scripts {
	'client.lua',
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server.lua'
}

dependencies {
    'mysql-async',
    'es_extended'
}