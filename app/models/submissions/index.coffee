mongoose = require 'mongoose'
Schema = mongoose.Schema

submissionSchema = new Schema
  _id: Schema.Types.ObjectId
  name: String
  private: Boolean

  created:
    type: Date
    default: Date.now

  updated:
    type: Date
    default: Date.now

  sourceCode: 
    type: String
    required: true

  language: 
    type: Number
    required: true

  run: 
    type: Boolean
    default: true

  input: String


Submission = mongoose.model 'Submission', submissionSchema
module.exports = Submission
