default['gocd']['server']['version'] = '14.4.0-1356'
default['gocd']['server']['http_port']    = '8153'
default['gocd']['server']['https_port']   = '8154'
default['gocd']['server']['max_mem']      = '2048m'
default['gocd']['server']['min_mem']      = '1024m'
default['gocd']['server']['max_perm_gen'] = '400m'

default['gocd']['server']['host'] = 'localhost'

# GoCD appends /bin/java to this.
default['java']['home'] = '/usr'

# For auto registration of agents.
default['gocd']['registration_key'] = ''

default['gocd']['agent']['version'] = '14.4.0-1356'

# Default agent options when it autoregisters.
default['gocd']['agent']['resources'] = []
default['gocd']['agent']['environments'] = []
