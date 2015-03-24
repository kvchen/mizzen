router = require('express').Router()

# Define app view endpoints
router.get '/', (req, res, next) ->
  res.render 'landing'

router.get '/login', (req, res, next) ->
  res.render 'login'

router.get '/signup', (req, res, next) ->
  res.render 'signup'


module.exports = router