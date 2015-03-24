bodyParser   = require 'body-parser'
coffeescript = require 'connect-coffee-script'
express      = require 'express'
mongoose     = require 'mongoose'
nconf        = require 'nconf'
passport     = require 'passport'

# Initialize config, auth, and database settings
require './auth'
require './config'
require './lib/db'

logger = require './lib/logger'
routes = require './routes'


# Instantiate the Express app with default settings
app = express()
app.use passport.initialize()
app.use passport.session()


app.use bodyParser.urlencoded
  extended: false
app.use bodyParser.json()

app.use coffeescript
  src: __dirname + "/public/assets"
  bare: true

app.set "port", process.env.PORT or nconf.get 'app:port'
app.set "views", __dirname + "/public/views"
app.set "view engine", "jade"

app.disable "x-powered-by"


# Include static files
app.use express.static __dirname + "/public/assets"


# Define routers
app.use '/', routes.app
app.use '/api', 
  passport.authenticate 'bearer', { session: false }
  routes.api


# Export app for other modules to use
module.exports = app


