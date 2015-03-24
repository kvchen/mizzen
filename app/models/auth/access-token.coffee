mongoose = require 'mongoose'


AccessTokenSchema = new mongoose.Schema
  userID:
    type: String
    required: true
  
  clientID: 
    type: String
    required: true

  token:
    type: String
    unique: true
    required: true

  created:
    type: Date
    default: Date.now


AccessToken = mongoose.model 'AccessToken', AccessTokenSchema
module.exports = AccessToken
