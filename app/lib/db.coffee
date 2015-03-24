mongoose = require 'mongoose'
nconf    = require 'nconf'

logger = require './logger'


node_env = nconf.get 'NODE_ENV'
if not node_env
  node_env = 'dev'

db_uri = nconf.get 'mongodb:uri:' + node_env

mongoose.connect db_uri, (err) ->
  logger.error "Failed to connect to database" if err


process.on 'SIGINT', ->
  mongoose.connection.close ->
    logger.info 'Closing mongoose connection'
    process.exit 0


