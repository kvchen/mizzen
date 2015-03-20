router = require('express').Router()


problems    = require './problems'
submissions = require './submissions'
users       = require './users'


# Define API endpoints
router.use '/problems', problems
router.use '/submissions', submissions
router.use '/users', users

module.exports = router