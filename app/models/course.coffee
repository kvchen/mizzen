mongoose = require 'mongoose'


CourseSchema = new mongoose.Schema
  name:
    type: String
    required: true

  active:
    type: Boolean
    default: true

  assignments: [{type: mongoose.Schema.Types.ObjectId, ref: 'Assignment'}]


Course = mongoose.model 'Course', CourseSchema
module.exports = Course
