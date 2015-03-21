mongoose = require 'mongoose'


CourseSchema = new mongoose.Schema
  name:
    type: String
    required: true

  problems: [{type: mongoose.Schema.Types.ObjectId, ref: 'Problem'}]


Course = mongoose.model 'Course', CourseSchema
module.exports = Course
