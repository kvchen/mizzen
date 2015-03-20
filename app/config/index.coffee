fs    = require 'fs'
nconf = require 'nconf'

logger = require '../lib/logger'

mongodb_conf = require './mongodb'
docker_conf  = require './docker'


nconf.use 'memory'
nconf.argv()
nconf.env()


# Load external configuration files
nconf.set 'docker', docker_conf
nconf.set 'mongodb', mongodb_conf

logger.info 'Loaded configuration settings'

# Save configuration before proceeding
nconf.save (err) ->
  return logger.error err.message if err
  logger.info 'Configuration saved successfully'

