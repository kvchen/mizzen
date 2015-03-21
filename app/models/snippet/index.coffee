mongoose = require 'mongoose'


SnippetSchema = new mongooseSchema
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


Snippet = mongoose.model 'Snippet', SnippetSchema
module.exports = Snippet
