apiErrorFormatter = (err, req, res, next) ->
  res.json
    ok: false
    error: err.message


apiResponseFormatter = (req, res, next) ->
  res.json
    ok: true
    data: req.resource


module.exports.error = apiErrorFormatter
module.exports.response = apiResponseFormatter


