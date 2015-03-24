fs    = require 'fs'
nconf = require 'nconf'

logger = require '../lib/logger'

app_conf = require './app'
auth_conf = require './auth'
docker_conf  = require './docker'
mongodb_conf = require './mongodb'


nconf.use 'memory'
nconf.argv()
nconf.env()


# Load external configuration files
nconf.set 'app', app_conf
nconf.set 'auth', auth_conf
nconf.set 'docker', docker_conf
nconf.set 'mongodb', mongodb_conf

logger.info 'Loaded configuration settings'

# Save configuration before proceeding
nconf.save (err) ->
  return logger.error err.message if err
  logger.info 'Configuration saved successfully'

