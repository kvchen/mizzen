router = require('express').Router()


# Returns all submissions for the user
router.get '/', (req, res) ->
  res.send 'get all submissions'


# Creates a new submission
router.post '/create', (req, res) ->
  res.send 'create new submission'


# Returns submission status
router.get '/status/:id', (req, res) ->
  res.send 'show submission status'


# Returns submission details
router.get '/show/:id', (req, res) ->
  res.send 'testing'

# Updates a submission
router.post '/update/:id', (req, res) ->
  res.send 'update submission'


# Deletes a submission from the database
router.post '/destroy/:id', (req, res) ->
  res.send 'destroy submission'


module.exports = router


