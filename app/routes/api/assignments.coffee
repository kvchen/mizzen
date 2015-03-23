router = require('express').Router()

logger = require '../../lib/logger'
Assignment = require '../../models/assignment'


# Creates a new assignment
router.post '/create', (req, res, next) ->
  assignment = new Assignment
    name: req.body.name
    published: req.body.published
    deadline: req.body.deadline

  assignment.save (err) ->
    return next err if err

    logger.info 'Created new assignment ' + assignment._id
    res.json 
      'ok': true
      'assignment': assignment

# Updates an assignment
router.post '/update/:id', (req, res) ->
  res.send 'update assignment'

# Returns assignment details
router.get '/show/:id', (req, res, next) ->
  Assignment.findById req.params.id, (err, assignment) ->
    return next err if err
    res.json JSON.stringify(assignment)

# Deletes an assignment from the database
router.post '/destroy/:id', (req, res) ->
  res.send 'destroy assignment'


module.exports = router


