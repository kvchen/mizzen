router = require('express').Router()

apiResponse = require './api-response'


courses     = require './courses'
assignments = require './assignments'
oauth       = require './oauth'
problems    = require './problems'
submissions = require './submissions'
users       = require './users'


# Define API endpoints
router.use '/oauth', oauth

router.use '/courses', courses
router.use '/assignments', assignments
router.use '/problems', problems
router.use '/submissions', submissions
router.use '/users', users

router.use apiResponse.error
router.use apiResponse.response

module.exports = router