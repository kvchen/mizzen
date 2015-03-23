router = require('express').Router()

error = require '../../lib/response'

# courses     = require './courses'
assignments = require './assignments'
problems    = require './problems'
submissions = require './submissions'
users       = require './users'


# Define API endpoints
# router.use '/courses', courses
router.use '/assignments', assignments
router.use '/problems', problems
router.use '/submissions', submissions
router.use '/users', users

router.use error.apiErrorHandler

module.exports = router