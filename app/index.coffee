bodyParser = require 'body-parser'
express    = require 'express'
mongoose   = require 'mongoose'
nconf      = require 'nconf'
passport   = require 'passport'

# Initialize config, auth, and database settings
require './config'
require './lib/db'


logger = require './lib/logger'
routes = require './routes'


# Instantiate the Express app with default settings
app = express()
app.use bodyParser.urlencoded
  extended: false
app.use bodyParser.json()


app.use passport.initialize()
app.use passport.session()


app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/public/views"
app.set "view engine", "jade"

app.disable "x-powered-by"


# Include static files
app.use express.static __dirname + "/public/assets"


# Define API endpoints
app.use '/', routes.landing
app.use '/api', routes.api


# Export app for other modules to use
module.exports = app


