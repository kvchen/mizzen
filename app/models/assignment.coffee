mongoose = require 'mongoose'


AssignmentSchema = new mongoose.Schema
  name: 
    type: String
    required: true

  description:
    type: String

  owner:
    type: mongoose.Schema.Types.ObjectId
    ref: 'User'
  
  visible: 
    type: Boolean
    default: true

  created:
    type: Date
    default: Date.now

  updated:
    type: Date
    default: Date.now

  deadline:
    type: Date

  problems: [
    type: mongoose.Schema.Types.ObjectId
    ref: 'Problem'
  ]



AssignmentSchema.pre 'save', (next) ->
  this.updated = new Date()
  next()



Assignment = mongoose.model 'Assignment', AssignmentSchema
module.exports = Assignment
