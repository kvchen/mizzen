express = require "express"
logger  = require "./lib/logger"


# Instantiate the Express app with default settings
app = express()

app.set "port", process.env.PORT or 3000
app.set "views", __dirname + "/views"
app.set "view engine", "jade"

app.disable "x-powered-by"


# Export app for other modules to use
module.exports = app