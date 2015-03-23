logger = require './logger'

apiErrorHandler = (err, req, res, next) ->
  res.json
    'ok': false, 
    'error': err

module.exports.apiErrorHandler = apiErrorHandler


