logger = require './logger'

apiResponseFormatter = (err, req, res, next) ->
  if err
    res.json 
      ok: false
      error: err.message
  else
    res.json
      ok: true
      req.payload

module.exports.apiResponseFormatter = apiResponseFormatter


