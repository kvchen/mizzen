router = require('express').Router()
nconf = require 'nconf'

router.get '/', (req, res) ->
  res.render 'landing'

module.exports = router


