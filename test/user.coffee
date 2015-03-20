nconf = require 'nconf'

app = require '../app'

console.log nconf.get 'mongodb'

# mongoose = require 'mongoose'
# mongoose.connect 'mongodb://localhost/myDB'

