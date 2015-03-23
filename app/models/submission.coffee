mongoose = require 'mongoose'


SubmissionSchema = new mongoose.Schema
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


Submission = mongoose.model 'Submission', SubmissionSchema
module.exports = Submission
