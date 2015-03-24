oauth2 = require '../../auth/oauth2'
router = require('express').Router()

router.post '/token', oauth2.token

module.exports = router

