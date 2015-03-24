router = require('express').Router()

logger = require '../../lib/logger'
Assignment = require '../../models/assignment'


assignmentDetails = (assignment) ->
  details = 
    id: assignment.id
    name: assignment.name
    description: assignment.description
    owner: assignment.owner
    visible: assignment.visible

    created: assignment.created
    updated: assignment.updated
    deadline: assignment.deadline

  return details


# Creates a new assignment
router.post '/create', (req, res, next) ->
  assignment = new Assignment
    name: req.body.name
    published: req.body.published
    deadline: req.body.deadline

  assignment.save (err) ->
    return next err if err

    logger.info 'Created new assignment ' + assignment._id
    req.resource = assignmentDetails assignment

    next()


# Updates an assignment
router.post '/update/:id', (req, res) ->
  res.send 'update assignment'

# Returns assignment details
router.get '/show/:id', (req, res, next) ->
  Assignment.findById req.params.id, (err, assignment) ->
    return next err if err
    req.resource = assignmentDetails assignment

    next()

# Deletes an assignment from the database
router.post '/destroy/:id', (req, res) ->
  res.send 'destroy assignment'


module.exports = router


