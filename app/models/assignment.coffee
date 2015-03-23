mongoose = require 'mongoose'


AssignmentSchema = new mongoose.Schema
  name: 
    type: String
    required: true
  
  visible: 
    type: Boolean
    default: true

  created:
    type: Date
    default: Date.now

  deadline:
    type: Date
    required: true

  problems: [{type: mongoose.Schema.Types.ObjectId, ref: 'Problem'}]


Assignment = mongoose.model 'Assignment', AssignmentSchema
module.exports = Assignment
