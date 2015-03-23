mongoose = require 'mongoose'
nconf    = require 'nconf'

node_env = nconf.get 'NODE_ENV'
database = nconf.get 'mongodb:uri:' + node_env

mongoose.connect database, (err) ->
  logger.error "Error connecting to database" if err


